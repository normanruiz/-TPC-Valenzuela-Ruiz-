<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioEstado.aspx.cs" Inherits="ClinicaWeb.FormularioEstado" %>

<%--<asp:Content ID="contentHeaderEstado" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <h1 class="navbar-brand" runat="server">ADMINISTRACION DE ESTADOS </h1>
        </div>
    </div>
    <br />
    <br />
    <hr />--%>

<%--</asp:Content>--%>


<asp:Content ID="contentBodyEstado" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-6">
                <h2><%= tituloFormulario %></h2>
                <div class="mb-3">
                    <label for="tbxEstadoDescripcion" class="form-label">Nombre del estado</label>
                    <asp:TextBox ID="tbxEstadoDescripcion" runat="server" cssclass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnGuardarEstado" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardarEstado_Click"/>
                <asp:Button ID="btnCancelarEstado" runat="server" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelarEstado_Click"/>
            </div>
        </div>
    </div>
    <hr />

</asp:Content>

<%--<asp:Content ID="contentFooterEstado" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>--%>
