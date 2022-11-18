<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Persona.aspx.cs" Inherits="ClinicaWeb.Persona" %>




<asp:Content ID="contentBodyPersona" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <class="row">
            <h1>Administracion de Personas</h1>
        </class>
        <class="row">
            <asp:Button ID="btnNuevo" runat="server" Text="Nueva Persona" CssClass="btn btn-secondary" OnClick="btnNuevo_Click" />
        </class>
        <class="row">
            <asp:GridView ID="dgvPersona" runat="server" DataKeyNames="IdPersona" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvPersona_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Id." DataField="IdPersona" />
                <asp:BoundField HeaderText="DNI" DataField="DNI" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-light" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-light" />
            </Columns>
        </asp:GridView>
        </class>
    </div>
</asp:Content>

