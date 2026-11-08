
using System;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Parcial2_LP3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            
            string usuarioGuardado = Session["Usuario"] as string;

            
            HttpCookie cookie = Request.Cookies["PasswordUsuario"];

            if (usuarioGuardado == null || cookie == null)
            {
                lblMensajeLogin.Text =
                    "No existe un registro activo. Registrate nuevamente.";

                lblMensajeLogin.ForeColor =
                    System.Drawing.Color.Red;

                return;
            }

            string usuarioIngresado = txtUsuarioLogin.Text.Trim();
            string passwordIngresado = txtPasswordLogin.Text;

            
            string passwordHash;

            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(
                    Encoding.UTF8.GetBytes(passwordIngresado));

                StringBuilder resultado = new StringBuilder();

                foreach (byte b in bytes)
                {
                    resultado.Append(b.ToString("x2"));
                }

                passwordHash = resultado.ToString();
            }

            if (usuarioIngresado == usuarioGuardado &&
                passwordHash == cookie.Value)
            {
                Session["Autenticado"] = true;

                Response.Redirect("Documentos.aspx");
            }
            else
            {
                lblMensajeLogin.Text =
                    "Usuario o contraseña incorrectos.";

                lblMensajeLogin.ForeColor =
                    System.Drawing.Color.Red;
            }
        }
    }
}
