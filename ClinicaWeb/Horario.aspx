<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horario.aspx.cs" Inherits="ClinicaWeb.Horario" %>

<asp:Content ID="contentHeaderHorario" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINIASTRACION DE HORARIOS</a>
        </div>
    </div>
    <br />
    <br />
    <hr />
    <div>
        <a  href="Turnos.aspx" style="width: 40%">Administrar Turnos</a>
        <a  href="Medico.aspx" style="width: 40%">Administrar Medicos</a>
        <a  href="Paciente.aspx" style="width: 40%">Administrar Pacientes</a>
        <a  href="Persona.aspx" style="width: 40%">Administrar Personas</a>
        <a  href="Usuario.aspx" style="width: 40%">Administrar Usuarios</a>
        <a  href="Especialidad.aspx" style="width: 40%">Administrar Especialidades</a>
        <a  href="Horario.aspx" style="width: 40%">Administrar Horarios</a>
    </div>
    <hr/>

</asp:Content>


<asp:Content ID="contentBodyHorario" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Administracion de Horarios</p>

    </div>
    <hr/>

</asp:Content>

<asp:Content ID="contentFooterHorario" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr/>

</asp:Content>
