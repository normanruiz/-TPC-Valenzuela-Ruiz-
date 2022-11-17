<%@ Page Title="Opssss !!! Algo ocurrio" Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="ClinicaWeb.Error" %>

<!DOCTYPE html>

<html lang="es">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %></title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="MisEstilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <%--<div class="error">--%>
        <div class="error">
            <h1>Opssss !!! Algo ocurrio</h1>
            <p><%: errorInformado.ToString() %></p>
            <a href="<%: paginaOrigen  %>">Volver</a>
            <%--<asp:Button ID="btnError" runat="server" Text="Volver al inicio" CssClass="boton" />--%>
        </div>
    </form>
</body>
</html>
