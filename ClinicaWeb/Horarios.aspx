<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horarios.aspx.cs" Inherits="ClinicaWeb.Horarios" %>


<asp:Content ID="ContentBodyHorarios" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <class="row">
            <h1>Administración de Horarios</h1>
        </class>
        <class="row">
            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Horario" CssClass="btn btn-outline-secondary" OnClick="btnNuevo_Click" />
        </class>
        <class="row">
            <asp:GridView ID="dgvHorarios" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvHorarios_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Id." DataField="Id" />
                <asp:BoundField HeaderText="Dia" DataField="Dia" />
                <asp:BoundField HeaderText="Hora de inicio" DataField="HoraInicio" />
                <asp:BoundField HeaderText="Hora de fin" DataField="HoraFin" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-outline-light" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-outline-light" />
            </Columns>
        </asp:GridView>
        </class>
    </div>

</asp:Content>


