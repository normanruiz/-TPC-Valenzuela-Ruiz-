<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="ClinicaWeb.Usuario" %>




<asp:Content ID="contentBodyUsuario" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Administración de usuario</p>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="btnNuevo_Click" />
        <asp:GridView ID="dgvUsuario" runat="server" DataKeyNames="Id" CssClass="table table-bordered table-light" AutoGenerateColumns="false" OnRowCommand="dgvUsuario_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Perfil" DataField="Perfil" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="boton" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="boton" />
            </Columns>
        </asp:GridView>
    </div>
    <hr />

</asp:Content>


