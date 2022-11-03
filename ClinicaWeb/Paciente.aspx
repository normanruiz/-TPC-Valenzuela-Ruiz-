<%@ Page Title="Nuevo Paciente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Paciente.aspx.cs" Inherits="ClinicaWeb.Paciente" %>


<asp:Content ID="contentHeaderPacientes" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINIASTRACION DE PACIENTES</a>
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
        <a  href="Especialidades.aspx" style="width: 40%">Administrar Especialidades</a>
        <a  href="Horarios.aspx" style="width: 40%">Administrar Horarios</a>
    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentBodyPacientes" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container text-center">
        <p class="fw-semibold" style="font-size: 30px">Administración de Pacientes</p>
        <asp:GridView ID="dgvPacientes" runat="server" CssClass="table table-bordered table-light" >
        </asp:GridView>
    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentFooterPacientes" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>

<%--<asp:Content ID="abmPaciente" ContentPlaceHolderID="MainContent" runat="server">

    <hr />
    <hr />
    <h1>Nuevo paciente</h1>
    <div class="row g-3">
            <label for="inputApellido" class="form-label">Apellido</label>
            <input type="text" class="form-control" id="inputApellido">
            <label for="inputNombres" class="form-label">Nombres</label>
            <input type="text" class="form-control" id="inputNombres">
            <label for="inputDni" class="form-label">DNI</label>
            <input type="text" class="form-control" id="inputDni">
            <label for="inputEmail" class="form-label">Email</label>
            <input type="email" class="form-control" id="inputEmail">
            <label for="inputDireccion" class="form-label">Direccion</label>
            <input type="text" class="form-control" id="inputDireccion">
            <label for="inputTelefono" class="form-label">Telefono</label>
            <input type="text" class="form-control" id="inputTelefono">
            <label for="CalendarFechaNac" class="form-label">Fecha de Nacimiento</label>
            <asp:Calendar ID="CalendarFechaNac" runat="server"></asp:Calendar>
        </div>
    <hr />
    <div>
        <button type="submit" class="btn btn-primary" style="width: 20%">Guardar</button>
    </div>

    
</asp:Content>--%>