<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VProductos.aspx.cs" Inherits="View_VProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Panel de control/Productos</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/styles.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
    <nav class="py-3 navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" runat="server" id="nombreNegocio" href="VInicioAdministrador.aspx">Nombre negocio</a>
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
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
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
                                <a class="nav-link" href="#">
                                    <div class="sb-nav-link-icon"><i class="bi bi-clipboard-data"></i></div>
                                    Reporte de ventas
                                </a>
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
                                <a class="nav-link" href="#">
                                    <div class="sb-nav-link-icon"><i class="bi bi-clipboard-data"></i></div>
                                    Reporte de compras
                                </a>
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
                                <a class="nav-link" href="#">
                                    <div class="sb-nav-link-icon"><i class="bi bi-clipboard-data"></i></div>
                                    Reporte de proveedores
                                </a>
                            </nav>
                        </div>
                        <!---->
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Registrado como:</div>
                    <span runat="server" id="registradoComo"></span>
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main class="px-1">
                <div class="container-fluid col-12 col-md-12 col-lg-11 mt-4 bg-secondary bg-opacity-10 shadow rounded-3 pt-1 pb-2">
                    <div class="d-flex flex-row">
                        <span class="h2">Productos</span>
                        <button
                            type="button"
                            class="btn bg-transparent ms-auto me-0"
                            runat="server"
                            id="btnAgregarProducto"
                            onserverclick="btnAgregarProducto_ServerClick">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                            </svg>
                        </button>
                    </div>
                    <hr />
                    <!--GridView con los productos-->
                    <form runat="server">
                        <asp:GridView ID="GV_Productos" CssClass="table table-hover table-secondary table-striped table-bordered table-responsive" runat="server" 
                            AutoGenerateColumns="false" DataKeyNames="Codigo" OnSelectedIndexChanged="GV_Productos_SelectedIndexChanged" OnRowDataBound="GV_Productos_RowDataBound"
                            OnRowDeleting="GV_Productos_RowDeleting">
                            <Columns>
                                <asp:CommandField HeaderText="" ControlStyle-CssClass="btn btn-success bi bi-pencil-square" ItemStyle-Width="50" ShowSelectButton="true" SelectText="" />
                                <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
                                <asp:BoundField HeaderText="Bodega" DataField="Bodega.Nombre" />
                                <asp:BoundField HeaderText="Producto" DataField="Nombre" />
                                <asp:BoundField HeaderText="Categoria" DataField="Categoria.categoria" />
                                <asp:BoundField HeaderText="Stock" DataField="Stock" />
                                <asp:BoundField HeaderText="Precio" DataField="Precio" />
                                <asp:BoundField HeaderText="Estado"/>
                                <asp:CommandField HeaderText="" ControlStyle-CssClass="btn btn-danger bi bi-toggles" ItemStyle-Width="50" ShowDeleteButton="true" DeleteText="" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center">
                                    <p>No se han registrado productos.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </form>
                    <!---->
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
</body>
</html>
