<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Especialidades.aspx.cs" Inherits="ClinicaWeb.Especialidades" %>
<asp:Content ID="ContentHeaderEspecialidades" ContentPlaceHolderID="cphHeader" runat="server">
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINISTRACIÓN DE USUARIOS</a>
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
        <a href="Especialidad.aspx" style="width: 40%">Administrar Especialidades</a>
        <a href="Horario.aspx" style="width: 40%">Administrar Horarios</a>
    </div>
    <hr />
</asp:Content>
<asp:Content ID="ContentBodyEspecialidades" ContentPlaceHolderID="cphBody" runat="server">
    <asp:GridView ID="gdEspecialidades" runat="server">
    </asp:GridView>
    <h1>Nueva especialidad</h1>
    <div class="mb-3">
        <label for="InputEspecialidad" class="form-label">Especialidad</label>
        <input type="text" class="form-control" id="InputEmailEspecialidad">
    </div>
    <asp:Button ID="btnGuardarEspecialidad" runat="server" Text="Guardar" CssClass="btn btn-primary"/>
    <asp:Button ID="btnCancelarEspecialidad" runat="server" Text="Cancelar" CssClass="btn btn-primary" />
</asp:Content>
<asp:Content ID="ContentFooterEspecialidades" ContentPlaceHolderID="cphFooter" runat="server">
    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />
</asp:Content>
