<%@ Page Title="Nuevo Paciente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Paciente.aspx.cs" Inherits="ClinicaWeb.Paciente" %>



<asp:Content ID="ContentBodyPacientes" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container">

        <div class="row">
            <div class="col-4">
                <h1>Administración de Pacientes</h1>
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
                        <asp:TextBox ID="tbxFiltroDNI" runat="server" placeholder="Filtro DNI..." CssClass="form-control" OnTextChanged="filtro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-3">
                        <asp:TextBox ID="tbxFiltroNombre" runat="server" placeholder="Filtro nombre..." CssClass="form-control" OnTextChanged="filtro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-3">
                        <asp:TextBox ID="tbxFiltroApellido" runat="server" placeholder="Filtro apellido..." CssClass="form-control" OnTextChanged="filtro_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-3 text-end">
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Paciente" CssClass="btn btn-outline-secondary" OnClick="btnNuevo_Click" />
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:GridView ID="dgvPacientes" runat="server" DataKeyNames="IdPaciente" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvPacientes_RowCommand">
                            <Columns>
                                <asp:BoundField HeaderText="Id." DataField="IdPaciente" />
                                <asp:BoundField HeaderText="DNI" DataField="DNI" />
                                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
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


