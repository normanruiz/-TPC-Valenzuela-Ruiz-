<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="ClinicaWeb.Usuario" %>

<asp:Content ID="contentHeaderUsuario" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINISTRACIÓN DE USUARIO</a>
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


<asp:Content ID="contentBodyUsuario" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Administración de usuario</p>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="btnNuevo_Click"/>
        <asp:GridView ID="dgvUsuario" runat="server" DataKeyNames="Id" CssClass="table table-bordered table-light" AutoGenerateColumns="false" OnRowCommand="dgvUsuario_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Perfil" DataField="Perfil" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-primary" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-primary" />
            </Columns>
        </asp:GridView>
    </div>
    <hr/>

</asp:Content>

<asp:Content ID="contentFooterUsuario" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr/>

</asp:Content>
