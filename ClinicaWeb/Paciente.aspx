<%@ Page Title="Nuevo Paciente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Paciente.aspx.cs" Inherits="ClinicaWeb.Paciente" %>



<asp:Content ID="ContentBodyPacientes" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <h1>Administración de Pacientes</h1>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="botonInicio" OnClick="btnNuevo_Click" />
        <asp:GridView ID="dgvPacientes" runat="server" DataKeyNames="IdPaciente" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvPacientes_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Id." DataField="IdPaciente" />
                <asp:BoundField HeaderText="DNI" DataField="DNI" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-light" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-light" />
            </Columns>
        </asp:GridView>
    </div>
    <hr />

</asp:Content>


