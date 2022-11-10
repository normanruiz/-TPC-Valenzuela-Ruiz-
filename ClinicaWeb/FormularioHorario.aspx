<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioHorario.aspx.cs" Inherits="ClinicaWeb.FormularioHorario" %>

<asp:Content ID="contentHeaderHorario" ContentPlaceHolderID="cphHeader" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <h1 class="navbar-brand" runat="server">ADMINISTRACION DE HORARIOS </h1>
        </div>
    </div>
    <br />
    <br />
    <hr />

</asp:Content>

<asp:Content ID="ContentbodyHorarios" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-6">
                <h2><%= tituloFormulario %></h2>
                <div class="mb-3">
                    <label for="ddlHorarioDia" class="form-label">Dia</label>
                    <asp:DropDownList ID="ddlHorarioDia" runat="server" CssClass="btn btn-secondary dropdown-toggle">
                        <asp:ListItem Text="Lunes" />
                        <asp:ListItem Text="Martes" />
                        <asp:ListItem Text="Miercoles" />
                        <asp:ListItem Text="Jueves" />
                        <asp:ListItem Text="Viernes" />
                        <asp:ListItem Text="Sabado" />
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlHorarioInicio" class="form-label">Hora inicio</label>
                    <asp:DropDownList ID="ddlHorarioInicio" runat="server" CssClass="btn btn-secondary dropdown-toggle">
                        <asp:ListItem Text="00:00" Value="0"/>
                        <asp:ListItem Text="01:00" Value="1"/>
                        <asp:ListItem Text="02:00" Value="2"/>
                        <asp:ListItem Text="03:00" Value="3"/>
                        <asp:ListItem Text="04:00" Value="4"/>
                        <asp:ListItem Text="05:00" Value="5"/>
                        <asp:ListItem Text="06:00" Value="6"/>
                        <asp:ListItem Text="07:00" Value="7"/>
                        <asp:ListItem Text="08:00" Value="8"/>
                        <asp:ListItem Text="09:00" Value="9"/>
                        <asp:ListItem Text="10:00" Value="10"/>
                        <asp:ListItem Text="11:00" Value="11"/>
                        <asp:ListItem Text="12:00" Value="12"/>
                        <asp:ListItem Text="13:00" Value="13"/>
                        <asp:ListItem Text="14:00" Value="14"/>
                        <asp:ListItem Text="15:00" Value="15"/>
                        <asp:ListItem Text="16:00" Value="16"/>
                        <asp:ListItem Text="17:00" Value="17"/>
                        <asp:ListItem Text="18:00" Value="18"/>
                        <asp:ListItem Text="19:00" Value="19"/>
                        <asp:ListItem Text="20:00" Value="20"/>
                        <asp:ListItem Text="21:00" Value="21"/>
                        <asp:ListItem Text="22:00" Value="22"/>
                        <asp:ListItem Text="23:00" Value="23"/>
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlHorarioFin" class="form-label">Hora fin</label>
                    <asp:DropDownList ID="ddlHorarioFin" runat="server" CssClass="btn btn-secondary dropdown-toggle">
                        <asp:ListItem Text="01:00" Value="1"/>
                        <asp:ListItem Text="02:00" Value="2"/>
                        <asp:ListItem Text="03:00" Value="3"/>
                        <asp:ListItem Text="04:00" Value="4"/>
                        <asp:ListItem Text="05:00" Value="5"/>
                        <asp:ListItem Text="06:00" Value="6"/>
                        <asp:ListItem Text="07:00" Value="7"/>
                        <asp:ListItem Text="08:00" Value="8"/>
                        <asp:ListItem Text="09:00" Value="9"/>
                        <asp:ListItem Text="10:00" Value="10"/>
                        <asp:ListItem Text="11:00" Value="11"/>
                        <asp:ListItem Text="12:00" Value="12"/>
                        <asp:ListItem Text="13:00" Value="13"/>
                        <asp:ListItem Text="14:00" Value="14"/>
                        <asp:ListItem Text="15:00" Value="15"/>
                        <asp:ListItem Text="16:00" Value="16"/>
                        <asp:ListItem Text="17:00" Value="17"/>
                        <asp:ListItem Text="18:00" Value="18"/>
                        <asp:ListItem Text="19:00" Value="19"/>
                        <asp:ListItem Text="20:00" Value="20"/>
                        <asp:ListItem Text="21:00" Value="21"/>
                        <asp:ListItem Text="22:00" Value="22"/>
                        <asp:ListItem Text="23:00" Value="23"/>
                        <asp:ListItem Text="24:00" Value="24"/>
                    </asp:DropDownList>
                </div>
                <asp:Button ID="btnGuardarEspecialidad" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardarEspecialidad_Click" />
                <asp:Button ID="btnCancelarEspecialidad" runat="server" Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelarEspecialidad_Click" />
            </div>
        </div>
    </div>
    <hr />

</asp:Content>

<asp:Content ID="contentFooterHorario" ContentPlaceHolderID="cphFooter" runat="server">

    <footer>
        <p>&copy; <%: DateTime.Now.Year %> - Mi Clínica Web ASP.NET</p>
    </footer>
    <hr />

</asp:Content>
