<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VPedido.aspx.cs" Inherits="View_VPedido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/styles.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <title>Pedidos pendientes</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:MultiView ActiveViewIndex="0" runat="server" ID="MV_Nav">
            <asp:View runat="server">
                <nav class="py-3 navbar navbar-expand navbar-dark bg-dark">
                    <!-- Navbar Brand-->
                    <a class="navbar-brand ps-3" runat="server" id="nombreNegocio" href="VInicioAdministrador.aspx">Nombre negocio</a>
                    <!-- Sidebar Toggle-->
                    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle1" href="#!">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
                        </svg>
                    </button>
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
            </asp:View>
            <asp:View runat="server">
                <nav class="py-3 navbar navbar-expand navbar-dark bg-dark">
                    <!-- Navbar Brand-->
                    <a class="navbar-brand ps-3" runat="server" id="A1" href="VProveedor.aspx">Nombre negocio</a>
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
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>
                                <li><a class="dropdown-item" runat="server" id="cerrarSesion" onserverclick="cerrarSesion_ServerClick">Cerrar sesión</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </asp:View>
        </asp:MultiView>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                    <asp:MultiView ActiveViewIndex="0" runat="server" ID="MV_Aside">
                        <asp:View runat="server">
                            <div class="sb-sidenav-menu">
                                <div class="nav">
                                    <div class="sb-sidenav-menu-heading">Panel de control</div>
                                    <a class="nav-link" href="VInicioAdministrador.aspx">
                                        <div class="sb-nav-link-icon"><i class="bi bi-house"></i></div>
                                        Vista general
                                    </a>
                                    <!--Sección productos-->
                                    <a class="nav-link" href="VProductos.aspx">
                                        <div class="sb-nav-link-icon"><i class="bi bi-box-seam"></i></div>
                                        Productos
                                    </a>
                                    <!---->
                                    <!--Sección bodega-->
                                    <a class="nav-link" href="VBodegas.aspx">
                                        <div class="sb-nav-link-icon"><i class="bi bi-shop"></i></div>
                                        Bodegas
                                    </a>
                                    <!---->
                                    <div class="sb-sidenav-menu-heading">Actividades de negocio</div>
                                    <!--Sección de ventas-->
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#Ventas_collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                        <div class="sb-nav-link-icon"><i class="bi bi-currency-dollar"></i></div>
                                        Ventas
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="Ventas_collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="VPedidos.aspx">
                                                <div class="sb-nav-link-icon"><i class="bi bi-eye"></i></div>
                                                Ver pedidos
                                            </a>
                                            <a class="nav-link" href="VHistorialVenta.aspx">
                                                <div class="sb-nav-link-icon"><i class="bi bi-clock-history"></i></div>
                                                Historial de ventas
                                            </a>
                                            <%--                                            <a class="nav-link" href="#">
                                                <div class="sb-nav-link-icon"><i class="bi bi-clipboard-data"></i></div>
                                                Reporte de ventas
                                            </a>--%>
                                        </nav>
                                    </div>
                                    <!---->
                                    <!--Sección de compras-->
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#Compras_collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                        <div class="sb-nav-link-icon"><i class="bi bi-bag"></i></div>
                                        Compras
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="Compras_collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="VHistorialCompra.aspx">
                                                <div class="sb-nav-link-icon"><i class="bi bi-clock-history"></i></div>
                                                Historial de compras
                                            </a>
                                            <%--                                            <a class="nav-link" href="#">
                                                <div class="sb-nav-link-icon"><i class="bi bi-clipboard-data"></i></div>
                                                Reporte de compras
                                            </a>--%>
                                        </nav>
                                    </div>
                                    <!---->
                                    <!--Sección de proveedores-->
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#Proveedores_collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                        <div class="sb-nav-link-icon"><i class="bi bi-people"></i></div>
                                        Proveedores
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="Proveedores_collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#">
                                                <div class="sb-nav-link-icon"><i class="bi bi-eye"></i></div>
                                                Ver proveedores
                                            </a>
                                            <%--                                            <a class="nav-link" href="#">
                                                <div class="sb-nav-link-icon"><i class="bi bi-clipboard-data"></i></div>
                                                Reporte de proveedores
                                            </a>--%>
                                        </nav>
                                    </div>
                                    <!---->
                                </div>
                            </div>
                        </asp:View>
                        <asp:View runat="server">
                            <div class="sb-sidenav-menu">
                                <div class="nav">
                                    <div class="sb-sidenav-menu-heading">Panel de control</div>
                                    <a class="nav-link" href="VProveedor.aspx">
                                        <div class="sb-nav-link-icon"><i class="bi bi-house"></i></div>
                                        Vista general
                                    </a>
                                    <!--Sección productos-->
                                    <a class="nav-link" href="VProductos.aspx">
                                        <div class="sb-nav-link-icon"><i class="bi bi-box-seam"></i></div>
                                        Productos
                                    </a>
                                    <!---->
                                    <!--Sección bodega-->
                                    <a class="nav-link" href="VBodegas.aspx">
                                        <div class="sb-nav-link-icon"><i class="bi bi-shop"></i></div>
                                        Bodegas
                                    </a>
                                    <!---->
                                    <div class="sb-sidenav-menu-heading">Actividades de negocio</div>
                                    <!--Sección de ventas-->
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#Ventas_collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts">
                                        <div class="sb-nav-link-icon"><i class="bi bi-currency-dollar"></i></div>
                                        Ventas
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="Ventas_collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="VPedidos.aspx">
                                                <div class="sb-nav-link-icon"><i class="bi bi-eye"></i></div>
                                                Ver pedidos
                                            </a>
                                            <a class="nav-link" href="VHistorialVenta.aspx">
                                                <div class="sb-nav-link-icon"><i class="bi bi-clock-history"></i></div>
                                                Historial de ventas
                                            </a>
                                            <%--                                            <a class="nav-link" href="#">
                                                <div class="sb-nav-link-icon"><i class="bi bi-clipboard-data"></i></div>
                                                Reporte de ventas
                                            </a>--%>
                                        </nav>
                                    </div>
                                    <!---->
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                    <div class="sb-sidenav-footer">
                        <div class="small">Registrado como:</div>
                        <span runat="server" id="registradoComo"></span>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main class="px-1">
                    <div class="container-fluid mt-3">
                        <div class="row">
                            <div class="text-start mt-3">
                                <a href="VPedidos.aspx">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-circle text-dark" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z" />
                                    </svg>
                                </a>
                            </div>
                            <span class="h2 text-center">Pedido</span>
                        </div>
                        <div class="row">
                            <div class="col-12 px-5">
                                <p><b>Nombre de comprador: </b><span runat="server" id="nombre"></span></p>
                                <p><b>ID de comprador: </b><span runat="server" id="id"></span></p>
                                <p><b>Fecha de pedido: </b><span runat="server" id="fecha"></span></p>
                                <%--<p><b>Descripción: </b><span runat="server" id="descripcion"></span></p>--%>
                                <p><b>Total a pagar: </b><span runat="server" id="precio"></span></p>
                            </div>
                        </div>
                        <div class="row">
                            <h4 class="text-center">Lista de productos</h4>
                            <asp:GridView runat="server" ID="GV_ListaProductos" CssClass="table table-hover table-secondary table-striped table-bordered table-responsive"
                                RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" AutoGenerateColumns="false">
                                <HeaderStyle CssClass="table-dark" HorizontalAlign="Center" />
                                <Columns>
                                    <asp:BoundField HeaderText="Codigo producto" DataField="CodigoProducto" />
                                    <asp:BoundField HeaderText="Producto" DataField="Producto.Nombre" />
                                    <asp:BoundField HeaderText="Bodega" DataField="Bodega.Nombre" />
                                    <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />
                                    <asp:BoundField HeaderText="Subtotal" DataField="Total" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="text-center">
                                        <p>No se han registrado productos.</p>
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-dark mt-auto">
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
            </div>
        </div>
        <script src="../Scripts/scripts.js"></script>
    </form>
</body>
</html>

