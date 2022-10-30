<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="ClinicaWeb.Medico" %>

<asp:Content ID="abmMedicos" ContentPlaceHolderID="MainContent" runat="server">

        <div class="container text-center">
            <p class="fw-semibold" style="font-size: 30px">Administracion de Medicos</p>
            <asp:GridView ID="dgvMedicos" runat="server" CssClass="table table-bordered table-light" >

            </asp:GridView>
        </div>

</asp:Content>
