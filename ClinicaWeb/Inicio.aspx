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
    <div class="container">
        <div class="row">
            <div class="col"></div>
            <div class="col">
                <div class="login">
                    <div class="mb-3">
                        <h1>Inicio de sesión</h1>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="tbxNombre" CssClass="login-textbox" placeholder="Nombre de usuario" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                    <asp:TextBox TextMode="Password" ID="tbxContraseña" CssClass="login-textbox" placeholder="Contraseña" runat="server" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblalerta" for="tbxContraseña" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                    </div> 
                    <div class="mb-3">
                        <asp:Button ID="btnIniciar" runat="server" Text="Iniciar" OnClick="btnIniciar_Click" CssClass="btn btn-outline-light btn-lg" />
                    </div>
                </div>
            </div>
            <div class="col"></div>
        </div>
    </div>
    </form>
</body>
</html>


