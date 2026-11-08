
using System;
using System.Web;

namespace Parcial2_LP3
{
    public partial class CerrarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();


            HttpCookie cookie = new HttpCookie("PasswordUsuario");
            cookie.Expires = DateTime.Now.AddDays(-1);
            cookie.HttpOnly = true;
            cookie.Secure = Request.IsSecureConnection;

            Response.Cookies.Add(cookie);


            Response.Redirect("Inicio.aspx");
        }
    }
}
