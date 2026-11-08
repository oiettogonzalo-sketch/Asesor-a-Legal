<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Parcial2_LP3._Default" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="HeadContent"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <section class="hero">

        <div class="hero-text">

            <span class="subtitulo">ASESORAMIENTO PROFESIONAL</span>

            <h1>
                Tu tranquilidad legal,
                <span>nuestra prioridad.</span>
            </h1>

            <p>
                En Asesoría Legal Global brindamos soluciones
                y asesoramiento jurídico personalizado,
                acompañando a nuestros clientes en cada paso.
            </p>

            <div class="hero-botones">

                <a href="Registro.aspx" class="btn-principal">
                    Registrarme
                </a>

                <a href="Login.aspx" class="btn-secundario">
                    Iniciar sesión
                </a>

            </div>

        </div>

        <div class="hero-imagen">

            <asp:Image
                ID="imgInicio"
                runat="server"
                ImageUrl="~/Imagenes/logo 1.png"
                AlternateText="Asesoría Legal Global" />

        </div>

    </section>


    <section class="servicios">
        <h2>Nuestros servicios</h2>
        <p class="servicios-descripcion">
            Brindamos acompañamiento y asesoramiento
            en diferentes áreas del ámbito legal.
        </p>

        <div class="servicios-contenedor">
            <div class="servicio-card">
                <h3>Asesoramiento legal</h3>
                <p>
                    Orientación profesional para resolver
                    consultas y situaciones jurídicas.
                </p>
            </div>

            <div class="servicio-card">
                <h3>Gestión documental</h3>
                <p>
                    Un espacio personal para cargar,
                    organizar y consultar documentos legales.
                </p>
            </div>

            <div class="servicio-card">
                <h3>Atención personalizada</h3>
                <p>
                    Acompañamiento y seguimiento
                    de las necesidades de cada cliente.
                </p>
            </div>

        </div>
    </section>
</asp:Content>

