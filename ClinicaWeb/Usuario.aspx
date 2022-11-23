<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="ClinicaWeb.Usuario" %>




<asp:Content ID="contentBodyUsuario" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container-fluid">

        <div class="row">
            <div class="col-4">
                <h1>Administración de Usuarios</h1>
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
                        <asp:TextBox ID="tbxFiltroUsuario" runat="server" placeholder="Filtro nombre..." CssClass="form-control" OnTextChanged="tbxFiltroUsuario_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-4">
                        <asp:TextBox ID="tbxFiltroPerfil" runat="server" placeholder="Filtro perfil..." CssClass="form-control" OnTextChanged="tbxFiltroPerfil_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-4 text-end">
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Usuario" CssClass="btn btn-outline-secondary" OnClick="btnNuevo_Click" />
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:GridView ID="dgvUsuario" runat="server" DataKeyNames="Id" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvUsuario_RowCommand" AllowPaging="true" PageSize="6" OnPageIndexChanging="dgvUsuario_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderText="ID" DataField="Id" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                <asp:BoundField HeaderText="Perfil" DataField="Perfil" />
                                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-outline-light" />
                                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-outline-light" />
                            </Columns>
                            <pagersettings Mode="NumericFirstLast"
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


