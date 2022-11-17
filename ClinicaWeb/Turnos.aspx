<%@ Page Title="Turnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="ClinicaWeb.Turnos" %>


<asp:Content ID="contentBodyTurnos" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <h1>Administración de Turnos</h1>
        <asp:Button ID="ButtonNuevoTurno" runat="server" Text="Nuevo Turno" OnClick="ButtonNuevoTurno_Click" CssClass="boton" />
        <asp:GridView ID="gdvTurnos" runat="server">
        </asp:GridView>

    </div>
    <hr />

</asp:Content>

