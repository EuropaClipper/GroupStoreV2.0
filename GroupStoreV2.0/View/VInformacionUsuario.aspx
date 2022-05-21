<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VInformacionUsuario.aspx.cs" Inherits="View_VInformacionUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Perfil de usuario</title>
</head>
<body>
    <asp:MultiView ID="MV_NavUsuarios" runat="server">
        <asp:View runat="server">
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark position-sticky sticky-top py-4 mb-5">
                <!-- Navbar Brand-->
                <a class="navbar-brand text-light" href="VPrincipal.aspx">
                    <i class="bi bi-shop-window"></i>
                    GroupStore
                </a>
                <div class="container">
                    <div class="row w-100">
                        <ul class="nav nav-pills col-12 col-md-8 mb-2 justify-content-center mx-auto">
                            <li class="nav-item"><a runat="server" id="inicio" class="nav-link" href="VPrincipal.aspx">Inicio</a></li>
                            <li class="nav-item"><a runat="server" id="categoria" class="nav-link">Categorias</a></li>
                            <li class="nav-item"><a runat="server" id="tiendas" class="nav-link">Tiendas</a></li>
                        </ul>
                        <div class="col-12 col-md-4 ms-auto me-0">
                            <div class="input-group mt-1">
                                <input type="search" class="form-control form-control-dark" placeholder="Buscar un producto..." aria-label="Search" />
                                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="bi bi-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Navbar-->
                <ul class="navbar-nav ms-auto me-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                            </svg>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="VPrincipal.aspx">Ir a inicio</a></li>
                            <li><a class="dropdown-item" href="VHistorialComprasUsuario.aspx">Historial de Compras</a></li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>
                            <li><a class="dropdown-item" runat="server" onserverclick="cerrarSesion_ServerClick">Cerrar sesión</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </asp:View>
        <asp:View runat="server">
            <nav class="py-3 navbar navbar-expand navbar-dark bg-dark">
                <!-- Navbar Brand-->
                <a class="navbar-brand ps-3" runat="server" id="nombreNegocio" href="VInicioAdministrador.aspx">Nombre negocio</a>
                <!-- Navbar Search-->
                <div class="d-none d-md-block ms-auto"></div>
                <!-- Navbar-->
                <ul class="navbar-nav ms-auto ms-md-0 me-3">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                            </svg>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown1">
                            <li><a class="dropdown-item" href="VInicioAdministrador.aspx">Ir a inicio</a></li>
                            <li><a class="dropdown-item" href="VInfoNegocio.aspx">Ver info. del negocio</a></li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>
                            <li><a class="dropdown-item" runat="server" onserverclick="cerrarSesion_ServerClick">Cerrar sesión</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </asp:View>
    </asp:MultiView>
    <form runat="server" class="d-flex flex-column my-5 mx-auto col-11 col-md-10 col-lg-8 shadow rounded-3 bg-white">
        <div class="container-fluid px-md-5 py-3">
            <div class="text-center">
                <p class="h3">Información de usuario</p>
            </div>
            <div class="row mt-4">
                <div class="col-12 col-lg-6">
                    <div class="input-group">
                        <span class="input-group-text "><b>Cédula</b></span>
                        <input runat="server" class="form-control " type="text" id="cedula" disabled="disabled" readonly="true" />
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="input-group">
                        <span class="input-group-text "><b>Correo</b></span>
                        <input runat="server" class="form-control " type="text" id="correo" disabled="disabled" readonly="true" />
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12 col-lg-6">
                    <div class="input-group">
                        <span class="input-group-text "><b>Apellido(s)</b></span>
                        <input runat="server" class="form-control " type="text" id="apellidos" disabled="disabled" readonly="true" />
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="input-group">
                        <span class="input-group-text "><b>Nombre(s)</b></span>
                        <input runat="server" class="form-control " type="text" id="nombre" disabled="disabled" readonly="true" />
                    </div>
                </div>
            </div>
            <asp:MultiView ID="MV_Usuarios" runat="server">
                <!-- 0.usuarios 1.administrador-->
                <asp:View ID="V_Usuarios" runat="server">
                    <div class="row mt-2">
                        <div class="col-12 col-lg-6">
                            <div class="input-group">
                                <span class="input-group-text "><b>Dirección</b></span>
                                <input runat="server" class="form-control " type="text" id="direccion" disabled="disabled" readonly="true" />
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="input-group">
                                <span class="input-group-text "><b>Teléfono</b></span>
                                <input runat="server" class="form-control " type="text" id="telefono" disabled="disabled" readonly="true" />
                            </div>
                        </div>
                    </div>
                    <asp:MultiView ID="MV_CompProv" runat="server">
                        <!-- 0.comprador 1.proveedor-->
                        <asp:View ID="V_Comprador" runat="server"></asp:View>
                        <asp:View ID="V_Proveedor" runat="server">
                            <div class="row mt-2">
                                <div class="col-12 col-lg-6">
                                    <div class="input-group">
                                        <span class="input-group-text "><b>Empresa</b></span>
                                        <input runat="server" class="form-control " type="text" id="empresa" disabled="disabled" readonly="true" />
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6 py-2">
                                    <span class="me-5"><b>Certificados</b></span>
                                    <a href="#" class="me-3" runat="server" id="certificado_uno">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-filetype-pdf" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5L14 4.5ZM1.6 11.85H0v3.999h.791v-1.342h.803c.287 0 .531-.057.732-.173.203-.117.358-.275.463-.474a1.42 1.42 0 0 0 .161-.677c0-.25-.053-.476-.158-.677a1.176 1.176 0 0 0-.46-.477c-.2-.12-.443-.179-.732-.179Zm.545 1.333a.795.795 0 0 1-.085.38.574.574 0 0 1-.238.241.794.794 0 0 1-.375.082H.788V12.48h.66c.218 0 .389.06.512.181.123.122.185.296.185.522Zm1.217-1.333v3.999h1.46c.401 0 .734-.08.998-.237a1.45 1.45 0 0 0 .595-.689c.13-.3.196-.662.196-1.084 0-.42-.065-.778-.196-1.075a1.426 1.426 0 0 0-.589-.68c-.264-.156-.599-.234-1.005-.234H3.362Zm.791.645h.563c.248 0 .45.05.609.152a.89.89 0 0 1 .354.454c.079.201.118.452.118.753a2.3 2.3 0 0 1-.068.592 1.14 1.14 0 0 1-.196.422.8.8 0 0 1-.334.252 1.298 1.298 0 0 1-.483.082h-.563v-2.707Zm3.743 1.763v1.591h-.79V11.85h2.548v.653H7.896v1.117h1.606v.638H7.896Z" />
                                        </svg>
                                    </a>
                                    <a href="#" class="me-3" runat="server" id="certificado_dos">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-filetype-pdf" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5L14 4.5ZM1.6 11.85H0v3.999h.791v-1.342h.803c.287 0 .531-.057.732-.173.203-.117.358-.275.463-.474a1.42 1.42 0 0 0 .161-.677c0-.25-.053-.476-.158-.677a1.176 1.176 0 0 0-.46-.477c-.2-.12-.443-.179-.732-.179Zm.545 1.333a.795.795 0 0 1-.085.38.574.574 0 0 1-.238.241.794.794 0 0 1-.375.082H.788V12.48h.66c.218 0 .389.06.512.181.123.122.185.296.185.522Zm1.217-1.333v3.999h1.46c.401 0 .734-.08.998-.237a1.45 1.45 0 0 0 .595-.689c.13-.3.196-.662.196-1.084 0-.42-.065-.778-.196-1.075a1.426 1.426 0 0 0-.589-.68c-.264-.156-.599-.234-1.005-.234H3.362Zm.791.645h.563c.248 0 .45.05.609.152a.89.89 0 0 1 .354.454c.079.201.118.452.118.753a2.3 2.3 0 0 1-.068.592 1.14 1.14 0 0 1-.196.422.8.8 0 0 1-.334.252 1.298 1.298 0 0 1-.483.082h-.563v-2.707Zm3.743 1.763v1.591h-.79V11.85h2.548v.653H7.896v1.117h1.606v.638H7.896Z" />
                                        </svg>
                                    </a>
                                    <a href="#" class="me-3" runat="server" id="certificado_tres">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-filetype-pdf" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5L14 4.5ZM1.6 11.85H0v3.999h.791v-1.342h.803c.287 0 .531-.057.732-.173.203-.117.358-.275.463-.474a1.42 1.42 0 0 0 .161-.677c0-.25-.053-.476-.158-.677a1.176 1.176 0 0 0-.46-.477c-.2-.12-.443-.179-.732-.179Zm.545 1.333a.795.795 0 0 1-.085.38.574.574 0 0 1-.238.241.794.794 0 0 1-.375.082H.788V12.48h.66c.218 0 .389.06.512.181.123.122.185.296.185.522Zm1.217-1.333v3.999h1.46c.401 0 .734-.08.998-.237a1.45 1.45 0 0 0 .595-.689c.13-.3.196-.662.196-1.084 0-.42-.065-.778-.196-1.075a1.426 1.426 0 0 0-.589-.68c-.264-.156-.599-.234-1.005-.234H3.362Zm.791.645h.563c.248 0 .45.05.609.152a.89.89 0 0 1 .354.454c.079.201.118.452.118.753a2.3 2.3 0 0 1-.068.592 1.14 1.14 0 0 1-.196.422.8.8 0 0 1-.334.252 1.298 1.298 0 0 1-.483.082h-.563v-2.707Zm3.743 1.763v1.591h-.79V11.85h2.548v.653H7.896v1.117h1.606v.638H7.896Z" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </asp:View>
                <asp:View ID="V_Administrador" runat="server">
                    <div class="col mt-4">
                        <div class="text-center">
                            <a href="VInfoNegocio.aspx" class="btn btn-outline-primary">Ver información del negocio</a>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
            <!--boton editar informacion-->
            <div class="row justify-content-center my-3">
                <div class="col">
                    <div class="text-center">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalEditar">Editar información personal</button>
                    </div>
                </div>
            </div>
            <!---->
            <!--Modal para la edición de la información del usuario-->
            <div class="modal fade" id="ModalEditar">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Editar Datos</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row pb-2 mb-2 border-bottom">
                                    <div class="col-6">
                                        <b>Cédula</b>
                                    </div>
                                    <div class="col-6">
                                        <input type="text" runat="server" id="cdl2" />
                                    </div>
                                </div>
                                <div class="row pb-2 mb-2 border-bottom">
                                    <div class="col-6">
                                        <b>Nombre(s)</b>
                                    </div>
                                    <div class="col-6">
                                        <input type="text" runat="server" id="nom2" />
                                    </div>
                                </div>
                                <div class="row pb-2 mb-2 border-bottom">
                                    <div class="col-6">
                                        <b>Apellido(s)</b>
                                    </div>
                                    <div class="col-6">
                                        <input type="text" runat="server" id="ape2" />
                                    </div>
                                </div>
                                <div class="row pb-2 mb-2 border-bottom">
                                    <div class="col-6">
                                        <b>Correo</b>
                                    </div>
                                    <div class="col-6">
                                        <input type="text" runat="server" id="correo2" />
                                    </div>
                                </div>
                                <!---->
                                <asp:MultiView ID="MV_UsuariosModal" runat="server">
                                    <asp:View runat="server" ID="V_UsuariosModal">
                                        <div class="row pb-2 mb-2 border-bottom">
                                            <div class="col-6">
                                                <b>Dirección</b>
                                            </div>
                                            <div class="col-6">
                                                <input type="text" runat="server" id="dir2" />
                                            </div>
                                        </div>
                                        <div class="row pb-2 mb-2 border-bottom">
                                            <div class="col-6">
                                                <b>Teléfono</b>
                                            </div>
                                            <div class="col-6">
                                                <input type="text" runat="server" id="tel2" />
                                            </div>
                                        </div>
                                        <asp:MultiView ID="MV_CompProvModal" runat="server">
                                            <asp:View runat="server" ID="V_CompradorModal"></asp:View>
                                            <asp:View ID="V_proveedorModal" runat="server">
                                                <div class="row pb-2 mb-2 border-bottom">
                                                    <div class="col-6">
                                                        <b>Empresa</b>
                                                    </div>
                                                    <div class="col-6">
                                                        <input type="text" runat="server" id="empresa2" />
                                                    </div>
                                                </div>
                                                <div class="row pb-2 mb-2 border-bottom">
                                                    <div class="col-6">
                                                        <b>Certificados</b>
                                                    </div>
                                                    <div class="col-6">
                                                        <input type="text" runat="server" id="cert2" />
                                                    </div>
                                                </div>
                                            </asp:View>
                                        </asp:MultiView>
                                    </asp:View>
                                    <asp:View runat="server" ID="V_AdministradorModal"></asp:View>
                                </asp:MultiView>
                                <!---->
                                <div class="row pb-2 mb-2 border-bottom">
                                    <div class="col-6">
                                        <b>Contraseña</b>
                                    </div>
                                    <div class="col-6">
                                        <input type="text" runat="server" id="cont2" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                type="button"
                                class="btn btn-danger"
                                data-bs-dismiss="modal">
                                Cancelar
                            </button>
                            <button
                                runat="server"
                                onserverclick="Btn_Editar"
                                type="button"
                                class="btn btn-success">
                                Editar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!---->
        </div>
    </form>
    <footer class="py-4 bg-dark mt-auto fixed-bottom">
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
</body>
</html>
