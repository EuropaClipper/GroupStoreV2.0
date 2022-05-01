<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VRegistro.aspx.cs" Inherits="View_VRegistro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Registro</title>
</head>
<body>
    <form runat="server">
        <header class="p-3 bg-dark text-white">
            <nav class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between pb-2 mb-4 border-bottom bg-dark">
                <a class="navbar-brand text-light" href="VPrincipal.aspx">
                    <i class="bi bi-shop-window"></i>
                    GroupStore
                </a>
                <ul class="nav nav-pills col-12 col-md-5 mb-2 justify-content-center mb-md-0">
                    <li class="nav-item"><a runat="server" id="inicio" class="nav-link">Inicio</a></li>
                    <li class="nav-item"><a runat="server" id="categoria" class="nav-link">Categoria</a></li>
                    <li class="nav-item"><a runat="server" id="tiendas" class="nav-link">Tiendas</a></li>
                    <li class="nav-item"><a runat="server" id="proveedores" class="nav-link">Proveedores</a></li>
                    <li class="nav-item"><a runat="server" id="contacto" class="nav-link">Contacto</a></li>
                </ul>
                <div class="col-12 col-lg-auto mb-3 mb-lg-0 me-0">
                    <div class="input-group">
                        <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search" />
                        <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="bi bi-search"></i></button>
                    </div>
                </div>
                <div class="text-end">
                    <button type="button" class="btn btn-outline-primary me-2 p-0"><a class="nav-link" href="VInicioSesion.aspx">Iniciar Sesión</a></button>
                    <button type="button" class="btn btn-primary p-0"><a class="nav-link" href="VRegistro.aspx"><span class="text-white">Registrarse</span></a></button>
                </div>
            </nav>
        </header>
        <div class="container-fluid my-3 justify-content-center">
            <div class="row">
                <!--Imagen que se oculta-->
                <div class="col my-auto d-none d-lg-block">
                    <img
                        src="../Resources/Pagina/Img_Registro.png"
                        class="rounded-3 w-100"
                        alt="Imagen de registro" />
                </div>
                <!---->
                <!--Columna ingreso de datos para el registro-->
                <div class="col">
                    <!--mensaje de bienvenida-->
                    <div class="text-center mt-3">
                        <h2 class="fw-bold text-center m-3">Bienvenido a GroupStore</h2>
                    </div>
                    <!---->
                    <!--Fila selección de rol-->
                    <div class="row justify-content-center">
                        <div class="col-9 col-md-4">
                            <div class="text-center">
                                <span class="text-black">Seleccione una opción</span>
                            </div>
                        </div>
                        <div class="col-5 col-md-4 p-0">
                            <asp:DropDownList ID="DDL_Roles" runat="server" class="form-select" AutoPostBack="True">
                                <asp:ListItem Selected="True">Comprador</asp:ListItem>
                                <asp:ListItem>Proveedor</asp:ListItem>
                                <asp:ListItem>Negocio</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <!---->
                    <!--obtener los datos del registro usuarios y negocios-->
                    <div class="mt-4 ps-4 ps-md-5 py-4 shadow-lg">
                        <asp:MultiView ID="MV_Registro" runat="server">
                            <!--Registro de negocios-->
                            <asp:View ID="V_RNegocio" runat="server">
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="col-11 mx-1 form-text">
                                        <span class="form-label text-black">Información del negocio</span>
                                    </div>
                                </div>
                                <!-- Fila de nombre-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="form-floating mx-1 col-11">
                                        <input
                                            runat="server"
                                            type="text"
                                            class="form-control"
                                            id="I_NombreNegocio"
                                            placeholder="Digite el nombre del negocio"
                                            required
                                            title="Debe contener caracteres alfanumericos con una extension de almenos 3 caracteres"
                                            pattern="[A-Za-z0-9 &.-]{3,30}" />
                                        <label for="I_Nombres">Nombre del negocio</label>
                                    </div>
                                </div>
                                <!---->
                                <!--Fila NIT-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="form-floating mx-1 col-11">
                                        <input
                                            runat="server"
                                            type="text"
                                            class="form-control"
                                            id="I_Nit"
                                            placeholder="NIT de su negocio"
                                            required
                                            title="El NIT solo permite datos numericos y debe ser de tamaño 10"
                                            pattern="[0-9]{10}" />
                                        <label class="px-3" for="I_Cedula">NIT del negocio</label>
                                    </div>
                                </div>
                                <div class="row px-3">
                                    <!-- Mensajes de Verificación -->
                                    <div id="ErrorNIT" runat="server" class="d-none" role="alert">
                                        Este NIT ya se encuentra registrado.
                                    </div>
                                </div>
                                <!---->
                                <!--Fila telefono-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="form-floating mx-1 col-11">
                                        <input
                                            runat="server"
                                            type="text"
                                            class="form-control"
                                            id="I_TelefonoNegocio"
                                            placeholder="Teléfono"
                                            required
                                            title="El telefono solo permite datos numericos y debe ser de tamaño 10"
                                            pattern="[0-9]{10}" />
                                        <label class="px-3" for="I_Telefono">Teléfono</label>
                                    </div>
                                </div>
                                <!---->
                                <!--Fila dirección-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="form-floating mx-1 col-11">
                                        <input
                                            runat="server"
                                            type="text"
                                            class="form-control"
                                            id="I_DireccionNegocio"
                                            placeholder="Dirección"
                                            required
                                            title="La direccion solo permite caracteres alfanumericos, #, - y º"
                                            pattern="[A-Za-z0-9 #-]{5,50}" />
                                        <label class="px-3" for="I_Direccion">Dirección</label>
                                    </div>
                                </div>
                                <!---->
                                <!--Registro del admin-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="col-11 mx-1 form-text">
                                        <span class="form-label text-black">Información de administrador</span>
                                    </div>
                                </div>
                                <!-- Fila de nombre-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="container d-inline-flex">
                                        <div class="form-floating px-1 col-5">
                                            <input
                                                runat="server"
                                                type="text"
                                                class="form-control"
                                                id="I_NombresAdmin"
                                                placeholder="Digite sus nombres"
                                                required
                                                title="El nombre solo permite caracteres alfabeticos y debe ser de tamaño mayor a 3 caracteres"
                                                pattern="[A-Za-z ]{3,30}" />
                                            <label for="I_NombresAdmin">Nombres</label>
                                        </div>
                                        <div class="form-floating col-6">
                                            <input
                                                runat="server"
                                                type="text"
                                                class="form-control"
                                                id="I_ApellidosAdmin"
                                                placeholder="Digite sus apellidos"
                                                required
                                                title="El apellido solo permite caracteres alfabeticos y debe ser de tamaño mayor a 3 caracteres"
                                                pattern="[A-Za-z ]{3,30}" />
                                            <label for="I_ApellidosAdmin">Apellidos</label>
                                        </div>
                                    </div>
                                </div>
                                <!---->
                                <!--Fila cedula-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="form-floating mx-1 col-11">
                                        <input
                                            runat="server"
                                            type="text"
                                            class="form-control"
                                            id="I_CedulaAdmin"
                                            placeholder="Cédula de ciudadanía"
                                            required
                                            title="La cedula solo permite caracteres numericos y debe contener entre 8 y 10 caracteres"
                                            pattern="[0-9]{8,10}" />
                                        <label class="px-3" for="I_CedulaAdmin">Cédula de ciudadanía</label>
                                    </div>
                                </div>
                                <div class="row px-3">
                                    <!-- Mensajes de Verificación -->
                                    <div id="errorCedulaAdmin" runat="server" class="d-none" role="alert">
                                        Esta cédula ya se encuentra registrada.
                                    </div>
                                </div>
                                <!---->
                                <!--Fila correo electrónico-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="form-floating mx-1 col-11">
                                        <input
                                            runat="server"
                                            type="email"
                                            class="form-control"
                                            id="I_CorreoAdmin"
                                            placeholder="Correo electrónico"
                                            required />
                                        <label class="px-3" for="I_CorreoAdmin">Ingrese su correo electrónico</label>
                                    </div>
                                </div>
                                <div class="row px-3">
                                    <!-- Mensajes de Verificación -->
                                    <div id="errorCorreoAdmin" runat="server" class="d-none" role="alert">
                                        El correo ya está en uso. Elige otro.
                                    </div>
                                </div>
                                <!---->
                                <!-- Fila de Contraseña-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="container d-inline-flex">
                                        <div class="form-floating px-1 col-5">
                                            <input
                                                runat="server"
                                                type="password"
                                                class="form-control"
                                                id="I_ContrasenaAdmin"
                                                placeholder="Digite sus nombres"
                                                required
                                                title="Debe contener al menos un número y una letra mayúscula y minúscula, y al menos 8 o más caracteres"
                                                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,50}" />
                                            <label for="I_ContrasenaAdmin">Contraseña</label>
                                        </div>
                                        <div class="form-floating col-6">
                                            <input
                                                runat="server"
                                                type="password"
                                                class="form-control"
                                                id="I_CContrasenaAdmin"
                                                placeholder="Digite sus apellidos"
                                                required
                                                title="Debe contener al menos un número y una letra mayúscula y minúscula, y al menos 8 o más caracteres"
                                                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,50}" />
                                            <label for="I_CContrasenaAdmin">Confirmación</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row px-3">
                                    <!-- Mensajes de Verificación -->
                                    <div id="errorContrasenaAdmin" runat="server" class="alert alert-danger col-11  d-none" role="alert">
                                        Las Contraseñas no coinciden, vuelva a intentar !
                                    </div>
                                </div>
                                <!---->
                                <!---->
                            </asp:View>
                            <!---->
                            <!--Registro de usuarios compradores y proveedores-->
                            <asp:View ID="V_RUsuarios" runat="server">
                                <!-- Fila de nombre-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="container d-inline-flex">
                                        <div class="form-floating px-1 col-5">
                                            <input
                                                runat="server"
                                                type="text"
                                                class="form-control"
                                                id="I_Nombres"
                                                placeholder="Digite sus nombres"
                                                required
                                                title="Solo se permiten caracteres alfabeticos, la longitud debe ser mayor o igual a 3 caracteres"
                                                pattern="[A-Za-z ñÑ]{3,30}" />
                                            <label for="I_Nombres">Nombres</label>
                                        </div>
                                        <div class="form-floating col-6">
                                            <input
                                                runat="server"
                                                type="text"
                                                class="form-control"
                                                id="I_Apellidos"
                                                placeholder="Digite sus apellidos"
                                                required
                                                title="Solo se permiten caracteres alfabeticos, la longitud debe ser mayor o igual a 3 caracteres"
                                                pattern="[A-Za-z ñÑ]{3,30}" />
                                            <label for="I_Apellidos">Apellidos</label>
                                        </div>
                                    </div>
                                </div>
                                <!---->
                                <!--Fila cedula-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="form-floating mx-1 col-11">
                                        <input
                                            runat="server"
                                            type="text"
                                            class="form-control"
                                            id="I_Cedula"
                                            placeholder="Cédula de ciudadanía"
                                            required
                                            title="Debe contener 10 digitos numericos"
                                            pattern="[0-9]{10}" />
                                        <label class="px-3" for="I_Cedula">Cédula de ciudadanía</label>
                                    </div>
                                </div>
                                <div class="row px-3">
                                    <!-- Mensajes de Verificación -->
                                    <div id="errorCedula" runat="server" class="d-none" role="alert">
                                        Esta cédula ya se encuentra registrada.
                                    </div>
                                </div>
                                <!---->
                                <!--Fila correo electrónico-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="form-floating mx-1 col-11">
                                        <input
                                            runat="server"
                                            type="email"
                                            class="form-control"
                                            id="I_Correo"
                                            placeholder="Correo electrónico"
                                            required />
                                        <label class="px-3" for="I_Correo">Ingrese su correo electrónico</label>
                                    </div>
                                </div>
                                <div class="row px-3">
                                    <!-- Mensajes de Verificación -->
                                    <div id="errorCorreo" runat="server" class="d-none" role="alert">
                                        El correo ya está en uso. Elige otro.
                                    </div>
                                </div>
                                <!---->
                                <!-- Fila de Contraseña-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="container d-inline-flex">
                                        <div class="form-floating px-1 col-5">
                                            <input
                                                runat="server"
                                                type="password"
                                                class="form-control"
                                                id="I_Contrasena"
                                                placeholder="Digite su contraseña"
                                                required
                                                title="Debe contener al menos un número y una letra mayúscula y minúscula, y al menos 8 o más caracteres"
                                                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,50}" />
                                            <label for="I_Contrasena">Contraseña</label>
                                        </div>
                                        <div class="form-floating col-6">
                                            <input
                                                runat="server"
                                                type="password"
                                                class="form-control"
                                                id="I_CContrasena"
                                                placeholder="Digite su contraseña"
                                                required
                                                title="Debe contener al menos un número y una letra mayúscula y minúscula, y al menos 8 o más caracteres"
                                                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,50}" />
                                            <label for="I_CContrasena">Confirmación</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row px-3">
                                    <!-- Mensajes de Verificación -->
                                    <div id="errorContrasena" runat="server" class="alert alert-danger col-11  d-none" role="alert">
                                        Las Contraseñas no coinciden, vuelva a intentar !
                                    </div>
                                </div>
                                <!---->
                                <!--Fila telefono-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="form-floating mx-1 col-11">
                                        <input
                                            runat="server"
                                            type="tel"
                                            class="form-control"
                                            id="I_Telefono"
                                            placeholder="Teléfono"
                                            required
                                            title="Debe contener 10 digitos numericos sin caracteres ni espacios"
                                            pattern="[0-9]{10}" />
                                        <label class="px-3" for="I_Telefono">Teléfono</label>
                                    </div>
                                </div>
                                <!---->
                                <!--Fila dirección-->
                                <div class="row mb-2 mb-md-3 mb-lg-3">
                                    <div class="form-floating mx-1 col-11">
                                        <input
                                            runat="server"
                                            type="text"
                                            class="form-control"
                                            id="I_Direccion"
                                            placeholder="Dirección"
                                            required
                                            title="Verifique su direccion"
                                            pattern="[A-Za-z0-9 ñÑ \-#]{3,50}" />
                                        <label class="px-3" for="I_Direccion">Dirección</label>
                                    </div>
                                </div>
                                <!---->
                                <asp:MultiView ID="MV_Registro_Usuarios" runat="server">
                                    <asp:View ID="V_RUComprador" runat="server"></asp:View>
                                    <asp:View ID="V_RUProveedor" runat="server">
                                        <!--Fila empresa-->
                                        <div class="row mb-2 mb-md-3 mb-lg-3">
                                            <div class="form-floating mx-1 col-11">
                                                <input
                                                    runat="server"
                                                    type="text"
                                                    class="form-control"
                                                    id="I_Empresa"
                                                    placeholder="Empresa"
                                                    title="bebe contener caracteres alfanumericos # - &"
                                                    pattern="[A-Za-z0-9 ñÑ#-&]{3,}" />
                                                <label class="px-3" for="I_Empresa">Empresa</label>
                                            </div>
                                        </div>
                                        <!---->
                                        <!--Fila certificados-->
                                        <div class="row mb-2">
                                            <div class="col-11">
                                                <span class="form-label h6">Agregue sus certificados de calidad</span>
                                                <div class="input-group mb-2">
                                                    <label class="input-group-text" for="inputGroupFile01">
                                                        Certificados</label>
                                                    <input
                                                        runat="server"
                                                        type="file"
                                                        class="form-control"
                                                        id="inputGroupFile01"
                                                        multiple />
                                                </div>
                                            </div>
                                        </div>
                                        <!---->
                                    </asp:View>
                                </asp:MultiView>
                            </asp:View>
                            <!---->
                        </asp:MultiView>
                        <!--Fila boton registrar-->
                        <div class="row mb-3">
                            <div class="col-11 mx-1 d-grid">
                                <input
                                    runat="server"
                                    onserverclick="Btn_Continuar_clic"
                                    type="submit"
                                    class="btn btn-lg btn-success"
                                    value="Continuar" />
                            </div>
                        </div>
                        <!---->
                        <!--Redirección a iniciar sesion-->
                        <div class="row">
                            <div class="col-11">
                                <div class="form-text">
                                    <span class="form-label text-secondary">¿Ya tienes cuenta en GroupStore?</span>
                                    <a href="VInicioSesion.aspx" class="text-decoration-none text-black">Inicia sesión</a>
                                </div>
                            </div>
                        </div>
                        <!---->
                    </div>
                    <!---->
                </div>
                <!---->
            </div>
        </div>
        <footer class="py-4 bg-dark  mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Diseñado por GroupStore</div>
                    <div>
                        <a href="#">Politica de privacidad</a>
                        &middot;
                                <a href="#">Terminos &amp; Condiciones</a>
                    </div>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
