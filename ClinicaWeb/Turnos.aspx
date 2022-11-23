<%@ Page Title="Turnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="ClinicaWeb.Turnos" %>


<asp:Content ID="contentBodyTurnos" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container-fluid">

        <div class="row">
            <div class="col-4">
                <h1>Administración de Turnos</h1>
            </div>
            <div class="col-4">
            </div>
            <div class="col-4">
            </div>
        </div>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div class="row">
                    <div class="col-4">
                    </div>
                    <div class="col-4">
                    </div>
                    <div class="col-4 text-end">
                        <asp:Button ID="btnNuevo" runat="server" Text="Cargar Turno" OnClick="btnNuevo_Click" CssClass="btn btn-outline-secondary" />
                    </div>
                </div>

                <div class="row">
                    <div class="col">

                        <asp:GridView ID="dgvTurnos" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvTurnos_RowCommand">
                            <Columns>
                                <asp:BoundField HeaderText="Id." DataField="Id" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                                <asp:BoundField HeaderText="Numero" DataField="Numero" />
                                <asp:BoundField HeaderText="Paciente" DataField="paciente.denominacion" />
                                <asp:BoundField HeaderText="Especialidad" DataField="especialidad.Nombre" />
                                <asp:BoundField HeaderText="Medico" DataField="medico.denominacion" />
                                <asp:BoundField HeaderText="Fecha" DataField="Fecha" />

                                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-outline-light" />
                                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-outline-light" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>

