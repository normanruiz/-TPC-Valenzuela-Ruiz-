<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioEspecialidad.aspx.cs" Inherits="ClinicaWeb.FormularioEspecialidad" %>




<asp:Content ID="contentBodyEspecialidad" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-6">
                <h2><%= tituloFormulario %></h2>
                <div class="mb-3">
                    <label for="tbxEspecilidadNombre" class="form-label">Nombre de la especialidad</label>
                    <asp:TextBox ID="tbxEspecilidadNombre" runat="server" cssclass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnGuardarEspecialidad" runat="server" Text="Guardar" CssClass="boton" OnClick="btnGuardarEspecialidad_Click"/>
                <asp:Button ID="btnCancelarEspecialidad" runat="server" Text="Cancelar" CssClass="boton" OnClick="btnCancelarEspecialidad_Click"/>
            </div>
        </div>
    </div>
    <hr />

</asp:Content>

<%--<asp:Content ID="contentFooterEspecialidad" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>--%>
