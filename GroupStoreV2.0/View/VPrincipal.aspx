<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VPrincipal.aspx.cs" Inherits="View_VPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Inicio GroupStore</title>
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
                    <li class="nav-item"><a onserverclick="inicio_ServerClick" runat="server" id="inicio" class="nav-link">Inicio</a></li>
                    <li class="nav-item"><a onserverclick="categoria_ServerClick" runat="server" id="categoria" class="nav-link">Categoria</a></li>
                    <li class="nav-item"><a onserverclick="tiendas_ServerClick" runat="server" id="tiendas" class="nav-link">Tiendas</a></li>
                    <li class="nav-item"><a onserverclick="proveedores_ServerClick" runat="server" id="proveedores" class="nav-link">Proveedores</a></li>
                    <li class="nav-item"><a onserverclick="contacto_ServerClick" runat="server" id="contacto" class="nav-link">Contacto</a></li>
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
        <section>
            <img src="../Resources/Pagina/logoGroupStore.jpg" alt="Alternate Text" class="img-fluid"/>
        </section>
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
