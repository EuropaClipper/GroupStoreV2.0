<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VCarrito.aspx.cs" Inherits="View_VCarrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Carrito de compras</title>
    <link href="../Content/bootstrap-icons-1.8.1/bootstrap-icons.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form runat="server">
        <div class="container-fluid col-12 col-md-8 col-lg-5 shadow shadow-lg border border-1 rounded-3 my-3 py-4">
            <div class="row mb-3">
                <span class="h2 text-center mt-1">Carrito de compras <i class="bi bi-cart"></i></span>
            </div>
            <div class="d-none" runat="server" id="filaPago">
                <div class="py-2"><span class="ms-0 me-auto"><b>Total a pagar:  </b><b runat="server" id="precioTotal">$000.000.000.000</b></span></div>
                <button type="button" class="btn btn-outline-success col-4 shadow me-0 ms-auto" runat="server" onserverclick="realizarCompra">Realizar compra<i class="bi bi-currency-dollar"></i></button>
            </div>
            <div class="container text-center py-3" runat="server" id="noProductos"></div>
            <div class="row">
                <asp:DataList ID="DL_Carrito" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" OnItemCommand="DL_Carrito_ItemCommand" DataKeyField="Codigo">
                    <ItemTemplate>
                        <div class="card col-11 mx-auto mb-3">
                            <div class="card-header">
                                <h5 class="card-title text-center"><%# Eval("Nombre") %></h5>
                            </div>
                            <div class="row">
                                <img src="<%# Eval("ImagenUno") %>" />
                            </div>
                            <div class="card-body">
                                <div class="row text-center">
                                    <span class="text-dark"><%# Eval("Precio","{0:C}") %></span>
                                </div>
                                <div class="row mt-2">
                                    <asp:LinkButton ID="lnkDetalles" runat="server" CssClass="text-decoration-none text-center" CommandName="detalles" CommandArgument='<%# Eval("Codigo") %>'>Ver detalles</asp:LinkButton>
                                </div>
                                <div class="d-flex mt-2 justify-content-center">
                                    <asp:TextBox ID="TB_Cantidad" runat="server"  style="width:5em" TextMode="Number" Text='<%# Eval("Stock") %>'></asp:TextBox>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-success bi bi-check" CommandName="cantidad" CommandArgument='<%# Eval("Codigo") %>' ValidationGroup='<%# Container.ItemIndex %>'></asp:LinkButton>
                                </div>
                                <div class="text-center text-danger">
                                    <asp:RequiredFieldValidator ID="RFV_Cantidad" runat="server" ControlToValidate="TB_Cantidad" ValidationGroup='<%# Container.ItemIndex %>'></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RV_Cantidad" runat="server" Type="Integer" ErrorMessage="Cantidad erronea" MaximumValue="1000" MinimumValue="1" Display="Dynamic" ControlToValidate="TB_Cantidad" ValidationGroup='<%# Container.ItemIndex %>'></asp:RangeValidator>
                                </div>
                            </div>
                            <div class="card-footer text-center">
                                <asp:LinkButton ID="LB_Quitar" runat="server" CommandName="quitar" CommandArgument='<%# Eval("Codigo") %>' CssClass="btn btn-outline-danger">Quitar del carrito <i class="bi bi-x-circle"></i></asp:LinkButton>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </form>
</body>
</html>
