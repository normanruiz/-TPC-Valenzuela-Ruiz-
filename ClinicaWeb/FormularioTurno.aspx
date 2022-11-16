<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioTurno.aspx.cs" Inherits="ClinicaWeb.FormularioTurno" %>



<asp:Content ID="contentBodyTurno" ContentPlaceHolderID="cphBody" runat="server">
    <hr />
    <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="DNI" aria-label="Search">
        <button class="btn btn-outline-success" type="button">Buscar paciente</button>
    </form>
    <div>
        <label for="lbNombre" class="form-label">Nombre de paciente elegido</label>
    </div>
    <select class="form-select" aria-label="Default select example">
        <option selected>Especialidad</option>
        <option value="1">One</option>
        <option value="2">Two</option>
        <option value="3">Three</option>
    </select>
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    <p>///Grilla con los turnos disponibles (medicos y horarios)///</p>
    <button class="btn btn-outline-success" type="button">Elegir Turno</button>
    <h1>Elegir turno de manera manual</h1>
    <select class="form-select" aria-label="Default select example">
        <option selected>Médico</option>
        <option value="1">One</option>
        <option value="2">Two</option>
        <option value="3">Three</option>
    </select>
    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    <asp:DataList ID="DataList1" runat="server"></asp:DataList>
    <p>///Data list con los horarios disponibles///</p>
    <button class="btn btn-outline-success" type="button">Elegir Turno</button>

    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="boton" OnClick="btnGuardar_Click" />
    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="boton" OnClick="btnCancelar_Click" />

</asp:Content>


