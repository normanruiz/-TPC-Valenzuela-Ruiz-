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
                    <asp:TextBox ID="tbxDNI" runat="server" CssClass="form-control" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblDNI" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="mb-3">
                    <label for="ddlEspecialidad" class="form-label">Especialidad Médica</label>
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <asp:CheckBox ID="ckbDni" runat="server" ClientIDMode="Static" AutoPostBack="true" />
                    <label for="ckbDni" class="form-check-label">Carga Manual</label>
                </div>
            </div>
            <div class="col-2">
                <div class="mb-3"></div>
                <div class="mb-3">
                    <asp:Button ID="btnBuscarDni" runat="server" Text="Buscar Paciente" CssClass="btn btn-outline-primary" />
                </div>
            </div>
            <div class="col-5">
            </div>
        </div>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-2">
                <div class="card text-white text-center bg-dark  mb-3" style="max-width: 18rem;">
                    <div class="card-header">Nombre del medico</div>
                    <div class="card-body">
                        <h5 class="card-title">Fecha</h5>
                        <p class="card-text">Hora disponible</p>
                        <asp:Button ID="btnTurno1" runat="server" Text="Elegir" CssClass="btn btn-outline-primary" />
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="card text-white text-center bg-dark  mb-3" style="max-width: 18rem;">
                    <div class="card-header">Nombre del medico</div>
                    <div class="card-body">
                        <h5 class="card-title">Fecha</h5>
                        <p class="card-text">Hora disponible</p>
                        <asp:Button ID="btnTurno2" runat="server" Text="Elegir" CssClass="btn btn-outline-primary" />
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="card text-white text-center bg-dark  mb-3" style="max-width: 18rem;">
                    <div class="card-header">Nombre del medico</div>
                    <div class="card-body">
                        <h5 class="card-title">Fecha</h5>
                        <p class="card-text">Hora disponible</p>
                        <asp:Button ID="btnTurno3" runat="server" Text="Elegir" CssClass="btn btn-outline-primary" />
                    </div>
                </div>
            </div>
            <div class="col-3"></div>
        </div>

    </div>

    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    <asp:DataList ID="DataList1" runat="server"></asp:DataList>
    <p>///Data list con los horarios disponibles///</p>
    <button class="btn btn-outline-success" type="button">Elegir Turno</button>

    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="boton" OnClick="btnGuardar_Click" />
    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="boton" OnClick="btnCancelar_Click" />

</asp:Content>


