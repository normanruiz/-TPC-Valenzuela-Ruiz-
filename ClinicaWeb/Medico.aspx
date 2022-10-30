<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="ClinicaWeb.Medico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="es">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - Mi aplicación ASP.NET</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <%--<link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />--%>
    <link rel="stylesheet" href="MisEstilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container text-center">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <a class="navbar-brand" runat="server">ADMINISTRAR TURNOS</a>
                </div>
            </div>
            <p class="fw-semibold" style="font-size: 30px">Mis turnos</p>
            <%--<asp:GridView ID="dgvTurnosMedico" runat="server" DataKeyNames="Numero" OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" CssClass="table table-bordered table-light" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Nombre del paciente" DataField="Paciente.Nombre" />
                        <asp:BoundField HeaderText="Especialidad" DataField="Especialidad" />
                        <asp:BoundField HeaderText="Horario" DataField="Horario.Fecha" />
                        <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" />
                        <asp:BoundField HeaderText="Fecha de Creacion" DataField="FechaCreacion" />
                        <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Accion" />
                    </Columns>
                </asp:GridView>--%>
        </div>
    </form>
</body>
</html>
