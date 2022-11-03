<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioEspecialidad.aspx.cs" Inherits="ClinicaWeb.FormularioEspecialidad" %>

<asp:Content ID="contentHeaderEspecialidad" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">Alta/Modificación de Especialidad</a>
        </div>
    </div>
    <br />
    <br />
    <hr />

</asp:Content>


<asp:Content ID="contentBodyEspecialidad" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Alta/Modificación de Especialidad</p>
        <div class="row">
            <div class="col-6">
                <h1>Nueva especialidad</h1>
                <div class="mb-3">
                    <label for="tbxEspecilidadNombre" class="form-label">Especialidad</label>
                    <asp:TextBox ID="tbxEspecilidadNombre" runat="server" cssclass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnGuardarEspecialidad" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardarEspecialidad_Click"/>
                <asp:Button ID="btnCancelarEspecialidad" runat="server" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelarEspecialidad_Click"/>
            </div>
        </div>
    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentFooterEspecialidad" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>
