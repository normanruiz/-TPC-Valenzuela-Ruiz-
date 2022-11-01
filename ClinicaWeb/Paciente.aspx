<%@ Page Title="Nuevo Paciente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Paciente.aspx.cs" Inherits="ClinicaWeb.Paciente" %>
<asp:Content ID="abmPaciente" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <hr />
    <h1>Nuevo paciente</h1>
    <div class="row g-3">
            <label for="inputApellido" class="form-label">Apellido</label>
            <input type="text" class="form-control" id="inputApellido">
            <label for="inputNombres" class="form-label">Nombres</label>
            <input type="text" class="form-control" id="inputNombres">
            <label for="inputDni" class="form-label">DNI</label>
            <input type="text" class="form-control" id="inputDni">
            <label for="inputEmail" class="form-label">Email</label>
            <input type="email" class="form-control" id="inputEmail">
            <label for="inputDireccion" class="form-label">Direccion</label>
            <input type="text" class="form-control" id="inputDireccion">
            <label for="inputTelefono" class="form-label">Telefono</label>
            <input type="text" class="form-control" id="inputTelefono">
            <label for="CalendarFechaNac" class="form-label">Fecha de Nacimiento</label>
            <asp:Calendar ID="CalendarFechaNac" runat="server"></asp:Calendar>
        </div>
    <hr />
    <div>
        <button type="submit" class="btn btn-primary" style="width: 20%">Guardar</button>
    </div>

    
</asp:Content>
