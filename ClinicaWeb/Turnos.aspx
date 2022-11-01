<%@ Page Title="Turnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="ClinicaWeb.Turnos" %>

<asp:Content ID="contentHeaderTurnos" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINIASTRACION DE TURNOS</a>
        </div>
    </div>
    <br />
    <br />
    <hr />
    <div>
        <a  href="Turnos.aspx" style="width: 40%">Administrar Turnos</a>
        <a  href="Medico.aspx" style="width: 40%">Administrar Medicos</a>
        <a  href="Paciente.aspx" style="width: 40%">Administrar Pacientes</a>
    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentBodyTurnos" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container text-center">
        <p class="fw-semibold" style="font-size: 30px">Administracion de Turnos</p>

    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentFooterTurnos" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>