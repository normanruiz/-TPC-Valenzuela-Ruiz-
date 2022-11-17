<%@ Page Title="ABM Médico" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="ClinicaWeb.Medico" %>



<asp:Content ID="ContentBodyMedicos" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Administración de Medicos</p>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="boton" OnClick="btnNuevo_Click" />
        <asp:GridView ID="dgvMedicos" runat="server" DataKeyNames="IdMedico" CssClass="table table-bordered table-light" AutoGenerateColumns="false" OnRowCommand="dgvMedicos_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Id." DataField="IdMedico" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="boton" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="boton" />
            </Columns>
        </asp:GridView>
    </div>
    <hr />

</asp:Content>


