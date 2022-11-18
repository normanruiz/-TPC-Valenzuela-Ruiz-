<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="ClinicaWeb.Usuario" %>




<asp:Content ID="contentBodyUsuario" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <class="row">
            <h1>Administración de Usuario</h1>
        </class> 
        <class="row">
            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Usuario" CssClass="btn btn-secondary" OnClick="btnNuevo_Click" />
        </class> 
        <class="row">
            <asp:GridView ID="dgvUsuario" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvUsuario_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Perfil" DataField="Perfil" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-light" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-light" />
            </Columns>
        </asp:GridView>
        </class> 
    </div>
</asp:Content>


