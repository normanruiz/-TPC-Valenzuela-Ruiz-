<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Persona.aspx.cs" Inherits="ClinicaWeb.Persona" %>




<asp:Content ID="contentBodyPersona" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Administracion de Personas</p>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-light" OnClick="btnNuevo_Click" />
        <asp:GridView ID="dgvPersona" runat="server" DataKeyNames="IdPersona" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvPersona_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Id." DataField="IdPersona" />
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

