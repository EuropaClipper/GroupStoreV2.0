using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VDetalleProducto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cargarDatos();
        }
    }
    private void cargarDatos()
    {
        string codigoProducto = Request.QueryString["p"];
        if (Request.QueryString.Count == 0 || codigoProducto == null)
        {
            Response.Redirect("VCatalogo.aspx");
        }
        else
        {
            EProducto producto = new ProductoDAO().obtenerProducto(codigoProducto);
            ViewState["codigoProducto"] = producto;
            if (producto == null)
            {
                Response.Redirect("VCatalogo.aspx");
            }
            else
            {
                EExistencias existenciaProducto = new ExistenciasDAO().obtenerExistenciasProd(codigoProducto).First();
                nombreProducto.InnerText = producto.Nombre;
                precio.InnerText = existenciaProducto.PrecioPromedio.ToString("C");
                descripcion.InnerText = producto.Descripcion;
                cantidad.InnerText = existenciaProducto.Cantidad.ToString();
                cantidadCompra.Value = "0";
                imag1.Src = imagen1.Src = producto.ImagenUno;
                imag2.Src = imagen2.Src = producto.ImagenDos;
                imag3.Src = imagen3.Src = producto.ImagenTres;
                RG_Cantidad.MaximumValue = existenciaProducto.Cantidad.ToString();
            }
        }
    }
    protected void img1_ServerClick(object sender, EventArgs e)
    {
        MV_Imagenes.ActiveViewIndex = 0;
    }

    protected void img2_ServerClick(object sender, EventArgs e)
    {
        MV_Imagenes.ActiveViewIndex = 1;
    }

    protected void img3_ServerClick(object sender, EventArgs e)
    {
        MV_Imagenes.ActiveViewIndex = 2;
    }

    protected void agregarCarrito(object sender, EventArgs e)
    {
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        if (usuarioRegistrado == null)
        {
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Inicie sesion para agregar un producto al carrito.');window.location.href=\"VInicioSesion.aspx\";</script>");
        }
        else
        {
            EProducto producto = (EProducto)ViewState["codigoProducto"];
            EExistencias existenciaProducto = new ExistenciasDAO().obtenerExistenciasProd(producto.Codigo).First();
            if (producto != null)
            {
                ECarrito carrito = new CarritoDAO().obtenerCarrito(usuarioRegistrado.Cedula);
                if (carrito == null)
                {
                    ECarrito nuevoCarrito = new ECarrito()
                    {
                        CedulaUsuario = usuarioRegistrado.Cedula,
                        CatidadTotal = 1,
                        PrecioTotal = existenciaProducto.PrecioPromedio,
                    };
                    carrito = new CarritoDAO().insertarCarrito(nuevoCarrito);
                }
                else
                {
                    carrito.CatidadTotal += 1;
                    carrito.PrecioTotal += existenciaProducto.PrecioPromedio;
                    new CarritoDAO().actualizarCarrito(carrito);
                }
                EDetalleCarrito detalle = new DetallesCarritoDAO().obtenerDetallesCarrito(carrito.ID).Where(x => x.CodigoProducto.Equals(producto.Codigo)).FirstOrDefault();
                if (detalle == null)
                {
                    EDetalleCarrito detalleCarrito = new EDetalleCarrito()
                    {
                        Cantidad = 1,
                        CodigoProducto = producto.Codigo,
                        IDCarrito = carrito.ID,
                        SubTotal = existenciaProducto.PrecioPromedio
                    };
                    new DetallesCarritoDAO().insertarDetalleCarrito(detalleCarrito);
                }
                else
                {
                    detalle.Cantidad += 1;
                    detalle.SubTotal += existenciaProducto.PrecioPromedio;
                    new DetallesCarritoDAO().actualizarDetalleCarrito(detalle);
                }
            }
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Se agregó un producto al carrito.');window.location.href=\"VCatalogo.aspx\";</script>");

        }
    }
}