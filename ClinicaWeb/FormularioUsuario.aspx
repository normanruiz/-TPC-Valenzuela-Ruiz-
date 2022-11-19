<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioUsuario.aspx.cs" Inherits="ClinicaWeb.FormularioUsuario" %>



<asp:Content ID="contentBodyUsuario" ContentPlaceHolderID="cphBody" runat="server">

    <script>

        function Validar() {

            let estado = true

            let nombreUsuario = document.getElementById("tbxNombreUsuario").value;
            if (nombreUsuario === "") {
                document.getElementById("tbxNombreUsuario").className = "form-control is-invalid";
                document.getElementById("lblNombreUsuario").className = "form-label invalid-feedback";
                document.getElementById("lblNombreUsuario").innerText = "El campo no puede estar vacío.";
                estado = false;
            }
            else {
                document.getElementById("tbxNombreUsuario").className = "form-control is-valid";
                document.getElementById("lblNombreUsuario").innerText = "";
            }

            let contraseñaUsuario = document.getElementById("tbxContraseñaUsuario").value;
            let confirmarContraseñaUsuario = document.getElementById("tbxConfirmarContraseñaUsuario").value;

            if (contraseñaUsuario != confirmarContraseñaUsuario) {
                document.getElementById("tbxContraseñaUsuario").className = "form-control is-invalid";
                document.getElementById("tbxConfirmarContraseñaUsuario").className = "form-control is-invalid";
                document.getElementById("lblContraseñaUsuario").className = "form-label invalid-feedback";
                document.getElementById("lblContraseñaUsuario").innerText = "Las contraseñas no coinciden. ";
                document.getElementById("lblConfirmarContraseñaUsuario").className = "form-label invalid-feedback";
                document.getElementById("lblConfirmarContraseñaUsuario").innerText = "Las contraseñas no coinciden. ";
                estado = false;

                if (contraseñaUsuario === "") {
                    document.getElementById("tbxContraseñaUsuario").className = "form-control is-invalid";
                    document.getElementById("lblContraseñaUsuario").className = "form-label invalid-feedback";
                    document.getElementById("lblContraseñaUsuario").innerText += "La contraseña no puede estar vacía. ";
                    estado = false;
                }

                if (confirmarContraseñaUsuario === "") {
                    document.getElementById("tbxConfirmarContraseñaUsuario").className = "form-control is-invalid";
                    document.getElementById("lblConfirmarContraseñaUsuario").className = "form-label invalid-feedback";
                    document.getElementById("lblConfirmarContraseñaUsuario").innerText += "La contraseña no puede estar vacía. ";
                    estado = false;
                }

            }
            else {
                document.getElementById("tbxContraseñaUsuario").className = "form-control is-valid";
                document.getElementById("lblContraseñaUsuario").innerText = "";
                document.getElementById("tbxConfirmarContraseñaUsuario").className = "form-control is-valid";
                document.getElementById("lblConfirmarContraseñaUsuario").innerText = "";

                if (contraseñaUsuario === "") {
                    document.getElementById("tbxContraseñaUsuario").className = "form-control is-invalid";
                    document.getElementById("lblContraseñaUsuario").className = "form-label invalid-feedback";
                    document.getElementById("lblContraseñaUsuario").innerText += "La contraseña no puede estar vacía. ";
                    estado = false;
                }

                if (confirmarContraseñaUsuario === "") {
                    document.getElementById("tbxConfirmarContraseñaUsuario").className = "form-control is-invalid";
                    document.getElementById("lblConfirmarContraseñaUsuario").className = "form-label invalid-feedback";
                    document.getElementById("lblConfirmarContraseñaUsuario").innerText += "La contraseña no puede estar vacía. ";
                    estado = false;
                }

            }

            //if (contraseñaUsuario === "") {
            //    document.getElementById("tbxContraseñaUsuario").className = "form-control is-invalid";
            //    document.getElementById("lblContraseñaUsuario").className = "form-label invalid-feedback";
            //    document.getElementById("lblContraseñaUsuario").innerText += "La contraseña no puede estar vacia. ";
            //    estado = false;
            //}
            //else {
            //    document.getElementById("tbxContraseñaUsuario").className = "form-control is-valid";
            //    document.getElementById("lblContraseñaUsuario").innerText = "";
            //}

            //if (confirmarContraseñaUsuario === "") {
            //    document.getElementById("tbxConfirmarContraseñaUsuario").className = "form-control is-invalid";
            //    document.getElementById("lblConfirmarContraseñaUsuario").className = "form-label invalid-feedback";
            //    document.getElementById("lblConfirmarContraseñaUsuario").innerText += "La contraseña no puede estar vacia. ";
            //    estado = false;
            //}
            //else {
            //    document.getElementById("tbxConfirmarContraseñaUsuario").className = "form-control is-valid";
            //    document.getElementById("lblConfirmarContraseñaUsuario").innerText = "";
            //}


            return estado;

        }

    </script>

    <div class="container-fluid">
        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-8">
                <h1><%= tituloFormulario %></h1>
            </div>
            <div class="col-2">
            </div>
        </div>
        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-4">
                <div class="mb-3">
                    <label for="tbxNombreUsuario" class="form-label">Nombre de Usuario</label>
                    <asp:TextBox ID="tbxNombreUsuario" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblNombreUsuario" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="mb-3">
                    <label for="tbxContraseñaUsuario" class="form-label">Contraseña</label>
                    <asp:TextBox ID="tbxContraseñaUsuario" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblContraseñaUsuario" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="mb-3">
                    <label for="tbxConfirmarContraseñaUsuario" class="form-label">Repita la contraseña</label>
                    <asp:TextBox ID="tbxConfirmarContraseñaUsuario" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblConfirmarContraseñaUsuario" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="mb-3">
                    <label for="ddlPerfil" class="form-label">Tipo de perfil</label>
                    <asp:DropDownList ID="ddlPerfil" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>
            <div class="col-6">
            </div>
        </div>
        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-2">
                <asp:Button ID="btnGuardarUsuario" runat="server" Text="Guardar" CssClass="btn btn-primary btn-lg" OnClientClick="return Validar()" OnClick="btnGuardarUsuario_Click" />
            </div>
            <div class="col-2">
                <asp:Button ID="btnCancelarUsuario" runat="server" Text="Cancelar" CssClass="btn btn-primary btn-lg" OnClick="btnCancelarUsuario_Click" />
            </div>
            <div class="col-6">
            </div>
        </div>    
    </div>

</asp:Content>

