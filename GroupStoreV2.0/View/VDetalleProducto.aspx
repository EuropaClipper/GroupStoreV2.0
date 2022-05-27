<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VDetalleProducto.aspx.cs" Inherits="View_VDetalleProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Detalles del producto</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid shadow shadow-lg col-12 col-lg-8 mt-5 p-4">
            <div class="row  justify-content-center">
                <div class="container-fluid col-12 order-2 col-md-2 m-0 px-0 py-4">
                    <div class="row justify-content-center">
                        <div class="col-3 col-md-12">
                            <a href="#" runat="server" id="img1" onserverclick="img1_ServerClick">
                                <img src="../Resources/Pagina/imagen-no-disponible.jpg" class="img-fluid  mb-3" style="max-width: 6em" runat="server" id="imagen1" />
                            </a>
                        </div>
                        <div class="col-3 col-md-12">
                            <a href="#" runat="server" id="img2" onserverclick="img2_ServerClick">
                                <img src="../Resources/Pagina/imagen-no-disponible.jpg" class="img-fluid  mb-3" style="max-width: 6em" runat="server" id="imagen2" />
                            </a>
                        </div>
                        <div class="col-3 col-md-12">
                            <a href="#" runat="server" id="img3" onserverclick="img3_ServerClick">
                                <img src="../Resources/Pagina/imagen-no-disponible.jpg" class="img-fluid  mb-3" style="max-width: 6em" runat="server" id="imagen3" />
                            </a>
                        </div>
                    </div>
                </div>
                <div class="container-fluid col-12 order-1 ms-2 me-4 col-md-4">
                    <div class="row mb-2 pt-5 justify-content-center">
                        <asp:MultiView ActiveViewIndex="0" runat="server" ID="MV_Imagenes">
                            <asp:View runat="server">
                                <img src="../Resources/Pagina/imagen-no-disponible.jpg" class="img-fluid rounded-3" runat="server" id="imag1" />
                            </asp:View>
                            <asp:View runat="server">
                                <img src="../Resources/Pagina/imagen-no-disponible.jpg" class="img-fluid rounded-3" runat="server" id="imag2" />
                            </asp:View>
                            <asp:View runat="server">
                                <img src="../Resources/Pagina/imagen-no-disponible.jpg" class="img-fluid rounded-3" runat="server" id="imag3" />
                            </asp:View>
                        </asp:MultiView>
                    </div>
                </div>
                <div class="container-fluid col-12 order-0 col-md-4 py-1 py-lg-4 mx-1 border border-1 rounded-3">
                    <div class="row mb-2 text-center">
                        <span class="h4" id="nombreProducto" runat="server">Producto</span>
                    </div>
                    <div class="row mb-2 text-center">
                        <span class="h5" id="precio" runat="server">Precio</span>
                    </div>
                    <div class="row mb-2 text-center">
                        <span class="h6" id="descripcion" runat="server">Descripcion</span>
                    </div>
                    <div class="row mb-2 text-center">
                        <span class="h6">Stock: <span class="h6" id="cantidad" runat="server">N</span></span>
                    </div>
                    <div class="row mb-2 justify-content-center">
                        <input type="number" runat="server" id="cantidadCompra" value="0" class="form-control w-50" style="max-width:10em;"/>
                    </div>
                    <div class="row mb-2 text-center">
                        <asp:RangeValidator ID="RG_Cantidad" runat="server" Type="Integer" ErrorMessage="Cantidad erronea" CssClass="text-danger" 
                            ControlToValidate="cantidadCompra" MinimumValue="1" ValidationGroup="aggCarrito" Display="Dynamic"></asp:RangeValidator>
                    </div>
                    <div class="d-grid  mt-lg-5 mt-2">
                        <button type="button" class="btn btn-success mx-auto" runat="server" onserverclick="agregarCarrito" validationgroup="aggCarrito">Agregar al carrito <i class="bi bi-cart"></i></button>
                    </div>
                    <div class="d-grid  mt-lg-2 mt-1">
                        <a href="VCatalogo.aspx" class="btn btn-outline-primary mx-auto text-decoration-none">Ver catalogo</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
