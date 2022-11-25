<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioTurno.aspx.cs" Inherits="ClinicaWeb.FormularioTurno" %>



<asp:Content ID="contentBodyTurno" ContentPlaceHolderID="cphBody" runat="server">

    <div class="container-fluid">

        <div class="row">
            <div class="col-3">
            </div>
            <div class="col-4">
                <h1>Nuevo Turno</h1>
            </div>
            <div class="col-5">
            </div>
        </div>

        <div class="row">
            <div class="col-3">
            </div>
            <div class="col-2">
                <div class="mb-3">
                    <label for="tbxDNI" class="form-label">DNI del paciente</label>
                    <asp:TextBox ID="tbxDNI" runat="server" CssClass="form-control" AutoPostBack="true" ClientIDMode="Static" OnTextChanged="tbxDNI_TextChanged"></asp:TextBox>
                    <asp:Label for="tbxDNI" ID="lblDNI" runat="server" ClientIDMode="Static"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="ddlEspecialidad" class="form-label">Especialidad Médica</label>
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <asp:CheckBox ID="ckbCargaManual" runat="server" ClientIDMode="Static" AutoPostBack="true" />
                    <label for="ckbCargaManual" class="form-check-label">Carga Manual</label>
                </div>
            </div>
            <div class="col-2">
                <div class="mb-3"></div>
                <div class="mb-3">
                    <asp:Button ID="btnBuscarDni" runat="server" Text="Buscar Paciente" CssClass="btn btn-outline-primary" OnClick="tbxDNI_TextChanged" />
                </div>
            </div>
            <div class="col-5">
            </div>
        </div>
        <% if (!ckbCargaManual.Checked)
            { %>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-2">
                <div class="card text-white text-center bg-dark  mb-3" style="max-width: 18rem;">
                    <asp:Label ID="lblMedicoOpcion1" runat="server" CssClass="card-header" ClientIDMode="Static" Text="Medico a designar"></asp:Label>
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label ID="lblDiaOpcion1" runat="server" CssClass="card-title" ClientIDMode="Static" Text="Fecha a designar"></asp:Label></h5>
                        <p class="card-text">
                            <asp:Label ID="lblHoraOpcion1" runat="server" CssClass="card-text" ClientIDMode="Static" Text="Hora a designar"></asp:Label>
                        </p>
                        <asp:Button ID="btnElegirOpcion1" runat="server" Text="Elegir" CssClass="btn btn-outline-primary" OnClick="btnElegirOpcion1_Click" Enabled="false"/>
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="card text-white text-center bg-dark  mb-3" style="max-width: 18rem;">
                    <asp:Label ID="lblMedicoOpcion2" runat="server" CssClass="card-header" ClientIDMode="Static" Text="Medico a designar"></asp:Label>
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label ID="lblDiaOpcion2" runat="server" CssClass="card-title" ClientIDMode="Static" Text="Fecha a designar"></asp:Label></h5>
                        <p class="card-text">
                            <asp:Label ID="lblHoraOpcion2" runat="server" CssClass="card-text" ClientIDMode="Static" Text="Hora a designar"></asp:Label>
                        </p>
                        <asp:Button ID="btnElegirOpcion2" runat="server" Text="Elegir" CssClass="btn btn-outline-primary" OnClick="btnElegirOpcion2_Click" Enabled="false"/>
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="card text-white text-center bg-dark  mb-3" style="max-width: 18rem;">
                    <asp:Label ID="lblMedicoOpcion3" runat="server" CssClass="card-header" ClientIDMode="Static" Text="Medico a designar"></asp:Label>
                    <div class="card-body">
                        <h5 class="card-title">
                            <asp:Label ID="lblDiaOpcion3" runat="server" CssClass="card-title" ClientIDMode="Static" Text="Fecha a designar"></asp:Label></h5>
                        <p class="card-text">
                            <asp:Label ID="lblHoraOpcion3" runat="server" CssClass="card-text" ClientIDMode="Static" Text="Hora a designar"></asp:Label>
                        </p>
                        <asp:Button ID="btnElegirOpcion3" runat="server" Text="Elegir" CssClass="btn btn-outline-primary" OnClick="btnElegirOpcion3_Click" Enabled="false"/>
                    </div>
                </div>
            </div>
            <div class="col-3"></div>
        </div>
        <% }
            else
            { %>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row align-items-center">
                    <div class="col-3"></div>
                    <div class="col-2">
                        <label for="ddlMedicos" class="form-label">Médicos</label>
                        <asp:DropDownList ID="ddlMedicos" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlMedicos_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-2">
                        <label for="ddlHorarios" class="form-label">Horarios disponibles</label>
                        <asp:DropDownList ID="ddlHorarios" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                    <div class="col-2">
                        <label for="ddlHora" class="form-label">Horas disponibles</label>
                        <asp:DropDownList ID="ddlHora" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                    <div class="col-3"></div>
                </div>
                <div class="row align-items-center">
                    <div class="col-3"></div>
                    <div class="col-4">
                        <asp:Calendar ID="Calendar2" CssClass="table" runat="server"></asp:Calendar>
                        <asp:DataList ID="DataList2" runat="server"></asp:DataList>
                    </div>
                    <div class="col-5"></div>
                </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <% } %>

        <div class="row align-items-center">

            <div class="col-3">
            </div>

            <div class="col-6">
                <div class="mb-3">
                    <h4>Agrega una observación</h4>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="tbxObservacion" runat="server" CssClass="form-control" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Button ID="btnAgregarObservacion" runat="server" Text="Agregar" CssClass="btn btn-outline-primary" OnClick="btnAgregarObservacion_Click" Enabled="false"/>
                </div>
                <div class="mb-3">
                    <ul class="list-group list-group-flush" id="listaObservaciones" runat="server"></ul>
                </div>
                <div class="mb-8">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar Turno" CssClass="btn btn-primary btn-lg" OnClick="btnGuardar_Click"/>
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-lg" OnClick="btnCancelar_Click" />
                </div>
            </div>

            <div class="col-3">
            </div>
        </div>
</asp:Content>


