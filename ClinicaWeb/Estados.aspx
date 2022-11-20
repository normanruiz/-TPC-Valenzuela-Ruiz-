<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Estados.aspx.cs" Inherits="ClinicaWeb.Estados" %>


<asp:Content ID="ContentBodyEspecialidades" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">

        <div class="row">
            <div class="col-4">
                <h1>Administración de Estados</h1>
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
                        <asp:TextBox ID="tbxFiltro" runat="server" placeholder="Filtro estados..." CssClass="form-control" OnTextChanged="tbxFiltro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-4">
                    </div>
                    <div class="col-4 text-end">
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Estado" CssClass="form-control btn btn-outline-secondary" OnClick="btnNuevo_Click" />
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:GridView ID="dgvEstados" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvEstados_RowCommand" AllowPaging="true" PageSize="4" OnPageIndexChanging="dgvEstados_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderText="Id." DataField="Id" />
                                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-outline-light" />
                                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-outline-light" />
                            </Columns>
                            <PagerStyle BackColor="Red" ForeColor="White" HorizontalAlign="Center" />

                        </asp:GridView>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>

