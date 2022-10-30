<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ClinicaWeb.Home" %>

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
            <div class="formulario">
                <h1>Inicio de sesión</h1>
                <form method="post">
                    <div class="username">
                        <input type="text" required />
                        <label>Nombre de usuario</label>
                    </div>
                    <div class="username">
                        <input type="password" required />
                        <label>Contraseña</label>
                    </div>
                    <%--<div class="recordar">¿Olvidó su contraseña?</div>--%>
                    <button type="submit">Iniciar</button>
                </form>
            </div>
        </div>
    </form>
</body>
</html>
