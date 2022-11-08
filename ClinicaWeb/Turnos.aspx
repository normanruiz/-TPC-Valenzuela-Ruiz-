<%@ Page Title="Turnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="ClinicaWeb.Turnos" %>

<asp:Content ID="contentHeaderTurnos" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINISTRACIÓN DE TURNOS</a>
        </div>
    </div>
    <br />
    <br />
    <hr />
    <div>
        <a href="Turnos.aspx" style="width: 40%">Administrar Turnos</a>
        <a href="Medico.aspx" style="width: 40%">Administrar Médicos</a>
        <a href="Paciente.aspx" style="width: 40%">Administrar Pacientes</a>
        <a href="Persona.aspx" style="width: 40%">Administrar Personas</a>
        <a href="Usuario.aspx" style="width: 40%">Administrar Usuarios</a>
        <a href="Especialidades.aspx" style="width: 40%">Administrar Especialidades</a>
        <a href="Horarios.aspx" style="width: 40%">Administrar Horarios</a>
        <a href="Estados.aspx" style="width: 40%">Administrar Estados</a>
    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentBodyTurnos" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container text-center">
        <p class="fw-semibold" style="font-size: 30px">Administración de Turnos</p>
        <asp:Button ID="ButtonNuevoTurno" runat="server" Text="Nuevo Turno" OnClick="ButtonNuevoTurno_Click" CssClass="btn btn-primary" />
        <asp:GridView ID="gdvTurnos" runat="server">
        </asp:GridView>

    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentFooterTurnos" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>
