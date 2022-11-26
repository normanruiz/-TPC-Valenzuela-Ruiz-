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
                    <div class="col-2">
                        <asp:TextBox ID="tbxFiltroNumero" runat="server" placeholder="Filtro numero..." CssClass="form-control" OnTextChanged="tbxFiltro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-2">
                        <asp:TextBox ID="tbxFiltroPaciente" runat="server" placeholder="Filtro paciente..." CssClass="form-control" OnTextChanged="tbxFiltro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-2">
                        <asp:TextBox ID="tbxFiltroEspecialidad" runat="server" placeholder="Filtro especialidad..." CssClass="form-control" OnTextChanged="tbxFiltro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-2">
                        <asp:TextBox ID="tbxFiltroMedico" runat="server" placeholder="Filtro medico..." CssClass="form-control" OnTextChanged="tbxFiltro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-2">
                        <asp:TextBox TextMode="Date" ID="tbxFiltroFecha" runat="server" placeholder="Filtro fecha..." CssClass="form-control" OnTextChanged="tbxFiltro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-2 text-end">
                        <asp:Button ID="btnNuevo" runat="server" Text="Cargar Turno" OnClick="btnNuevo_Click" CssClass="btn btn-outline-secondary" />
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>

                                <asp:GridView ID="dgvTurnos" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvTurnos_RowCommand" AllowPaging="true" PageSize="6" OnPageIndexChanging="dgvTurnos_PageIndexChanging">
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
                                    <PagerSettings Mode="NumericFirstLast"
                                        Position="Bottom"
                                        PageButtonCount="10" />
                                    <PagerStyle BackColor="LightBlue"
                                        Height="30px"
                                        VerticalAlign="Bottom"
                                        HorizontalAlign="Center" />
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>

