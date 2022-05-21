<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VBodegas.aspx.cs" Inherits="View_VBodegas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/styles.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <title>Administrar bodegas</title>
</head>
<body>
    <form id="form1" runat="server">
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
                        <li><a class="dropdown-item" runat="server" id="cerrarSesion" onserverclick="cerrarSesion_ServerClick">Cerrar sesión</a></li>
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
                            <span class="h2">Bodegas</span>
                            <button
                                type="button"
                                class="btn bg-transparent ms-auto me-0"
                                runat="server"
                                id="btnAgregarBodega"
                                onserverclick="btnAgregarBodega_ServerClick">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                </svg>
                            </button>
                        </div>

                        <div class="d-none" runat="server" id="FilaAggEdit">
                            <hr />
                            <div class="row p-0">
                                <div class="col-12 p-0">
                                    <div class="text-end mt-1 me-3">
                                        <button type="button" class="btn bg-transparent" runat="server" onserverclick="cerrarVentanaAggEd_ServerClick" id="cerrarVentanaAggEd">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-circle text-danger" viewBox="0 0 16 16">
                                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3 mb-1 text-center">
                                <p class="h6" runat="server" id="BodegaCodigo"></p>
                            </div>
                            <div class="row">
                                <div class="col-12 col-lg-5">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="I_NombreBodega" placeholder="Nombre de bodega" runat="server" maxlength="50" />
                                        <label for="I_NombreBodega">Nombre de bodega</label>
                                        <asp:RequiredFieldValidator ID="RFV_NBodega" runat="server" ErrorMessage="Este campo es obligatorio" ControlToValidate="I_NombreBodega"
                                            ValidationGroup="VG_Bodega" Display="Dynamic" CssClass="text-danger ms-2"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="REV_Bodega" runat="server" ErrorMessage="El formato no coincide" ControlToValidate="I_NombreBodega"
                                            ValidationGroup="VG_Bodega" Display="Dynamic" CssClass="text-danger ms-2" ValidationExpression="[A-Za-z0-9 &#%]{2,50}"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-5">
                                    <div class="form-floating mb-3">
                                        <input type="number" class="form-control" id="I_Capacidad" placeholder="Capacidad de bodega" runat="server" />
                                        <label for="I_Capacidad">Capacidad de bodega</label>
                                        <asp:RequiredFieldValidator ID="RFV_CBodega" runat="server" ErrorMessage="Este campo es obligatorio" ControlToValidate="I_Capacidad"
                                            ValidationGroup="VG_Bodega" Display="Dynamic" CssClass="text-danger ms-2"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="REV_CBodega" runat="server" ErrorMessage="No debe contener letras, números negativos ni 0" ControlToValidate="I_Capacidad"
                                            ValidationGroup="VG_Bodega" Display="Dynamic" CssClass="text-danger ms-2" ValidationExpression="^[1-9]{1}[0-9]{0,}"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-2 text-center">
                                    <asp:MultiView ActiveViewIndex="0" ID="MV_EdAggBodega" runat="server">
                                        <asp:View runat="server">
                                            <button
                                                type="button"
                                                class="btn btn-lg btn-success  my-1"
                                                runat="server"
                                                id="btnAggBodega"
                                                onserverclick="btnAggBodega_ServerClick"
                                                validationgroup="VG_Bodega">
                                                Agregar
                                            </button>
                                        </asp:View>
                                        <asp:View runat="server">
                                            <button
                                                type="button"
                                                class="btn btn-lg btn-primary  my-1"
                                                runat="server"
                                                id="btnEditar"
                                                validationgroup="VG_Bodega"
                                                onserverclick="btnEditar_ServerClick">
                                                Editar
                                            </button>
                                        </asp:View>
                                    </asp:MultiView>
                                </div>
                            </div>
                        </div>

                        <hr />
                        <asp:GridView ID="GV_Bodegas" runat="server" CssClass="table table-hover table-secondary table-bordered table-responsive" AutoGenerateColumns="false"
                            RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" OnSelectedIndexChanged="GV_Bodegas_SelectedIndexChanged" OnRowDeleting="GV_Bodegas_RowDeleting"
                            DataKeyNames="ID">
                            <HeaderStyle CssClass="table-dark" HorizontalAlign="Center" />
                            <Columns>
                                <asp:CommandField HeaderText="" ControlStyle-CssClass="btn btn-success bi bi-pencil-square" ItemStyle-Width="50" ShowSelectButton="true" SelectText="" />
                                <asp:BoundField HeaderText="Codigo" DataField="ID" />
                                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                <asp:BoundField HeaderText="Capacidad" DataField="Capacidad" />
                                <asp:BoundField HeaderText="#Productos cargados" DataField="NumeroProductos" />
                                <asp:CommandField HeaderText="" ControlStyle-CssClass="btn btn-danger bi bi-trash3" ItemStyle-Width="50" ShowDeleteButton="true" DeleteText="" />
                            </Columns>
                        </asp:GridView>
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
