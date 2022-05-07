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
            <div id="CarouselBanner" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#CarouselBanner" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#CarouselBanner" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#CarouselBanner" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="../Resources/ImagenesCargadas/Ofertas.png" class="d-block w-100" alt="..." height="350" />
                    </div>
                    <div class="carousel-item">
                        <img src="../Resources/ImagenesCargadas/Nestle.png" class="d-block w-100" alt="..." height="350" />
                    </div>
                    <div class="carousel-item">
                        <img src="../Resources/ImagenesCargadas/Aseo.jpg" class="d-block w-100" alt="..." height="350" />
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#CarouselBanner" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#CarouselBanner" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <br />
            <br />
            <br />
            <div class="container">
                <h4 >Nuevos Productos</h4>
            </div>
            <div id="CarouselProductos" class="carousel slide" data-bs-ride="carousel" style="background:#DDDDFF">
                <ol class="carousel-indicators">
                    <li data-bs-target="#CarouselProductos" data-bs-slide-to="0" class="active"></li>
                    <li data-bs-target="#CarouselProductos" data-bs-slide-to="1"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="card">
                                        <img src="" runat="server" id="img1" class="card-img-top" alt="Producto"  width="100" height="200" />
                                        <div class="card-body">
                                            <h5 class="card-title" runat="server" id="pr1">Titulo de la card</h5>
                                            <p runat="server" id="dsc1"></p>
                                            <a href="VInicioSesion.aspx" class="btn btn-primary">Ver información</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card">
                                        <img src="" runat="server" id="img2" class="card-img-top" alt="Producto"  width="10" height="200" />
                                        <div class="card-body">
                                            <h5 class="card-title" runat="server" id="pr2">Titulo de la card</h5>
                                            <p runat="server" id="dsc2"></p>
                                            <a href="VInicioSesion.aspx" class="btn btn-primary">Ver información</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card">
                                        <img src="" runat="server" id="img3" class="card-img-top" alt="Producto" width="100" height="200" />
                                        <div class="card-body">
                                            <h5 class="card-title" runat="server" id="pr3">Titulo de la card</h5>
                                            <p runat="server" id="dsc3"></p>
                                            <a href="VInicioSesion.aspx" class="btn btn-primary">Ver información</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="card">
                                        <img src="" runat="server" id="img4" class="card-img-top" alt="Producto" width="100" height="200" />
                                        <div class="card-body">
                                            <h5 class="card-title" runat="server" id="pr4">Titulo de la card</h5>
                                            <p runat="server" id="dsc4"></p>
                                            <a href="VInicioSesion.aspx" class="btn btn-primary">Ver información</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card">
                                        <img src="" runat="server" id="img5" class="card-img-top" alt="Producto" width="100" height="200" />
                                        <div class="card-body">
                                            <h5 class="card-title" runat="server" id="pr5">Titulo de la card</h5>
                                            <p runat="server" id="dsc5"></p>
                                            <a href="VInicioSesion.aspx" class="btn btn-primary">Ver información</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card">
                                        <img src="" runat="server" id="img6" class="card-img-top" alt="Producto" width="100" height="200" />
                                        <div class="card-body">
                                            <h5 class="card-title" runat="server" id="pr6">Titulo de la card</h5>
                                            <p runat="server" id="dsc6"></p>
                                            <a href="VInicioSesion.aspx" class="btn btn-primary">Ver información</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
            <br />
            <br />
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
