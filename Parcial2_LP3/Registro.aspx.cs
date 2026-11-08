
using System;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Parcial2_LP3
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string correo = txtCorreo.Text.Trim();
            string usuario = txtUsuario.Text.Trim();
            int edad = Convert.ToInt32(txtEdad.Text);
            string nombre = txtNombre.Text.Trim();
            string apellido = txtApellido.Text.Trim();
            string password = txtPassword.Text;

            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(
                    Encoding.UTF8.GetBytes(password));

                StringBuilder resultado = new StringBuilder();

                foreach (byte b in bytes)
                {
                    resultado.Append(b.ToString("x2"));
                }

                string passwordHash = resultado.ToString();

                Session["Usuario"] = usuario;
                Session["Correo"] = correo;
                Session["Nombre"] = nombre;
                Session["Apellido"] = apellido;
                Session["Edad"] = edad;

                HttpCookie cookie = new HttpCookie(
                    "PasswordUsuario", passwordHash);

                cookie.Expires = DateTime.Now.AddHours(2);
                cookie.HttpOnly = true;
                cookie.Secure = Request.IsSecureConnection;

                Response.Cookies.Add(cookie);
            }

            lblMensaje.Text = "¡Registro realizado correctamente!";
            lblMensaje.ForeColor =
                System.Drawing.Color.Green;

            txtCorreo.Text = "";
            txtUsuario.Text = "";
            txtEdad.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtPassword.Text = "";
            txtConfirmar.Text = "";
        }
    }
}
