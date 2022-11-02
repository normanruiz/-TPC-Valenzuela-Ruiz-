<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="ClinicaWeb.Usuario" %>

<asp:Content ID="ContentHeaderUsuario" ContentPlaceHolderID="cphHeader" runat="server">
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
        <a href="Horarios.aspx" style="width: 40%">Administrar Horarios</a>
    </div>
    <hr />
</asp:Content>
<asp:Content ID="ContentBodyUsuario" ContentPlaceHolderID="cphBody" runat="server">
    
    <h1>Nuevo Usuario</h1>
    <div class="mb-3">
        <label for="InputEmailUsuario" class="form-label">Email</label>
        <input type="email" class="form-control" id="InputEmailUsuario" aria-describedby="emailHelp">
    </div>
    <div class="mb-3">
        <label for="InputNombreUsuario" class="form-label">Nombre de Usuario</label>
        <input type="text" class="form-control" id="InputNombreUsuario">
    </div>
    <div class="mb-3">
        <label for="InputContraseniaUsuario1" class="form-label">Contraseña</label>
        <input type="password" class="form-control" id="InputContraseniaUsuario1">
    </div>
    <div class="mb-3">
        <label for="InputContraseniaUsuario2" class="form-label">Repita la contraseña</label>
        <input type="password" class="form-control" id="InputContraseniaUsuario2">
    </div>
    <div class="mb-3">
        <label for="inputPerfil" class="form-label">Tipo de perfil</label>
        <select id="inputPerfil" class="form-select">
            <option selected>Recepcionista</option>
            <option>Administrador</option>
            <option>Médico</option>
        </select>
    </div>
    <asp:Button ID="btnGuardarUsuario" runat="server" Text="Guardar" CssClass="btn btn-primary"/>
            <asp:Button ID="btnCancelarUsuario" runat="server" Text="Cancelar" CssClass="btn btn-primary" />
</asp:Content>
<asp:Content ID="ContentFooterUsuario" ContentPlaceHolderID="cphFooter" runat="server">
    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />
</asp:Content>
