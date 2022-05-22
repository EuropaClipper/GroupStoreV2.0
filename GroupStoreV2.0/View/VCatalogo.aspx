<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VCatalogo.aspx.cs" Inherits="View_VCatalogo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Catalogo de productos</title>
</head>
<body>
    <form id="form1" class="py-4" runat="server">
        <div class="container-fluid col-12 col-lg-11 mx-auto shadow-lg">
            <div class="row">
                <p class="h1 text-center">Catalogo de productos</p>
            </div>
            <div class="row mt-3">
                <div class="col-1">
                </div>
                <div class="col-3">
                    <div class="input-group">
                        <span class="input-group-text">Nombre</span>
                        <input type="text" class="form-control" runat="server" id="i_Nombre" />
                    </div>
                </div>
                <div class="col-3">
                    <div class="input-group">
                        <span class="input-group-text">Precio</span>
                        <input type="text" class="form-control" placeholder="Mínimo" />
                        <input type="text" class="form-control" placeholder="Máximo" />
                    </div>
                </div>
                <div class="col-3">
                    <div class="input-group">
                        <span class="input-group-text">Categoria</span>
                        <asp:DropDownList ID="DDL_Categorias" runat="server" CssClass="form-select">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-2">
                    <button type="button" class="btn btn-outline-primary">Buscar <i class="bi bi-search"></i></button>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="card" style="width: 18rem;">
                    <div class="card-header">
                        <h5 class="card-title text-center"></h5>
                    </div>
                    <img src='' runat="server" />
                    <div class="card-body">
                        <div class=" d-flex">
                            <b>Categoria:&nbsp;</b><span class="text-dark"> </span>
                        </div>
                        <div class="d-flex">
                            <b>Capacidad/Peso:&nbsp;</b><span class="text-dark"></span>
                        </div>
                        <div class="d-flex">
                            <b>Precio:&nbsp;</b><span class="text-dark"></span>
                        </div>
                        <div class="row mt-2">
                            <a class="text-center text-decoration-none" href="#">Ver detalles</a>
                        </div>
                    </div>
                    <div class="card-footer text-center">
                        <a class="btn btn-outline-success" href="VCatalogo.aspx?p=0&c=0">Agregar al carrito <i class="bi bi-cart-plus"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
