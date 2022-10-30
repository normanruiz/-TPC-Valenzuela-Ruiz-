<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="ClinicaWeb.Medico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container text-center">
            <p class="fw-semibold" style="font-size: 30px">Mis turnos</p>
            <%--<asp:GridView ID="dgvTurnosMedico" runat="server" DataKeyNames="Numero" OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" CssClass="table table-bordered table-light" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Nombre del paciente" DataField="Paciente.Nombre" />
                        <asp:BoundField HeaderText="Especialidad" DataField="Especialidad" />
                        <asp:BoundField HeaderText="Horario" DataField="Horario.Fecha" />
                        <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" />
                        <asp:BoundField HeaderText="Fecha de Creacion" DataField="FechaCreacion" />
                        <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Accion" />
                    </Columns>
                </asp:GridView>--%>
        </div>
</asp:Content>
