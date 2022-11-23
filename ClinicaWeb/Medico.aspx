﻿<%@ Page Title="ABM Médico" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="ClinicaWeb.Medico" %>



<asp:Content ID="ContentBodyMedicos" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container-fluid">

        <div class="row">
            <div class="col-4">
                <h1>Administración de Médicos</h1>
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
                        <asp:TextBox ID="tbxFiltroNombre" runat="server" placeholder="Filtro nombre..." CssClass="form-control" OnTextChanged="tbxFiltroNombre_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-4">
                        <asp:TextBox ID="tbxFiltroApellido" runat="server" placeholder="Filtro apellido..." CssClass="form-control" OnTextChanged="tbxFiltroApellido_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col-4 text-end">
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Médico" CssClass="btn btn-outline-secondary" OnClick="btnNuevo_Click" />
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:GridView ID="dgvMedicos" runat="server" DataKeyNames="IdMedico" CssClass="table table-dark table-striped" AutoGenerateColumns="false" OnRowCommand="dgvMedicos_RowCommand" AllowPaging="true" PageSize="6" OnPageIndexChanging="dgvMedicos_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderText="Id." DataField="IdMedico" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />
                                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                                <asp:ButtonField ButtonType="Button" CommandName="Modificar" HeaderText="Modificar" Text="Modificar" ControlStyle-CssClass="btn btn-outline-light" />
                                <asp:ButtonField ButtonType="Button" CommandName="Eliminar" HeaderText="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-outline-light"/>
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
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalEliminar">
                     Eliminar
                </button>
                

                <div class="modal fade" id="ModalEliminar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="LblModalEliminar">Confirma la eliminación</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ¿Seguro de que quieres eliminar el registro?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-primary">Eliminar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>


