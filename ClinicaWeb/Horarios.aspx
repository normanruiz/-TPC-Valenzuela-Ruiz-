<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horarios.aspx.cs" Inherits="ClinicaWeb.Horarios" %>


<asp:Content ID="ContentBodyHorarios" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Administración de Horarios</p>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="btnNuevo_Click" />
        <asp:GridView ID="dgvHorarios" runat="server" DataKeyNames="Id" CssClass="table table-bordered table-light" AutoGenerateColumns="false" OnRowCommand="dgvHorarios_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Id." DataField="Id" />
                <asp:BoundField HeaderText="Dia" DataField="Dia" />
                <asp:BoundField HeaderText="Hora de inicio" DataField="HoraInicio" />
                <asp:BoundField HeaderText="Hora de fin" DataField="HoraFin" />
                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-primary" />
                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-primary" />
            </Columns>
        </asp:GridView>
    </div>
    <hr />

</asp:Content>


