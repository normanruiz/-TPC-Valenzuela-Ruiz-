<%@ Page Title="Turnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="ClinicaWeb.Turnos" %>


<asp:Content ID="contentBodyTurnos" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <class="row">
            <h1>Administración de Turnos</h1>
        </class>
        <class="row">
            <asp:Button ID="ButtonNuevoTurno" runat="server" Text="Nuevo Turno" OnClick="ButtonNuevoTurno_Click" CssClass="btn btn-outline-secondary" />
        </class>
        <class="row">
            <asp:GridView ID="gdvTurnos" runat="server">
        </asp:GridView>
        </class>
    </div>

</asp:Content>

