<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Parcial2_LP3.Login" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="HeadContent"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="login-container">

        <div class="login-header">

            <h1>Iniciar sesión</h1>

            <p>Ingresá tus datos para acceder a tu cuenta.</p>

        </div>

        <div class="login-formulario">

            <div class="campo">

                <label>Nombre de usuario</label>

                <asp:TextBox ID="txtUsuarioLogin"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Tu nombre de usuario">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvUsuarioLogin"
                    runat="server"
                    ControlToValidate="txtUsuarioLogin"
                    ErrorMessage="Ingresá tu usuario."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>

            <div class="campo">

                <label>Contraseña</label>

                <asp:TextBox ID="txtPasswordLogin"
                    runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="Tu contraseña">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvPasswordLogin"
                    runat="server"
                    ControlToValidate="txtPasswordLogin"
                    ErrorMessage="Ingresá tu contraseña."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>

            <asp:Button ID="btnIngresar"
                runat="server"
                Text="Ingresar"
                CssClass="btn-registrar"
                OnClick="btnIngresar_Click" />

            <asp:Label ID="lblMensajeLogin"
                runat="server">
            </asp:Label>

            <div class="login-registro">

                <p>¿Todavía no tenés una cuenta?</p>

                <a href="Registro.aspx">Registrarme</a>

            </div>
        </div>
    </div>
</asp:Content>

