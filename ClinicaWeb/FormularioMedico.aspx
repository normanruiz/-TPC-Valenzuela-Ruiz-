<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioMedico.aspx.cs" Inherits="ClinicaWeb.FormularioMedico" %>

<%--<asp:Content ID="contentHeaderMedicos" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" runat="server">ADMINISTRACION DE MEDICOS</a>
        </div>
    </div>
    <br />
    <br />
    <hr />

</asp:Content>--%>


<asp:Content ID="contentBodyMedicos" ContentPlaceHolderID="cphBody" runat="server">

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
            </div>
            <div class="col-6">
                <%-- aca arranca la carga del usuario --%>
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
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <%-- aca arranca la carga del especialidades --%>
                <div class="mb-3">
                    <label for="ddlEspecialidad" class="form-label">Especialidad</label>
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-select"></asp:DropDownList>
                    <asp:Button ID="btnEspecialidadAsignar" runat="server" Text="Asignar" CssClass="btn btn-primary" OnClick="btnEspecialidadAsignar_Click" />
                </div>
                <div class="mb-3">
                    <asp:GridView ID="dgvEspecialidad" runat="server" DataKeyNames="Id" CssClass="table table-bordered table-light" AutoGenerateColumns="false" OnRowCommand="dgvEspecialidad_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="Id" />
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Desasignar" ControlStyle-CssClass="btn btn-primary" />
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelar_Click" />
            </div>
            <div class="col-6">
                <%-- aca arranca la carga del horario --%>
                <div class="mb-3">
                    <label for="ddlHorario" class="form-label">Horarrio</label>
                    <asp:DropDownList ID="ddlHorario" runat="server" CssClass="form-select"></asp:DropDownList>
                    <asp:Button ID="btnHorarioAsignar" runat="server" Text="Asignar" CssClass="btn btn-primary" OnClick="btnHorarioAsignar_Click" />
                </div>
                <div class="mb-3">
                    <asp:GridView ID="dgvHorario" runat="server" DataKeyNames="Id" CssClass="table table-bordered table-light" AutoGenerateColumns="false" OnRowCommand="dgvHorario_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="Id." DataField="Id" />
                            <asp:BoundField HeaderText="Dia" DataField="Dia" />
                            <asp:BoundField HeaderText="Hora de inicio" DataField="HoraInicio" />
                            <asp:BoundField HeaderText="Hora de fin" DataField="HoraFin" />
                            <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Desasignar" ControlStyle-CssClass="btn btn-primary" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentFooterMedicos" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>

