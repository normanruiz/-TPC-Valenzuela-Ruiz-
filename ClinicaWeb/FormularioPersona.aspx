<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioPersona.aspx.cs" Inherits="ClinicaWeb.FormularioPersona" %>

<asp:Content ID="contentHeaderPersona" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">Alta/Modificacion de Persona</a>
        </div>
    </div>
    <br />
    <br />
    <hr />

</asp:Content>


<asp:Content ID="contentBodyPersona" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <p class="fw-semibold" style="font-size: 30px">Alta/Modificacion de Personas</p>
        <div class="row">
            <div class="col-6">
                <%-- Aca arranca la carga de la persona --%>
                <div class="mb-3">
                    <label for="tbxIdPersona" class="form-label">Id.</label>
                    <asp:TextBox ID="tbxIdPersona" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtApellido" class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <%-- aca arranca la carga del usuario --%>

                <div class="form-check form-switch">
                  <%--<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">--%>
                    <asp:CheckBox ID="chbUsuario" runat="server" class="form-check-input"/>
                  <label class="form-check-label" for="chbUsuario">Asignar Usuario</label>
                </div>

                 <div class="mb-3">
                    <label for="txtIdusuario" class="form-label">Id.</label>
                    <asp:TextBox ID="txtIdusuario" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                    <div class="mb-3">
                         <label for="txtNombre" class="form-label">Usuario</label>
                         <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                     </div>
                     <div class="mb-3">
                         <label for="txtContrasenia" class="form-label">Contraseña</label>
                         <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                     </div>     
                     <div class="mb-3">
                         <label for="ddlPerfil" class="form-label">Perfil</label>
                         <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="form-control"></asp:DropDownList>
                     </div> 
                  </div>

                <%-- aca los botones para guardar o cancelar --%>
                <%-- Acordate que al guardra debe cuardar el usuario asignar el id a la personba y guardar la persona --%>
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click"/>
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelar_Click" />
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
