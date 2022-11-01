<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ClinicaWeb.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
                    <button type="submit" href="Turnos.aspx" >Iniciar</button>
                </form>
            </div>
</asp:Content>
