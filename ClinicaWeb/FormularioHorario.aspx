<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioHorario.aspx.cs" Inherits="ClinicaWeb.FormularioHorario" %>

<asp:Content ID="ContentHeaderHorarios" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">Alta/Modificación de Horarios</a>
        </div>
    </div>
    <br />
    <br />
    <hr />

</asp:Content>

<asp:Content ID="ContentbodyHorarios" ContentPlaceHolderID="cphBody" runat="server">

    <h1>Agregar Horarios de Médicos</h1>
    <select class="form-select" aria-label="Default select example">
        <option selected>Hora de entrada</option>
        <option value="6">6:00</option>
        <option value="7">7:00</option>
        <option value="8">8:00</option>
        <option value="9">9:00</option>
        <option value="10">10:00</option>
        <option value="11">11:00</option>
        <option value="12">12:00</option>
        <option value="13">13:00</option>
        <option value="14">14:00</option>
    </select>
    <select class="form-select" aria-label="Default select example">
        <option selected>Hora de salida</option>
        <option value="14">14:00</option>
        <option value="15">15:00</option>
        <option value="16">16:00</option>
        <option value="17">17:00</option>
        <option value="18">18:00</option>
        <option value="19">19:00</option>
        <option value="20">20:00</option>
        <option value="21">21:00</option>
        <option value="22">22:00</option>
    </select>
    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelar_Click" />

</asp:Content>

<asp:Content ID="ContentFooterHorarios" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>
