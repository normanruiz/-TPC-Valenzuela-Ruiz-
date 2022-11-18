<%@ Page Title="ABM Médico" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="ClinicaWeb.Medico" %>



<asp:Content ID="ContentBodyMedicos" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <class="row">
            <h1>Administración de Médicos</h1> 
        </class> 
        <class="row">
            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Médico" CssClass="btn btn-secondary" OnClick="btnNuevo_Click" />
        </class>
        <class="row">
            <asp:GridView ID="dgvMedicos" runat="server" DataKeyNames="IdMedico" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvMedicos_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Id." DataField="IdMedico" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-light" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-light" />
            </Columns>
        </asp:GridView>
        </class>
    </div>

</asp:Content>


