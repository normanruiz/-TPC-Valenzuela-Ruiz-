<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioEspecialidad.aspx.cs" Inherits="ClinicaWeb.FormularioEspecialidad" %>




<asp:Content ID="contentBodyEspecialidad" ContentPlaceHolderID="cphBody" runat="server">

    <script>

        function Validar() {
            let especialidadNombre = document.getElementById("tbxEspecilidadNombre").value;
            if (especialidadNombre === "") {
                document.getElementById("tbxEspecilidadNombre").className = "form-control is-invalid";
                document.getElementById("lblEspecilidadNombre").className = "form-label invalid-feedback";
                document.getElementById("lblEspecilidadNombre").innerText = "El campo no puede estar vacío.";

                return false;
            }
            else {
                document.getElementById("tbxEstadoDescripcion").className = "form-control is-valid";
                document.getElementById("tbxEstadoDescripcion").innerText = "";
                return true;
            }
        }

    </script>

    <div class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <h1><%= tituloFormulario %></h1>
            </div>
            <div class="col-3"></div>
        </div>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-4">
                <div class="mb-3">
                    <label for="tbxEspecilidadNombre" class="form-label">Nombre de la especialidad</label>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="tbxEspecilidadNombre" runat="server" cssclass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblEspecilidadNombre" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
            </div>
            <div class="col-5"></div>
        </div>
        <div class="row">
            <div class="col-3">
            </div>
            <div class="col-2">
                <asp:Button ID="btnGuardarEspecialidad" runat="server" Text="Guardar" CssClass="btn btn-primary btn-lg" OnClientClick="return Validar()" OnClick="btnGuardarEspecialidad_Click"/>
            </div>
            <div class="col-2">
                <asp:Button ID="btnCancelarEspecialidad" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-lg" OnClick="btnCancelarEspecialidad_Click"/>
            </div>
            <div class="col-5">
            </div>
        </div>
    </div>

</asp:Content>

