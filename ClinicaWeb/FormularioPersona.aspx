<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioPersona.aspx.cs" Inherits="ClinicaWeb.FormularioPersona" %>

<%--<asp:Content ID="contentHeaderPersona" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINISTRACION DE PERSONAS</a>
        </div>
    </div>
    <br />
    <br />
    <hr />

</asp:Content>--%>


<asp:Content ID="contentBodyPersona" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px"><%= tituloFormulario %></p>
        <div class="row">
            <div class="col-6">
                <%-- Aca arranca la carga de la persona --%>
                <div class="mb-3">
                    <label for="tbxDNI" class="form-label">Documento Nacional de Identidad</label>
                    <asp:TextBox ID="tbxDNI" runat="server" CssClass="form-control"></asp:TextBox>
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
                <%-- aca arranca la carga del usuario --%>

                <div class="mb-3">
                    <div class="form-check">
                        <asp:CheckBox ID="ckbUsuario" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label" for="ckbUsuario">Requiere ususario</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="tbxNombreUsuario" class="form-label">Nombre de Usuario</label>
                    <asp:TextBox ID="tbxNombreUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="tbxContraseñaUsuario" class="form-label">Contraseña</label>
                    <asp:TextBox ID="tbxContraseñaUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="tbxConfirmarContraseñaUsuario" class="form-label">Repita la contraseña</label>
                    <asp:TextBox ID="tbxConfirmarContraseñaUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="ddlPerfil" class="form-label">Tipo de perfil</label>
                    <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <%-- aca los botones para guardar o cancelar --%>
                <%-- Acordate que al guardra debe cuardar el usuario asignar el id a la personba y guardar la persona --%>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelar_Click" />
            </div>
        </div>
    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentFooterPersona" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>
