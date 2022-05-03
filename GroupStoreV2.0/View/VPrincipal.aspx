<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VPrincipal.aspx.cs" Inherits="View_VPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
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

                <asp:MultiView ID="MV_Estado" runat="server">
                    <asp:View runat="server">
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
                                    <li>
                                        <hr class="dropdown-divider" />
                                    </li>
                                    <li><a class="dropdown-item" runat="server" id="cerrarSesion" onserverclick="cerrarSesion_ServerClick">Cerrar sesión</a></li>
                                </ul>
                            </li>
                        </ul>
                    </asp:View>
                    <asp:View runat="server">
                        <div class="text-end">
                            <button type="button" class="btn btn-outline-primary me-2 p-0"><a class="nav-link" href="VInicioSesion.aspx">Iniciar Sesión</a></button>
                            <button type="button" class="btn btn-primary p-0"><a class="nav-link" href="VRegistro.aspx"><span class="text-white">Registrarse</span></a></button>
                        </div>
                    </asp:View>
                </asp:MultiView>

            </nav>
        </header>
        <section>
            <div class="container">
        <div id="CarouselProductos" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../Resources/Pagina/logoGroupStore.jpg" class="w-100 rounded-3 shadow" alt="Icono GroupStore" />
                </div>
                <div class="carousel-item">
                    <img src="../Resources/Pagina/logoGroupStore.jpg" class="w-100 rounded-3 shadow" alt="Icono GroupStore" />
                </div>
                <div class="carousel-item">
                    <img src="../Resources/Pagina/logoGroupStore.jpg" class="w-100 rounded-3 shadow" alt="Icono GroupStore" />
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#CarouselProductos" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#CarouselProductos" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <br />
    <br />
    <div class="container">
        <h2>Ofertas</h2>
    </div>
    <br />
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-6 col-md-6 col-lg-2">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Producto 1</h5>
                        <p class="card-text">Breve descripción del producto.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-2">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Producto 2</h5>
                        <p class="card-text">Breve descripción del producto.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-2">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Producto 3</h5>
                        <p class="card-text">Breve descripción del producto.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-2">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Producto 4</h5>
                        <p class="card-text">Breve descripción del producto.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-2">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Producto 5</h5>
                        <p class="card-text">Breve descripción del producto.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6 col-lg-2">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Producto 6</h5>
                        <p class="card-text">Breve descripción del producto.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
