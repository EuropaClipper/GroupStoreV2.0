<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VProducto.aspx.cs" Inherits="View_VProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Producto</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/styles.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function vistaPreviaImagenes(input) {
            let files = input.files;
            if (files.length > 3) {
                alert('No se pueden agregar más de 3 imagenes por producto');
            }
            var output = [];
            let check = true;
            for (var i = 0, f; f = files[i]; i++) {
                if (!(f.name.includes(".jpg") || f.name.includes(".jpeg") || f.name.includes(".png"))) check = false;
                output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                    f.size, ' bytes, última modificación: ',
                    f.lastModifiedDate.toLocaleDateString(), '</li>');
            }
            document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
            if (!check) alert('Solo se admiten imagenes .jpg .jpeg y .png');
        }
    </script>
</head>
<body>
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
                    <li><a class="dropdown-item" href="VInformacionNegocio.aspx">Ver info. del negocio</a></li>
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
                        <a class="nav-link" href="#">
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
                                <a class="nav-link" href="#">
                                    <div class="sb-nav-link-icon"><i class="bi bi-eye"></i></div>
                                    Ver pedidos
                                </a>
                                <a class="nav-link" href="#">
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
                                <a class="nav-link" href="#">
                                    <div class="sb-nav-link-icon"><i class="bi bi-eye"></i></div>
                                    Ver compras
                                </a>
                                <a class="nav-link" href="#">
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
                    Nombre de usuario
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <form runat="server">
                        <div class="row">
                            <div class="col-12 col-md-12 col-lg-1">
                                <div class="text-start mt-3">
                                    <a href="VProductos.aspx">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-circle text-dark" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-md-12 col-lg-10 my-4 bg-secondary bg-opacity-10 shadow rounded-3 pt-1 pb-2 ">
                                <div class="row justify-content-center">
                                    <div class="text-center">
                                        <p class="h2">Control de producto</p>
                                    </div>
                                    <hr class="my-1" />
                                </div>
                                <div class="row my-3 text-center">
                                    <p class="h6" runat="server" id="pCodigo"></p>
                                </div>
                                <div class="row mt-1">
                                    <div class="col-12 col-lg-6">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="I_nombreProducto" placeholder="Nombre de producto" runat="server" maxlength="50" />
                                            <label for="I_nombreProducto">Nombre de producto</label>
                                            <asp:RequiredFieldValidator ID="RFV_NombreProducto" runat="server" ErrorMessage="Este campo es obligatorio" ControlToValidate="I_nombreProducto"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="REV_NombreProducto" runat="server" ErrorMessage="El formato no coincide" ControlToValidate="I_nombreProducto"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2" ValidationExpression="[A-Za-z0-9 &#%]{2,50}"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input type="number" class="form-control" id="I_Precio" placeholder="Precio del producto" runat="server" />
                                            <label for="I_Precio">Precio del producto</label>
                                            <asp:RequiredFieldValidator ID="RFV_Precio" runat="server" ErrorMessage="Este campo es obligatorio" ControlToValidate="I_Precio"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="REV_Precio" runat="server" ErrorMessage="No debe contener letras, números negativos ni 0" ControlToValidate="I_Precio"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2" ValidationExpression="^[1-9]{1}[0-9,.]{0,}"></asp:RegularExpressionValidator>

                                        </div>
                                        <div class="form-floating mb-3">
                                            <input type="number" class="form-control" id="I_Stock" placeholder="Stock del producto" runat="server" />
                                            <label for="I_Stock">Stock del producto</label>
                                            <asp:RequiredFieldValidator ID="RFV_Stock" runat="server" ErrorMessage="Este campo es obligatorio" ControlToValidate="I_Stock"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="REV_Stock" runat="server" ErrorMessage="No debe contener letras, números negativos ni 0" ControlToValidate="I_Stock"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2" ValidationExpression="^[1-9]{1}[0-9,.]{0,}"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="mb-1">
                                            <label class="form-label ms-1 mb-2 h6">Imagenes del producto (sólo 3 imagenes)</label>
                                            <asp:FileUpload ID="FU_Imagenes" runat="server" AllowMultiple="true" onchange="vistaPreviaImagenes(this)" />
                                            <div class="d-none" runat="server" id="errorImagenes">
                                                <i class="bi bi-exclamation-triangle ms-2"></i>
                                                <i class="ms-5" runat="server" id="MensajeError"></i>
                                            </div>
                                            <div class="d-none" runat="server" id="errorImagenesExt">
                                                <i class="bi bi-exclamation-triangle ms-2"></i>
                                                <i class="ms-5" runat="server" id="errorExtension"></i>
                                            </div>
                                            <output class="small" id="list"></output>
                                            <asp:RequiredFieldValidator ID="RFV_FUImagenes" runat="server" ErrorMessage="Seleccione una imagen" ControlToValidate="FU_Imagenes"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-12 col-lg-6">
                                        <div class="form-floating mb-3">
                                            <input type="number" class="form-control" id="I_cantidadMax" placeholder="Cantidad máxima del producto" runat="server" />
                                            <label for="I_cantidadMax">Cantidad máxima del producto</label>
                                            <asp:RequiredFieldValidator ID="RFV_CMax" runat="server" ErrorMessage="Este campo es obligatorio" ControlToValidate="I_cantidadMax"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="REV_CMax" runat="server" ErrorMessage="No debe contener letras, números negativos ni 0" ControlToValidate="I_cantidadMax"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2" ValidationExpression="^[1-9]{1}[0-9,.]{0,}"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input type="number" class="form-control" id="I_cantidadMin" placeholder="Cantidad máxima del producto" runat="server" />
                                            <label for="I_cantidadMin">Cantidad mínima del producto</label>
                                            <asp:RequiredFieldValidator ID="RFV_CMin" runat="server" ErrorMessage="Este campo es obligatorio" ControlToValidate="I_cantidadMin"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="REV_CMin" runat="server" ErrorMessage="No debe contener letras, números negativos ni 0" ControlToValidate="I_cantidadMin"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2" ValidationExpression="^[1-9]{1}[0-9,.]{0,}"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">Capacidad/Peso</span>
                                            <input type="number" runat="server" id="I_Capacidad" class="form-control" />
                                            <asp:DropDownList ID="DDL_UMedida" runat="server" CssClass="form-select">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="row p-0 mb-2">
                                            <asp:RequiredFieldValidator ID="RFV_CapacidadPeso" runat="server" ErrorMessage="Debe agregar el peso o capacidad del producto" ControlToValidate="I_Capacidad"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="REV_CapacidadPeso" runat="server" ErrorMessage="No debe contener letras, números negativos ni 0" ControlToValidate="I_Capacidad"
                                                ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2" ValidationExpression="^[1-9]{1}[0-9,.]{0,}"></asp:RegularExpressionValidator>
                                            <asp:RangeValidator ID="RV_UMedida" runat="server" ErrorMessage="Seleccione una unidad de medida"
                                                ControlToValidate="DDL_UMedida" MaximumValue="99999" MinimumValue="1" ValidationGroup="VG_AggProducto" CssClass="text-danger ms-2" Display="Dynamic" Type="Integer"></asp:RangeValidator>

                                        </div>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">Categoría</span>
                                            <asp:DropDownList ID="DDL_Categorias" runat="server" CssClass="form-select">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="mb-2 p-0">
                                            <asp:RangeValidator ID="RV_Categorias" runat="server" ErrorMessage="Seleccione una categoria"
                                                ControlToValidate="DDL_Categorias" MaximumValue="99999" MinimumValue="1" ValidationGroup="VG_AggProducto" CssClass="text-danger ms-2" Display="Dynamic" Type="Integer"></asp:RangeValidator>

                                        </div>
                                        <div class="input-group mb-1">
                                            <span class="input-group-text">Agregar en bodega</span>
                                            <asp:DropDownList ID="DDL_Bodegas" runat="server" CssClass="form-select">
                                            </asp:DropDownList>
                                        </div>
                                        <asp:RangeValidator ID="RG_Bodegas" runat="server" ErrorMessage="Seleccione la bodega donde se guardará el producto"
                                            ControlToValidate="DDL_Bodegas" MaximumValue="99999" MinimumValue="1" ValidationGroup="VG_AggProducto" CssClass="text-danger ms-2" Display="Dynamic" Type="Integer"></asp:RangeValidator>
                                        <div class="d-none" runat="server" id="errorBodegallena">
                                            <i class="bi bi-exclamation-triangle ms-2"></i>
                                            <i class="ms-5">No hay espacio en bodega para este stock.</i>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div>
                                        <label class="form-label ms-2 h6">Descripción del producto</label>
                                        <textarea id="I_Descripcion" rows="2" class="form-control" runat="server" maxlength="200"></textarea>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Agregue una descripción del producto" ControlToValidate="I_Descripcion" ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="REV_Descripcion" runat="server" ErrorMessage="El formato no coincide" ControlToValidate="I_Descripcion"
                                            ValidationGroup="VG_AggProducto" Display="Dynamic" CssClass="text-danger ms-2" ValidationExpression="[A-Za-z0-9 &#%-+*/$]{5,200}"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <asp:MultiView ID="MV_Editar" runat="server">
                                    <asp:View runat="server"></asp:View>
                                    <asp:View runat="server">
                                        <div class="row mt-1 px-1 justify-content-center">
                                            <div class="text-center h6">
                                                Imagenes del producto
                                            </div>
                                            <div class="col-4 mb-1">
                                                <img src="#" runat="server" id="imagenUno" class="img-fluid rounded-3" alt="1er imagen del producto"/>
                                            </div>
                                            <div class="col-4 mb-1">
                                                <img src="#" runat="server" id="imagenDos" class="img-fluid rounded-3" alt="2da imagen del producto"/>
                                            </div>
                                            <div class="col-4 mb-1">
                                                <img src="#" runat="server" id="imagenTres" class="img-fluid rounded-3" alt="3ra imagen del producto"/>
                                            </div>
                                        </div>
                                    </asp:View>
                                </asp:MultiView>
                                <hr />
                                <div class="row justify-content-center my-4">
                                    <a class="btn btn-danger me-2 col-4" href="VProductos.aspx">Cancelar</a>
                                    <asp:MultiView ID="MV_BEditar" runat="server">
                                        <asp:View runat="server">
                                            <button type="button" class="btn btn-success ms-2 col-4" runat="server" id="btn_aggProducto" onserverclick="btn_aggProducto_ServerClick"
                                                validationgroup="VG_AggProducto">
                                                Agregar producto</button>
                                        </asp:View>
                                        <asp:View runat="server">
                                            <button type="button" class="btn btn-primary ms-2 col-4" runat="server" id="btnEditarProducto" onserverclick="btnEditarProducto_ServerClick">
                                                Editar producto</button>
                                        </asp:View>
                                    </asp:MultiView>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </main>
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
        </div>
    </div>
    <script src="../Scripts/scripts.js"></script>
</body>
</html>
