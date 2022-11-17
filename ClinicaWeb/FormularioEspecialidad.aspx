<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioEspecialidad.aspx.cs" Inherits="ClinicaWeb.FormularioEspecialidad" %>




<asp:Content ID="contentBodyEspecialidad" ContentPlaceHolderID="cphBody" runat="server">

    <script>

        function Validar() {
            let especialidadNombre = document.getElementById("tbxEspecilidadNombre").value;
            if (especialidadNombre === "") {
                document.getElementById("tbxEspecilidadNombre").className = "form-control is-invalid";
                document.getElementById("lblEspecilidadNombre").className = "form-label invalid-feedback";
                document.getElementById("lblEspecilidadNombre").innerText = "El campo no puede estar vacio.";

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
            <div class="col-6">
                <h2><%= tituloFormulario %></h2>
                <div class="mb-3">
                    <label for="tbxEspecilidadNombre" class="form-label">Nombre de la especialidad</label>
                    <asp:TextBox ID="tbxEspecilidadNombre" runat="server" cssclass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblEspecilidadNombre" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <asp:Button ID="btnGuardarEspecialidad" runat="server" Text="Guardar" CssClass="boton" OnClientClick="return Validar()" OnClick="btnGuardarEspecialidad_Click"/>
                <asp:Button ID="btnCancelarEspecialidad" runat="server" Text="Cancelar" CssClass="boton" OnClick="btnCancelarEspecialidad_Click"/>
            </div>
        </div>
    </div>
    <hr />

</asp:Content>

