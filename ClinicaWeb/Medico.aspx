<%@ Page Title="ABM Médico" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="ClinicaWeb.Medico" %>

<asp:Content ID="contentHeaderMedico" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINISTRACIÓN DE MÉDICOS</a>
        </div>
    </div>
    <br />
    <br />
    <hr />
    <div>
        <a  href="Turnos.aspx" style="width: 40%">Administrar Turnos</a>
        <a  href="Medico.aspx" style="width: 40%">Administrar Médicos</a>
        <a  href="Paciente.aspx" style="width: 40%">Administrar Pacientes</a>
        <a  href="Persona.aspx" style="width: 40%">Administrar Personas</a>
        <a  href="Usuario.aspx" style="width: 40%">Administrar Usuarios</a>
        <a  href="Especialidades.aspx" style="width: 40%">Administrar Especialidades</a>
        <a  href="Horarios.aspx" style="width: 40%">Administrar Horarios</a>
    </div>
    <hr/>

</asp:Content>


<asp:Content ID="contentBodyMedico" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Administración de Médicos</p>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-primary"/>
        <asp:GridView ID="dgvMedicos" runat="server" CssClass="table table-bordered table-light" >
        </asp:GridView>
    </div>
    <hr/>

</asp:Content>

<asp:Content ID="contentFooterMedico" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr/>

</asp:Content>
