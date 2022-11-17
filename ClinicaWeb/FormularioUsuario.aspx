<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioUsuario.aspx.cs" Inherits="ClinicaWeb.FormularioUsuario" %>



<asp:Content ID="contentBodyUsuario" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <h1>Alta/Modificación de Usuario</h1>

        <div class="mb-3">
            <label for="tbxNombreUsuario" class="form-label">Nombre de Usuario</label>
            <asp:TextBox ID="tbxNombreUsuario" runat="server" cssclass="form-control"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="tbxContraseñaUsuario" class="form-label">Contraseña</label>
            <asp:TextBox ID="tbxContraseñaUsuario" runat="server" cssclass="form-control"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="tbxConfirmarContraseñaUsuario" class="form-label">Repita la contraseña</label>
            <asp:TextBox ID="tbxConfirmarContraseñaUsuario" runat="server" cssclass="form-control"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="ddlPerfil" class="form-label">Tipo de perfil</label>
            <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="form-select"></asp:DropDownList>
        </div>
        <asp:Button ID="btnGuardarUsuario" runat="server" Text="Guardar" CssClass="boton" OnClick="btnGuardarUsuario_Click" />
        <asp:Button ID="btnCancelarUsuario" runat="server" Text="Cancelar" CssClass="boton" OnClick="btnCancelarUsuario_Click" />

    </div>
    <hr />

</asp:Content>

