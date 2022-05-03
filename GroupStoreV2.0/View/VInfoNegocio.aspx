<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VInfoNegocio.aspx.cs" Inherits="View_VInfoNegocio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Información del Negocio</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/styles.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="VInicioAdministrador.aspx">Nombre negocio</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
                </svg>
            </button>
            <!-- Navbar Search-->
            <div class="d-none d-md-block ms-auto"></div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                        </svg>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="VInformacionUsuario.aspx">Ver info. de usuario</a></li>
                        <li><a class="dropdown-item" href="VInfoNegocio.aspx">Ver info. del negocio</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" runat="server" onserverclick="cerrarSesion_ServerClick">Cerrar sesión</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <br />
        <br />
        <div class="container">
            <div class="row border-bottom">
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center">
                    <b>NIT:</b>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center">
                    <input type="text" runat="server" id="nit" />
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center">
                    <b>Negocio:</b>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center">
                    <input type="text" runat="server" id="nombre" />
                </div>
            </div>
            <br />
            <div class="row border-bottom">
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center">
                    <b>Dirección:</b>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center">
                    <input type="text" runat="server" id="dir" />
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center">
                    <b>Teléfono: </b>
                </div>
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center">
                    <input type="text" runat="server" id="tel" />
                </div>
            </div>
            <br />
            <div class="row border-bottom">
                <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center">
                    <button type="button" class="btn btn-outline-primary me-2"><a class="nav-link" href="VInicioAdministrador.aspx">Volver</a></button>
                </div>
            </div>
        </div>
        <footer class="py-4 bg-light mt-auto">
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
