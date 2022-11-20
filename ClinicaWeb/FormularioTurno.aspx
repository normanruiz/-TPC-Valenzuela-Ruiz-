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

        <div class="row align-items-center">
            <div class="col-3"></div>
            <div class="col-2">
                <label for="ddlMedicos" class="form-label">Médicos</label>
                <asp:DropDownList ID="ddlMedicos" runat="server" CssClass="form-select"></asp:DropDownList>
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
                <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
                <asp:DataList ID="DataList2" runat="server"></asp:DataList>
            </div>
            <div class="col-5"></div>
        </div>
    </div>
    <div class="row align-items-center">
        <div class="col-3"></div>
        <div class="col-4">
            <div class="mb-3">
                <h4>Agrega una observación</h4>
            </div>
            <div class="mb-3">
                <asp:TextBox ID="tbxObservacion" runat="server" CssClass="form-control" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnObservacion" runat="server" Text="Agregar" CssClass="btn btn-outline-primary" />
            </div>
            <div class="mb-3">
                <asp:DataList ID="dlObservaciones" runat="server"></asp:DataList>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnTurno" runat="server" Text="Guardar Turno" CssClass="btn btn-primary btn-lg" />
            </div>
        </div>
        <div class="col-5"></div>
    </div>

</asp:Content>


