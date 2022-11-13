<%@ Page Title="ABM Médico" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="ClinicaWeb.Medico" %>

<%--<asp:Content ID="contentHeaderMedicos" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINIASTRACION DE MEDICOS</a>
        </div>
    </div>
    <br />
    <br />
    <hr />
    <div>

        <a href="Turnos.aspx" style="width: 40%">Administrar Turnos</a>

        <a href="Paciente.aspx" style="width: 40%">Administrar Pacientes</a>
        <a href="Medico.aspx" style="width: 40%">Administrar Medicos</a>

        <a href="Persona.aspx" style="width: 40%">Administrar Personas</a>
        <a href="Usuario.aspx" style="width: 40%">Administrar Usuarios</a>
        <a href="Especialidades.aspx" style="width: 40%">Administrar Especialidades</a>
        <a href="Horarios.aspx" style="width: 40%">Administrar Horarios</a>
        <a href="Estados.aspx" style="width: 40%">Administrar Estados</a>

    </div>
    <hr />

</asp:Content>--%>

<asp:Content ID="ContentBodyMedicos" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Administración de Medicos</p>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="btnNuevo_Click" />
        <asp:GridView ID="dgvMedicos" runat="server" DataKeyNames="IdMedico" CssClass="table table-bordered table-light" AutoGenerateColumns="false" OnRowCommand="dgvMedicos_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Id." DataField="IdMedico" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-primary" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-primary" />
            </Columns>
        </asp:GridView>
    </div>
    <hr />

</asp:Content>

<%--<asp:Content ID="contentFooterMedicos" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>--%>
