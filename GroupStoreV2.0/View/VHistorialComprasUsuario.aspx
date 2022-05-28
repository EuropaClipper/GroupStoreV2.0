<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VHistorialComprasUsuario.aspx.cs" Inherits="View_VHistorialComprasUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Historial de Compras</title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark position-sticky sticky-top py-4 mb-5">
            <!-- Navbar Brand-->
            <a class="navbar-brand text-light d-none d-md-block ms-2 me-0" href="VPrincipal.aspx">
                <i class="bi bi-shop-window"></i>
                GroupStore
            </a>
            <div class="container">
                <div class="row w-100 p-0 m-0 ms-auto me-0">
                    <ul class="nav nav-pills col-12 col-md-7 justify-content-center">
                        <li class="nav-item"><a runat="server" id="categoria" class="nav-link" href="VCatalogo.aspx">Catalogo de productos</a></li>
                    </ul>
                    <div class="col-12 col-md-5 ms-auto me-0">
                        <div class="input-group mt-1">
                                    <input type="search" class="form-control form-control-dark" placeholder="Buscar un producto..." aria-label="Search" runat="server" id="busqueda" />
                                    <button class="btn btn-primary" id="btnNavbarSearch" runat="server"  type="button" onserverclick="btnNavbarSearch_ServerClick"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <a href="VCarrito.aspx" class="text-light">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                    <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
                </svg>
            </a>
            <ul class="navbar-nav ms-auto me-1">
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
                        <li><a class="dropdown-item" runat="server" onserverclick="cerrarSesion_ServerClick">Cerrar sesión</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <section>
            <div class="container">
                <div class="row mb-3">
                    <span class="h2 text-center">Historial de Compras</span>
                </div>
                <div class="row">
                    <asp:GridView runat="server" ID="GV_Compras" AutoGenerateColumns="False" CssClass="table table-hover table-secondary table-striped table-bordered table-responsive" DataKeyNames="ID">
                        <Columns>
                            <asp:CommandField HeaderText="" ControlStyle-CssClass="btn btn-success bi bi-eye" ItemStyle-Width="50" ShowSelectButton="true" SelectText="" />
                            <asp:BoundField DataField="ID" HeaderText="Id" />
                            <asp:BoundField DataField="CedulaUsuario" HeaderText="Cédula del Administrador" />
                            <asp:BoundField DataField="NITNegocio" HeaderText="Cédula del Proveedor" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                            <asp:BoundField DataField="Dia" HeaderText="Día" />
                            <asp:BoundField DataField="Mes" HeaderText="Mes" />
                            <asp:BoundField DataField="Anho" HeaderText="Año" />
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center">
                                <p>No se ha realizado ninguna compra</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </section>
        <footer class="py-4 bg-dark  mt-4 fixed-bottom">
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
