<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioPaciente.aspx.cs" Inherits="ClinicaWeb.FormularioPaciente" %>



<asp:Content ID="contentBodyPaciente" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px"><%= tituloFormulario %></p>
        <div class="row">
            <div class="col-6">
                <%-- Aca arranca la carga de la persona --%>
                <div class="mb-3">
                    <label for="tbxDNI" class="form-label">Documento Nacional de Identidad</label>
                    <asp:TextBox ID="tbxDNI" runat="server" CssClass="form-control" OnTextChanged="tbxDNI_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="tbxNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="tbxNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="tbxApellido" class="form-label">Apellido</label>
                    <asp:TextBox ID="tbxApellido" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="tbxEmail" class="form-label">Email</label>
                    <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <%-- aca arranca la carga del paciente --%>
                <div class="mb-3">
                    <label for="tbxFechaNacimiento" class="form-label" >Fecha de Nacimiento</label>
                    <asp:TextBox ID="tbxFechaNacimiento" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="tbxTelefono" class="form-label">Telefono</label>
                    <asp:TextBox ID="tbxTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="tbxDireccion" class="form-label">Direccion</label>
                    <asp:TextBox ID="tbxDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <%-- acordate de mandar el usuario en null --%>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="boton" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="boton" OnClick="btnCancelar_Click" />
            </div>
        </div>
    </div>
    <hr />

</asp:Content>

