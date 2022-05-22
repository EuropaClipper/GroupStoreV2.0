<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VCatalogo.aspx.cs" Inherits="View_VCatalogo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Catalogo de productos</title>ipt>
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
                        <input type="text" class="form-control" />
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
                <asp:DataList ID="DL_Catalogo" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CellPadding="8" HorizontalAlign="Center" DataKeyField="Codigo"
                    OnSelectedIndexChanged="DL_Catalogo_SelectedIndexChanged">
                    <ItemTemplate>
                        <div class="card" style="width: 18rem;">
                            <div class="card-header">
                                <h5 class="card-title text-center"><%# DataBinder.Eval(Container.DataItem, "Nombre")%></h5>
                            </div>
                            <img src='<%# DataBinder.Eval(Container.DataItem, "ImagenUno")%>' runat="server" />
                            <div class="card-body">
                                <div class=" d-flex">
                                    <b>Categoria:&nbsp;</b><span class="text-dark"> <%# DataBinder.Eval(Container.DataItem, "Categoria.Categoria")%></span>
                                </div>
                                <div class="d-flex">
                                    <b>Capacidad/Peso:&nbsp;</b><span class="text-dark"><%# DataBinder.Eval(Container.DataItem, "Capacidad")%> <%# DataBinder.Eval(Container.DataItem, "UnidadMedida.Unidad")%></span>
                                </div>
                                <div class="d-flex">
                                    <b>Precio:&nbsp;</b><span class="text-dark"><%# DataBinder.Eval(Container.DataItem, "Precio","{0:C}")%></span>
                                </div>
                                <div class="row mt-2">
                                    <a class="text-center text-decoration-none" href="#">Ver detalles</a>
                                </div>
                            </div>
                            <div class="card-footer text-center">
                                <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-outline-success" CommandName="Select">Agregar al carrito <i class="bi bi-cart-plus"></i></asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="card" style="width: 18rem;">
                            <div class="card-header">
                                <h5 class="card-title text-center"><%# DataBinder.Eval(Container.DataItem, "Nombre")%></h5>
                            </div>
                            <img src='<%# DataBinder.Eval(Container.DataItem, "ImagenUno")%>' runat="server" />
                            <div class="card-body">
                                <div class="d-flex">
                                    <b>Precio unidad:&nbsp;</b><span class="text-dark"><%# DataBinder.Eval(Container.DataItem, "Precio","{0:C}")%></span>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <a href="#" onclick="quitarCantidad()"><i class="bi bi-dash-circle"></i></a>&nbsp;
                                    <span runat="server" id="cantidadProducto"> 1 </span>&nbsp;
                                    <a href="#" onclick="agregarCantidad()"><i class="bi bi-plus-circle"></i></a>
                                </div>
                            </div>
                            <div class="card-footer text-center">
                                <button type="button" class="btn btn-outline-success">Agregar al carrito<i class="bi bi-cart-plus"></i></button>
                            </div>
                        </div>
                    </EditItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </form>
    <script>
        function agregarCantidad() {
            var cantidad = document.getElementById("cantidadProducto").innerText;
            document.getElementById("cantidadProducto").innerText = parseInt(cantidad) + 1;
        }
        function quitarCantidad() {
            var cantidad = parseInt(document.getElementById("<%=cantidadProducto.ClientID%>").innerText);
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
