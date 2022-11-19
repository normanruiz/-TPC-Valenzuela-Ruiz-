<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioEstado.aspx.cs" Inherits="ClinicaWeb.FormularioEstado" %>


<asp:Content ID="contentBodyEstado" ContentPlaceHolderID="cphBody" runat="server">

    <script>

        function Validar() {
            let estadoDescripcion = document.getElementById("tbxEstadoDescripcion").value;
            if (estadoDescripcion === "") {
                document.getElementById("tbxEstadoDescripcion").className = "form-control is-invalid";
                document.getElementById("lblEstadoDescripcion").innerText = "El campo no puede estar vacío.";
                document.getElementById("lblEstadoDescripcion").className = "form-label invalid-feedback";

                return false;
            }
            else {
                document.getElementById("tbxEstadoDescripcion").className = "form-control is-valid";
                document.getElementById("lblEstadoDescripcion").innerText = "";
                return true;
            }
        }

    </script>

    <div class="container-fluid">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-4">
                <h1><%= tituloFormulario %></h1>
                <div class="mb-3">
                    <label for="tbxEstadoDescripcion" class="form-label">Nombre del estado</label>
                    <asp:TextBox ID="tbxEstadoDescripcion" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblEstadoDescripcion" for="tbxEstadoDescripcion" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
            </div>
            <div class="col-5"></div>
        </div>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-2">
                <asp:Button ID="btnGuardarEstado" runat="server" Text="Guardar" CssClass="btn btn-primary btn-lg" OnClientClick="return Validar()" OnClick="btnGuardarEstado_Click" />
            </div>
            <div class="col-2">
                <asp:Button ID="btnCancelarEstado" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-lg" OnClick="btnCancelarEstado_Click" />
            </div>
            <div class="col-5"></div>
        </div>
    </div>

</asp:Content>

