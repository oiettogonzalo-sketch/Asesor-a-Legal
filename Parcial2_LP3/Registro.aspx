<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Parcial2_LP3.Registro" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="HeadContent"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="registro-container">

        <div class="registro-header">

            <h1>Crear una cuenta</h1>

            <p>
                Registrate para acceder a nuestros servicios
                y gestionar tus documentos legales.
            </p>

        </div>

        <div class="registro-formulario">

            <div class="campo">
                <label>Correo electrónico</label>

                <asp:TextBox ID="txtCorreo" runat="server"
                    TextMode="Email"
                    CssClass="form-control"
                    placeholder="ejemplo@correo.com">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvCorreo"
                    runat="server"
                    ControlToValidate="txtCorreo"
                    ErrorMessage="El correo es obligatorio."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator
                    ID="revCorreo"
                    runat="server"
                    ControlToValidate="txtCorreo"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    ErrorMessage="Ingresá un correo válido."
                    ForeColor="Red">
                </asp:RegularExpressionValidator>
            </div>


            <div class="campo">
                <label>Nombre de usuario</label>

                <asp:TextBox ID="txtUsuario" runat="server"
                    CssClass="form-control"
                    placeholder="Nombre de usuario">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvUsuario"
                    runat="server"
                    ControlToValidate="txtUsuario"
                    ErrorMessage="El usuario es obligatorio."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>


            <div class="campo">
                <label>Edad</label>

                <asp:TextBox ID="txtEdad" runat="server"
                    TextMode="Number"
                    CssClass="form-control"
                    placeholder="Edad">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvEdad"
                    runat="server"
                    ControlToValidate="txtEdad"
                    ErrorMessage="La edad es obligatoria."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

                <asp:RangeValidator
                    ID="rvEdad"
                    runat="server"
                    ControlToValidate="txtEdad"
                    MinimumValue="16"
                    MaximumValue="120"
                    Type="Integer"
                    ErrorMessage="Debés tener al menos 16 años."
                    ForeColor="Red">
                </asp:RangeValidator>
            </div>


            <div class="campo">
                <label>Nombre</label>

                <asp:TextBox ID="txtNombre" runat="server"
                    CssClass="form-control"
                    placeholder="Nombre">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvNombre"
                    runat="server"
                    ControlToValidate="txtNombre"
                    ErrorMessage="El nombre es obligatorio."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>


            <div class="campo">
                <label>Apellido</label>

                <asp:TextBox ID="txtApellido" runat="server"
                    CssClass="form-control"
                    placeholder="Apellido">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvApellido"
                    runat="server"
                    ControlToValidate="txtApellido"
                    ErrorMessage="El apellido es obligatorio."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>


            <div class="campo">
                <label>Contraseña</label>

                <asp:TextBox ID="txtPassword" runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="Contraseña">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvPassword"
                    runat="server"
                    ControlToValidate="txtPassword"
                    ErrorMessage="La contraseña es obligatoria."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>


            <div class="campo">
                <label>Confirmar contraseña</label>

                <asp:TextBox ID="txtConfirmar" runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="Confirmar contraseña">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvConfirmar"
                    runat="server"
                    ControlToValidate="txtConfirmar"
                    ErrorMessage="Confirmá tu contraseña."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

                <asp:CompareValidator
                    ID="cvPassword"
                    runat="server"
                    ControlToValidate="txtConfirmar"
                    ControlToCompare="txtPassword"
                    ErrorMessage="Las contraseñas no coinciden."
                    ForeColor="Red">
                </asp:CompareValidator>
            </div>


            <asp:Button ID="btnRegistrar"
                runat="server"
                Text="Registrarme"
                CssClass="btn-registrar"
                OnClick="btnRegistrar_Click" />

            <asp:Label ID="lblMensaje" runat="server">
            </asp:Label>

        </div>
    </div>
</asp:Content>

