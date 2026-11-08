<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Documentos.aspx.cs" Inherits="Parcial2_LP3.Documentos" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="HeadContent"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="documentos-container">

        <div class="documentos-header">

            <h1>Mis documentos legales</h1>

            <p>
                Bienvenido a tu espacio personal.
                Desde aquí podés gestionar tus documentos.
            </p>

            <asp:Label ID="lblUsuario"
                runat="server"
                CssClass="usuario-documentos">
            </asp:Label>

        </div>

        <div class="documentos-panel">

            <h2>Subir un documento</h2>

            <p>
                Seleccioná el archivo que deseás almacenar.
            </p>

            <asp:FileUpload ID="fuDocumento"
                runat="server"
                CssClass="form-control" />

            <small>
                Formatos permitidos: PDF, DOC, DOCX, JPG y PNG.
                Tamaño máximo: 5 MB.
            </small>

            <asp:Button ID="btnSubir"
                runat="server"
                Text="Subir documento"
                CssClass="btn-registrar"
                OnClick="btnSubir_Click" />

            <asp:Label ID="lblMensaje"
                runat="server">
            </asp:Label>

        </div>

        <div class="documentos-panel">

            <h2>Mis archivos</h2>

            
<asp:GridView ID="gvDocumentos"
    runat="server"
    AutoGenerateColumns="False"
    CssClass="tabla-documentos"
    GridLines="None"
    EmptyDataText="Todavía no tenés documentos cargados."
    OnRowCommand="gvDocumentos_RowCommand">

    <Columns>

        <asp:BoundField
            DataField="Nombre"
            HeaderText="Documento" />

        <asp:TemplateField HeaderText="Acción">

            <ItemTemplate>

                <asp:LinkButton
                    ID="btnDescargar"
                    runat="server"
                    Text="Descargar"
                    CommandName="Descargar"
                    CommandArgument='<%# Eval("Nombre") %>'
                    CssClass="btn-descargar">
                </asp:LinkButton>

            </ItemTemplate>

        </asp:TemplateField>

    </Columns>

</asp:GridView>


        </div>
    </div>
</asp:Content>

