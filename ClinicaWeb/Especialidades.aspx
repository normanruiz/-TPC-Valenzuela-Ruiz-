<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Especialidades.aspx.cs" Inherits="ClinicaWeb.Especialidades" %>


<asp:Content ID="ContentBodyEspecialidades" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <h1>Administración de Especialidad</h1>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="botonInicio" OnClick="btnNuevo_Click" />
        <asp:GridView ID="dgvEspecialidad" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvEspecialidad_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-light" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-light" />
            </Columns>
        </asp:GridView>




    </div>
    <hr />

</asp:Content>

<%--<asp:Content ID="ContentFooterEspecialidades" ContentPlaceHolderID="cphFooter" runat="server">
    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />
</asp:Content>--%>
