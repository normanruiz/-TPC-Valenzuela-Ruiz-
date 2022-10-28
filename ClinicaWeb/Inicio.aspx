<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ClinicaWeb.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container-sm" style="background-color:blueviolet; margin: 10% 30% 10% 35%; padding:5% 5% 5% 5%; border-radius:20px">
                <div class="rounded"  >
                    <div class="col">
                    <label for="txtUsuario" class="form-label" style="padding-bottom:5px; padding-top:10px" >Usuario</label>
                    <input type="email" class="form-control" id="txtUsuario" aria-describedby="emailHelp">
                    <%--<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>--%>
                </div>
                <div class="col">
                    <label for="txtContrasenia" class="form-label" style="padding-bottom:5px; padding-top:10px" >Contraseña</label>
                    <input type="password" class="form-control"  id="txtContrasenia">
                </div>
                <%--<div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Recordar mi usuario</label>
                </div>--%>
                <button type="submit" class="btn btn-warning" style="margin-top:35px">Ingresar</button>
        </div>
                </div>
                

</asp:Content>



