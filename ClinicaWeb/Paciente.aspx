<%@ Page Title="Nuevo Paciente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Paciente.aspx.cs" Inherits="ClinicaWeb.Paciente" %>



<asp:Content ID="ContentBodyPacientes" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Administración de Pacientes</p>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="btnNuevo_Click" />
        <asp:GridView ID="dgvPacientes" runat="server" DataKeyNames="IdPaciente" CssClass="table table-bordered table-light" AutoGenerateColumns="false" OnRowCommand="dgvPacientes_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Id." DataField="IdPaciente" />
                <asp:BoundField HeaderText="DNI" DataField="DNI" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="boton" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="boton" />
            </Columns>
        </asp:GridView>
    </div>
    <hr />

</asp:Content>


