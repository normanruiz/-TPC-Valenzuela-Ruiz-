<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioUsuario.aspx.cs" Inherits="ClinicaWeb.FormularioUsuario" %>

<asp:Content ID="contentHeaderUsuario" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">Alta/Modificación de Usuario</a>
        </div>
    </div>
    <br />
    <br />
    <hr />

</asp:Content>


<asp:Content ID="contentBodyUsuario" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Alta/Modificación de Usuario</p>

    <div class="mb-3">
        <label for="InputEmailUsuario" class="form-label">Email</label>
        <input type="email" class="form-control" id="InputEmailUsuario" aria-describedby="emailHelp">
    </div>
    <div class="mb-3">
        <label for="InputNombreUsuario" class="form-label">Nombre de Usuario</label>
        <input type="text" class="form-control" id="InputNombreUsuario">
    </div>
    <div class="mb-3">
        <label for="InputContraseniaUsuario1" class="form-label">Contraseña</label>
        <input type="password" class="form-control" id="InputContraseniaUsuario1">
    </div>
    <div class="mb-3">
        <label for="InputContraseniaUsuario2" class="form-label">Repita la contraseña</label>
        <input type="password" class="form-control" id="InputContraseniaUsuario2">
    </div>
    <div class="mb-3">
        <label for="ddlPerfil" class="form-label">Tipo de perfil</label>
        <asp:DropDownList ID="ddlPerfil" runat="server"></asp:DropDownList>
        <select id="inputPerfil" class="form-select">
            <option selected>Recepcionista</option>
            <option>Administrador</option>
            <option>Médico</option>
        </select>
    </div>
    <asp:Button ID="btnGuardarUsuario" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardarUsuario_Click"/>
            <asp:Button ID="btnCancelarUsuario" runat="server" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelarUsuario_Click"/>

    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentFooterUsuario" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>
