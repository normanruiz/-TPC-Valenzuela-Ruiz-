<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioPaciente.aspx.cs" Inherits="ClinicaWeb.FormularioPaciente" %>



<asp:Content ID="contentBodyPaciente" ContentPlaceHolderID="cphBody" runat="server">

    <script>

        function Validar() {

            let estado = true;

            let pacienteDNI = document.getElementById("tbxDNI").value;
            if (pacienteDNI === "") {
                document.getElementById("tbxDNI").className = "form-control is-invalid";
                document.getElementById("lblDNI").innerText = "El campo no puede estar vacio.";
                document.getElementById("lblDNI").className = "form-label invalid-feedback";

                estado = false;
            }
            else {
                document.getElementById("tbxDNI").className = "form-control is-valid";
                document.getElementById("lblDNI").innerText = "";
            }

            let pacienteNombre = document.getElementById("tbxNombre").value;
            if (pacienteNombre === "") {
                document.getElementById("tbxNombre").className = "form-control is-invalid";
                document.getElementById("lblNombre").innerText = "El campo no puede estar vacio.";
                document.getElementById("lblNombre").className = "form-label invalid-feedback";

                estado = false;
            }
            else {
                document.getElementById("tbxNombre").className = "form-control is-valid";
                document.getElementById("lblNombre").innerText = "";
            }

            let pacienteApelliddo = document.getElementById("tbxApellido").value;
            if (pacienteApelliddo === "") {
                document.getElementById("tbxApellido").className = "form-control is-invalid";
                document.getElementById("lblApellido").innerText = "El campo no puede estar vacio.";
                document.getElementById("lblApellido").className = "form-label invalid-feedback";

                estado = false;
            }
            else {
                document.getElementById("tbxApellido").className = "form-control is-valid";
                document.getElementById("lblApellido").innerText = "";
            }

            let pacienteEmail = document.getElementById("tbxEmail").value;
            if (pacienteEmail === "") {
                document.getElementById("tbxEmail").className = "form-control is-invalid";
                document.getElementById("lblEmail").innerText = "El campo no puede estar vacio.";
                document.getElementById("lblEmail").className = "form-label invalid-feedback";

                estado = false;
            }
            else {
                document.getElementById("tbxEmail").className = "form-control is-valid";
                document.getElementById("lblEmail").innerText = "";
            }

            let pacienteFechaNacimiento = document.getElementById("tbxFechaNacimiento").value;
            if (pacienteFechaNacimiento === "") {
                document.getElementById("tbxFechaNacimiento").className = "form-control is-invalid";
                document.getElementById("lblFechaNacimiento").innerText = "El campo no puede estar vacio.";
                document.getElementById("lblFechaNacimiento").className = "form-label invalid-feedback";

                estado = false;
            }
            else {
                document.getElementById("tbxFechaNacimiento").className = "form-control is-valid";
                document.getElementById("lblFechaNacimiento").innerText = "";
            }

            let pacienteTelefono = document.getElementById("tbxTelefono").value;
            if (pacienteTelefono === "") {
                document.getElementById("tbxTelefono").className = "form-control is-invalid";
                document.getElementById("lblTelefono").innerText = "El campo no puede estar vacio.";
                document.getElementById("lblTelefono").className = "form-label invalid-feedback";

                estado = false;
            }
            else {
                document.getElementById("tbxTelefono").className = "form-control is-valid";
                document.getElementById("lblTelefono").innerText = "";
            }

            let pacienteDireccion = document.getElementById("tbxDireccion").value;
            if (pacienteDireccion === "") {
                document.getElementById("tbxDireccion").className = "form-control is-invalid";
                document.getElementById("lblDireccion").innerText = "El campo no puede estar vacio.";
                document.getElementById("lblDireccion").className = "form-label invalid-feedback";

                estado = false;
            }
            else {
                document.getElementById("tbxDireccion").className = "form-control is-valid";
                document.getElementById("lblDireccion").innerText = "";
            }

            return estado;
        }

    </script>

    <div class="container">
        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-8">
                <p class="fw-semibold" style="font-size: 30px"><%= tituloFormulario %></p>
            </div>
            <div class="col-2">
            </div>
        </div>

        <div class="row">
            <div class="col-2">
            </div>
            <div class="col-4">
                <%-- Aca arranca la carga de la persona --%>
                <div class="mb-3">
                    <label for="tbxDNI" class="form-label">Documento Nacional de Identidad</label>
                    <asp:TextBox ID="tbxDNI" runat="server" CssClass="form-control" OnTextChanged="tbxDNI_TextChanged" AutoPostBack="true" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblDNI" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="mb-3">
                    <label for="tbxNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="tbxNombre" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblNombre" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="mb-3">
                    <label for="tbxApellido" class="form-label">Apellido</label>
                    <asp:TextBox ID="tbxApellido" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblApellido" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="mb-3">
                    <label for="tbxEmail" class="form-label">Email</label>
                    <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblEmail" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
            </div>
            <div class="col-4">
                <%-- aca arranca la carga del paciente --%>
                <div class="mb-3">
                    <label for="tbxFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                    <asp:TextBox ID="tbxFechaNacimiento" runat="server" TextMode="Date" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblFechaNacimiento" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="mb-3">
                    <label for="tbxTelefono" class="form-label">Telefono</label>
                    <asp:TextBox ID="tbxTelefono" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblTelefono" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
                <div class="mb-3">
                    <label for="tbxDireccion" class="form-label">Direccion</label>
                    <asp:TextBox ID="tbxDireccion" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Label ID="lblDireccion" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                </div>
            </div>
            <div class="col-2">
            </div>
        </div>
        <div class="row">
            <div class="col-3">
            </div>
            <div class="col-6">
                <%-- acordate de mandar el usuario en null --%>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="boton" OnClientClick="return Validar()" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="boton" OnClick="btnCancelar_Click" />
            </div>
            <div class="col-3">
            </div>
        </div>

    </div>

    <hr />

</asp:Content>

