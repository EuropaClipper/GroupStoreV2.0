using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VCarrito : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["usuario"] == null)
        {
            Response.Redirect("VInicioSesion.aspx");
        }
        if (!IsPostBack)
        {
            cargarDatos();
        }
    }
    private void cargarDatos()
    {
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        ECarrito carrito = new CarritoDAO().obtenerCarrito(usuarioRegistrado.Cedula);
        if(carrito == null)
        {
            filaPago.Attributes.Add("class", "d-none");
            string filaNoProductos = "<div class=\"row\">" + "<span class=\"h3\">No ha cargado productos en el Carrito</span>" +"</div>";
            filaNoProductos += "<div class\"row\">" + "<a class=\"btn btn-outline-primary mt-2\" href=\"VPrincipal.aspx\">Ir a inicio</a>" + "</div>";
            noProductos.InnerHtml = filaNoProductos;
            DL_Carrito.DataSource = null;
            DL_Carrito.DataBind();
        }
        else
        {
            ViewState["carrito"] = carrito;
            List<EDetalleCarrito> detalles = new DetallesCarritoDAO().obtenerDetallesCarrito(carrito.ID);
            List<EProducto> productos = new List<EProducto>();
            foreach (var detalle in detalles)
            {
                EProducto aux = detalle.Producto;
                aux.Stock = detalle.Cantidad;
                aux.Precio = detalle.SubTotal;
                productos.Add(aux);
            }
            filaPago.Attributes.Add("class", "d-flex px-3");
            precioTotal.InnerText = carrito.PrecioTotal.ToString("C");
            DL_Carrito.DataSource = productos;
            DL_Carrito.DataBind();
        }
    }
    protected void DL_Carrito_ItemCommand(object source, DataListCommandEventArgs e)
    {
        ECarrito carrito = (ECarrito)ViewState["carrito"];
        switch (e.CommandName)
        {
            case "cantidad":
                int cantidadNueva = int.Parse(((TextBox)e.Item.FindControl("TB_Cantidad")).Text);
                EDetalleCarrito detalleP = new DetallesCarritoDAO().obtenerDetalleCarrito(e.CommandArgument.ToString(),carrito.ID);
                float precioUnidad = detalleP.SubTotal / detalleP.Cantidad;
                int cantidadAnterior = detalleP.Cantidad;
                carrito.CatidadTotal -= cantidadAnterior;
                carrito.CatidadTotal += cantidadNueva;
                carrito.PrecioTotal -= detalleP.SubTotal;
                carrito.PrecioTotal += cantidadNueva * precioUnidad;
                new CarritoDAO().actualizarCarrito(carrito);
                if (carrito.CatidadTotal == 0) new CarritoDAO().eliminarCarrito(((EUsuario)Session["usuario"]).Cedula);
                detalleP.Cantidad = cantidadNueva;
                detalleP.SubTotal = cantidadNueva * precioUnidad;
                new DetallesCarritoDAO().actualizarDetalleCarrito(detalleP);
                cargarDatos();
                ViewState["carrito"] = carrito;

                break;
            case "detalles":
                Response.Redirect("VCarrito.aspx?p=" + e.CommandArgument);
                break;
            case "quitar":
                EDetalleCarrito detalle = new DetallesCarritoDAO().obtenerDetalleCarrito(e.CommandArgument.ToString(),carrito.ID);
                carrito.CatidadTotal -= detalle.Cantidad;
                carrito.PrecioTotal -= detalle.SubTotal;
                new CarritoDAO().actualizarCarrito(carrito);
                if (carrito.CatidadTotal == 0) new CarritoDAO().eliminarCarrito(((EUsuario)Session["usuario"]).Cedula);
                else new DetallesCarritoDAO().eliminarDetalleCarrito(detalle);
                cargarDatos();
                break;
        }
    }

    protected void realizarCompra(object sender, EventArgs e)
    {
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        ECarrito carrito =  (ECarrito)ViewState["carrito"];
        List<EDetalleCarrito> detalles = new DetallesCarritoDAO().obtenerDetallesCarrito(carrito.ID);
        List<EProducto> productosCompra = new List<EProducto>();
        foreach (var detalle in detalles)
        {
            EProducto aux = new ProductoDAO().obtenerProducto(detalle.CodigoProducto);
            aux.Stock = detalle.Cantidad;
            aux.Precio = detalle.SubTotal;
            productosCompra.Add(aux);
        }
        List<EExistencias> existencias = new List<EExistencias>();
        foreach (var producto in productosCompra)
        {
            EExistencias existencia = new ExistenciasDAO().obtenerExistenciasProd(producto.Codigo).First();
            existencia.NITNegocio = existencia.Bodega.NITNegocio;
            existencia.Cantidad = producto.Stock;
            existencia.PrecioPromedio = producto.Precio;
            existencias.Add(existencia);
        }
        var grupo = existencias.GroupBy(x => x.NITNegocio);
        foreach (var item in grupo)
        {
            //se tiene un objeto con un key -> nit del negocio y un arreglo/lista de objetos con las existencias de los productos
            string nitNegocio = item.Key;
            EMovimiento nuevoMovimineto = new EMovimiento()
            {
                IdTipoMovimiento = 2,
                CedulaUsuario = usuarioRegistrado.Cedula,
                NITNegocio = nitNegocio,
                Descripcion = "Compra del usuario " + usuarioRegistrado.Cedula + " Al negocio " + nitNegocio,
                Dia = DateTime.Now.Day,
                Mes = DateTime.Now.Month,
                Anho = DateTime.Now.Year,
                IDEstado = 1,
                PrecioTotal = item.Where(x=> x.NITNegocio.Equals(nitNegocio)).Sum(x=> x.PrecioPromedio)
            };
            new MovimientoDAO().insertarMovimiento(nuevoMovimineto);
            foreach (var subitem in item)
            {
                EDetalle detalleNuevoMovimineto = new EDetalle()
                {
                    IDMovimineto = nuevoMovimineto.ID,
                    CodigoProducto = subitem.CodigoProducto,
                    CodigoBodega = subitem.CodigoBodega,
                    Cantidad = detalles.Where(x=> x.CodigoProducto.Equals(subitem.CodigoProducto)).First().Cantidad,
                    Total = detalles.Where(x => x.CodigoProducto.Equals(subitem.CodigoProducto)).First().SubTotal
                };
                new DetalleDAO().insertarDetalle(detalleNuevoMovimineto);
            }
        }
        new CarritoDAO().eliminarCarrito(usuarioRegistrado.Cedula);
        cargarDatos();
    }
}