
using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Parcial2_LP3
{
    public partial class Documentos : System.Web.UI.Page
    {
        private const int TAMANO_MAXIMO = 5 * 1024 * 1024;

        private readonly string[] extensionesPermitidas =
        {
            ".pdf", ".doc", ".docx", ".jpg", ".jpeg", ".png"
        };

        private string ObtenerCarpetaUsuario()
        {
            string usuario = Session["Usuario"].ToString();

            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = sha.ComputeHash(
                    Encoding.UTF8.GetBytes(usuario));

                string identificador = BitConverter.ToString(bytes)
                    .Replace("-", "").Substring(0, 20);

                return Server.MapPath(
                    "~/Archivos/" + identificador);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Autenticado"] == null ||
                !(bool)Session["Autenticado"] ||
                Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblUsuario.Text =
                    "Usuario: " + Session["Usuario"].ToString();

                CargarDocumentos();
            }
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            if (!fuDocumento.HasFile)
            {
                lblMensaje.Text = "Seleccioná un archivo.";
                lblMensaje.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            
            if (fuDocumento.PostedFile.ContentLength > TAMANO_MAXIMO)
            {
                lblMensaje.Text =
                    "El archivo supera el tamaño máximo de 5 MB.";

                lblMensaje.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            
            string extension = Path.GetExtension(
                fuDocumento.FileName).ToLowerInvariant();

            if (!extensionesPermitidas.Contains(extension))
            {
                lblMensaje.Text =
                    "El formato del archivo no está permitido.";

                lblMensaje.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            
            string carpeta = ObtenerCarpetaUsuario();

            if (!Directory.Exists(carpeta))
            {
                Directory.CreateDirectory(carpeta);
            }


            string nombreArchivo =
                Guid.NewGuid().ToString("N") + extension;

            string rutaCompleta =
                Path.Combine(carpeta, nombreArchivo);

            fuDocumento.SaveAs(rutaCompleta);

            lblMensaje.Text =
                "¡Documento cargado correctamente!";

            lblMensaje.ForeColor =
                System.Drawing.Color.Green;

            CargarDocumentos();
        }


        private void CargarDocumentos()
        {
            string carpeta = ObtenerCarpetaUsuario();

            if (!Directory.Exists(carpeta))
            {
                gvDocumentos.DataSource = null;
                gvDocumentos.DataBind();
                return;
            }

            string[] archivos = Directory.GetFiles(carpeta);

            var documentos = archivos.Select(archivo => new
            {
                Nombre = Path.GetFileName(archivo)
            }).ToList();

            gvDocumentos.DataSource = documentos;
            gvDocumentos.DataBind();
        }

        protected void gvDocumentos_RowCommand(
            object sender,
            System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                string nombreArchivo = Convert.ToString(e.CommandArgument);

                if (string.IsNullOrWhiteSpace(nombreArchivo) ||
                    Path.GetFileName(nombreArchivo) != nombreArchivo)
                {
                    return;
                }

               
                string carpeta = ObtenerCarpetaUsuario();

                string rutaArchivo = Path.Combine(
                    carpeta, nombreArchivo);

                
                if (!File.Exists(rutaArchivo))
                {
                    lblMensaje.Text = "El documento no existe.";
                    lblMensaje.ForeColor =
                        System.Drawing.Color.Red;
                    return;
                }

                
                Response.Clear();
                Response.ContentType = "application/octet-stream";

                Response.AddHeader(
                    "Content-Disposition",
                    "attachment; filename=\"" + nombreArchivo + "\"");

                Response.TransmitFile(rutaArchivo);
                Response.End();
            }
        }
    }
}

