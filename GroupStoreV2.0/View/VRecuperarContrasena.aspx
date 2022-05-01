<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VRecuperarContrasena.aspx.cs" Inherits="View_VRecuperarContrasena" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Recuperación de contraseña</title>
</head>
<body>
    <form id="formCambioContraseña" runat="server">
        <div
            class="container-fluid border border-2 rounded-3 col-12 col-md-9 col-lg-4 my-5">
            <img
                src="../Resources/Pagina/logoGroupStore.jpg"
                class="img-fluid w-auto rounded-3 shadow my-2 mx-auto d-block"
                alt="Logo GroupStore" />
            <div class="row mt-5">
                <div class="text-sm-center">
                    <span>¡Gracias! Su correo electrónico ha sido confirmado.</span>
                    <span class="h6">Introduzca una nueva contraseña</span>
                </div>
            </div>
            <div class="row mb-1 mt-4">
                <div class="form-floating">
                    <input
                        type="password"
                        class="form-control"
                        runat="server"
                        id="I_Contrasena"
                        placeholder="Nueva contraseña" />
                    <label for="I_Contrasena" class="ms-1">Nueva contraseña</label>
                </div>
            </div>
            <div class="row my-1">
                <asp:RequiredFieldValidator ID="RFV_Contraseña" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Debe llenar este espacio" ControlToValidate="I_Contrasena" ValidationGroup="CContrasena"></asp:RequiredFieldValidator>
            </div>
            <div class="row mb-1">
                <div class="form-floating">
                    <input
                        type="password"
                        class="form-control"
                        id="I_CContrasena"
                        runat="server"
                        placeholder="Confirme su contraseña" />
                    <label for="I_CContrasena" class="ms-1">Confirmar contraseña</label>
                </div>
            </div>
            <div class="row my-1">
                <asp:RequiredFieldValidator ID="RFV_CContraseña" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Debe llenar este espacio" ControlToValidate="I_CContrasena" ValidationGroup="CContrasena"></asp:RequiredFieldValidator>
            </div>
            <div class="row justify-content-center px-2 my-3">
                <input
                    validationgroup="CContrasena"
                    runat="server"
                    id="CambiarContrasena"
                    onserverclick="CambiarContrasena_ServerClick"
                    type="button"
                    class="btn btn-outline-primary"
                    value="Cambiar contraseña" />
            </div>
            <div class="row my-1">
                <asp:CompareValidator ID="CV_Contrasenas" runat="server" ForeColor="Red" ErrorMessage="Las contraseñas deben ser iguales." Display="Dynamic" ControlToCompare="I_Contrasena" ControlToValidate="I_CContrasena" ValidationGroup="CContrasena"></asp:CompareValidator>
                <asp:RegularExpressionValidator ID="REV_Contrasena" runat="server" ForeColor="Red" ErrorMessage="La contraseña debe contener al menos un número y una letra mayúscula y minúscula, y al menos 8 o más caracteres" ControlToValidate="I_Contrasena" ValidationGroup="CContrasena" ValidationExpression="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,50}" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>
    </form>
</body>
</html>
