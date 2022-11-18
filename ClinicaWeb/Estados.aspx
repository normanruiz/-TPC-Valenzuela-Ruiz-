<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Estados.aspx.cs" Inherits="ClinicaWeb.Estados" %>


<asp:Content ID="ContentBodyEspecialidades" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <class="row>
            <h1>Administración de Estados</h1>
        </class>
        <class="row>
            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Estado" CssClass="btn btn-secondary" OnClick="btnNuevo_Click" />
        </class>
        <class="row>
            <asp:GridView ID="dgvEstados" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvEstados_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Id." DataField="Id" />
                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-light" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-light" />
            </Columns>
        </asp:GridView>
        </class>
    </div>

</asp:Content>

