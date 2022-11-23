<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horarios.aspx.cs" Inherits="ClinicaWeb.Horarios" %>


<asp:Content ID="ContentBodyHorarios" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container-fluid">

        <div class="row">
            <div class="col-4">
                <h1>Administración de Horarios</h1>
            </div>
            <div class="col-4">
            </div>
            <div class="col-4">
            </div>
        </div>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div class="row">
                    <div class="col-3">
                        <asp:TextBox ID="tbxFiltroDia" runat="server" placeholder="Filtro dia..." CssClass="form-control" OnTextChanged="filtro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-3">
                        <asp:TextBox ID="tbxFiltroInicio" runat="server" placeholder="Filtro hora inicio..." CssClass="form-control" OnTextChanged="filtro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-3">
                        <asp:TextBox ID="tbxFiltroFin" runat="server" placeholder="Filtro hora fin..." CssClass="form-control" OnTextChanged="filtro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-3 text-end">
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Horario" CssClass="btn btn-outline-secondary" OnClick="btnNuevo_Click" />
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:GridView ID="dgvHorarios" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvHorarios_RowCommand" AllowPaging="true" PageSize="6" OnPageIndexChanging="dgvHorarios_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderText="Id." DataField="Id" />
                                <asp:BoundField HeaderText="Dia" DataField="Dia" />
                                <asp:BoundField HeaderText="Hora de inicio" DataField="HoraInicio" />
                                <asp:BoundField HeaderText="Hora de fin" DataField="HoraFin" />
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
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>


