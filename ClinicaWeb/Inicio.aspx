<%@ Page Title="Inicio" Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ClinicaWeb.Inicio" %>

<!DOCTYPE html>

<html lang="es">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - Inicio </title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="MisEstilos.css" />
</head>
<body>

    <header>
        <h1>Clínica Médica</h1>
    </header>

    <form id="form1" runat="server">
        <div class="formulario">
            <h1>Inicio de sesión</h1>
            <form method="post">
                <div class="username">
                    <label for="tbxNombre" class="form-label">Nombre de usuario</label>
                    <asp:TextBox ID="tbxNombre" for="tbxNombre" runat="server" Text="" ClientIDMode="Static"></asp:TextBox>
                  <%--  <input type="text" required />
                    <label for="" >Nombre de usuario</label>--%>
                </div>
                <div class="username">
                    <label for="tbxContraseña" class="form-label">Contraseña</label>
                    <asp:TextBox TextMode="Password" ID="tbxContraseña" runat="server" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblalerta" for="tbxContraseña" runat="server" Text="" ClientIDMode="Static"></asp:Label>
<%--                    <input type="password" required />
                    <label>Contraseña</label>--%>
                </div>
                <%--<div class="recordar">¿Olvidó su contraseña?</div>--%>
                <asp:Button ID="btnIniciar" runat="server" Text="Iniciar" OnClick="btnIniciar_Click" CssClass="botonInicio" />
            </form>
        </div>
    </form>
</body>
</html>


