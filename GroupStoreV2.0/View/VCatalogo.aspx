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
                <div class="col-12 col-lg-1">
                </div>
                <div class="mb-1 mb-lg-0 mb-1 col-12 col-lg-3">
                    <div class="input-group">
                        <span class="input-group-text">Nombre</span>
                        <input type="text" class="form-control" runat="server" id="i_Nombre" />
                    </div>
                </div>
                <div class="mb-1 mb-lg-0 col-12 col-lg-3">
                    <div class="input-group">
                        <span class="input-group-text">Precio</span>
                        <input type="number" class="form-control" placeholder="Mínimo" runat="server" id="i_minimo"/>
                        <input type="number" class="form-control" placeholder="Máximo" runat="server" id="i_maximo"/>
                    </div>
                </div>
                <div class="mb-1 mb-lg-0 col-12 col-lg-3">
                    <div class="input-group">
                        <span class="input-group-text">Categoria</span>
                        <asp:DropDownList ID="DDL_Categorias" runat="server" CssClass="form-select">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="mb-1 mb-lg-0 col-12 col-lg-2 text-center text-lg-start">
                    <button type="button" runat="server" id="btnBuscar" onserverclick="btnBuscar_ServerClick" class="btn btn-outline-primary">Buscar <i class="bi bi-search"></i></button>
                </div>
            </div>
            <hr />
            <div class="row justify-content-center">
                <div class="container-fluid pt-1 pb-4" runat="server" id="contenedorProductos"></div>
            </div>
        </div>
    </form>
    <script>
        function agregarCantidad() {
            var cantidad = document.getElementById("cantidadProducto").innerText;
            document.getElementById("cantidadProducto").innerText = parseInt(cantidad) + 1;
        }
        function quitarCantidad() {
            var cantidad = parseInt(document.getElementById("cantidadProducto").innerText);
            if (cantidad <= 1) {
                document.getElementById("cantidadProducto").innerText = 1;
            }
            else {
                document.getElementById("cantidadProducto").innerText = cantidad - 1;
            }

        }
    </script>
</body>
</html>
