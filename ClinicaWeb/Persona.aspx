<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Persona.aspx.cs" Inherits="ClinicaWeb.Persona" %>

<asp:Content ID="contentHeaderPersona" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINISTRACIÓN DE PERSONAS</a>
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


<asp:Content ID="contentBodyPersona" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Administracion de Personas</p>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="btnNuevo_Click"/>
        <asp:GridView ID="dgvPersonas" runat="server" CssClass="table table-bordered table-light" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvPersonas_SelectedIndexChanged">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="IdPersona"/>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:CommandField ShowSelectButton="true" SelectText="Modificar" HeaderText="" />
                <asp:CommandField ShowSelectButton="true" SelectText="Eliminar" HeaderText="" />
            </Columns>
        </asp:GridView>
    </div>
    <hr/>

</asp:Content>

<asp:Content ID="contentFooterPersona" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr/>

</asp:Content>
