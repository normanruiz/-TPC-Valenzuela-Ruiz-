<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Especialidades.aspx.cs" Inherits="ClinicaWeb.Especialidades" %>


<asp:Content ID="ContentBodyEspecialidades" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
         <class="row">
             <h1>Administración de Especialidad</h1>
         </class>
         <class="row">
             <asp:Button ID="btnNuevo" runat="server" Text="Nueva Especialidad" CssClass="btn btn-outline-secondary" OnClick="btnNuevo_Click" />
         </class>
         <class="row">
             <asp:GridView ID="dgvEspecialidad" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvEspecialidad_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-outline-light" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-outline-light" />
            </Columns>
        </asp:GridView>
         </class>
    </div>

</asp:Content>

<%--<asp:Content ID="ContentFooterEspecialidades" ContentPlaceHolderID="cphFooter" runat="server">
    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />
</asp:Content>--%>
