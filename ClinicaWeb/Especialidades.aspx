<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Especialidades.aspx.cs" Inherits="ClinicaWeb.Especialidades" %>


<asp:Content ID="ContentBodyEspecialidades" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container-fluid">

        <div class="row">
            <div class="col-4">
                <h1>Administración de Especialidades</h1>
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
                        <asp:TextBox ID="tbxFiltro" runat="server" placeholder="Filtro especialidades..." CssClass="form-control" OnTextChanged="tbxFiltro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-4">
                    </div>
                    <div class="col-4 text-end">
                        <asp:Button ID="btnNuevo" runat="server" Text="Nueva Especialidad" CssClass="btn btn-outline-secondary" OnClick="btnNuevo_Click" />
                    </div>
                </div>

                <div class="row">
                    <asp:GridView ID="dgvEspecialidad" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvEspecialidad_RowCommand" AllowPaging="true" PageSize="6" OnPageIndexChanging="dgvEspecialidad_PageIndexChanging">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="Id" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
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

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>

