using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VCatalogo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["usuario"] != null) MV_Estado.ActiveViewIndex = 0;
            else MV_Estado.ActiveViewIndex = 1;
            if (Request.QueryString.Count > 0)
            {
                string busqueda = Request.QueryString["b"];
                if(busqueda != null)
                {
                    List<EProducto> productosFiltrados = new ProductoDAO().filtrarProductos(busqueda, "", "", "0");
                    cargarDatos(productosFiltrados);
                    return;
                }
                string codigoProducto = Request.QueryString["p"];
                if (codigoProducto == null)
                {
                    Response.Redirect("VCatalogo.aspx");
                }
                EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
                if (usuarioRegistrado == null)
                {
                    this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Inicie sesion para agregar un producto al carrito.');window.location.href=\"VInicioSesion.aspx\";</script>");
                }
                else
                {
                    EProducto producto = new ProductoDAO().obtenerProducto(codigoProducto);
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

            //llenar la dropdown list con las categorias de productos
            List<ECategoria> categorias = new CategoriaDAO().obtenerCategorias().OrderBy(x => x.Categoria).ToList();
            categorias.Insert(0, new ECategoria { ID = 0, Categoria = "Seleccionar" });
            DDL_Categorias.DataSource = categorias;
            DDL_Categorias.DataTextField = "Categoria";
            DDL_Categorias.DataValueField = "ID";
            DDL_Categorias.DataBind();
            //
            cargarDatos(null);
        }
    }
    private void cargarDatos(List<EProducto> productosCargar)
    {
        string tarjetaProductos = "";
        string filas = "";
        int cont = 0;
        int numeroVueltas = 1;
        List<EProducto> productos = (productosCargar == null || productosCargar.Count() == 0) ?new ProductoDAO().obtenerProductos() :productosCargar;
        if(productosCargar != null && productosCargar.Count() == 0)
        {
            
            filas += "<div class=\"row text-center\"><div class=\"alert alert-danger d-block mt-1 p-0 col-6 mx-auto\"><i class=\"bi bi-exclamation-triangle ms-2\"></i><i class=\"ms-3\">No se encontraron productos que coincidan con los filtros aplicados</i></div></div>";
        }
        foreach (var producto in productos)
        {
            EExistencias PrimerExistencia = new ExistenciasDAO().obtenerExistenciasProd(producto.Codigo).First();

            tarjetaProductos += " <div class=\"card col-5 col-lg-3 mx-auto p-0 mb-3 mb-lg-0\" style=\"max-width: 18em; min-width:14em; \"> " +
                       "<div class=\"card-header\">" +
                       " <h5 class=\"card-title text-center\">"+producto.Nombre+"</h5>" +
                       "</div>" +
                       " <div class=\"row\">" +
                       " <img src='"+producto.ImagenUno.Replace("~","..").Replace("\\","/")+"'/>" +
                       "</div>" +
                       "<div class=\"card-body\">" +
                       "<div class=\"row text-center\">" +
                       "<span class=\"text-dark\">"+producto.Categoria.Categoria+"</span>" +
                       "</div>" +
                       "<div class=\"row text-center\">" +
                       "<span class=\"text-dark\">"+producto.Capacidad +" "+producto.UnidadMedida.Unidad+"</span>" +
                       "</div>" +
                       "<div class=\"row text-center\">" +
                       " <span class=\"text-dark\">"+PrimerExistencia.PrecioPromedio.ToString("C")+"</span>" +
                       "</div>" +
                       "<div class=\"row mt-2\">" +
                       "<a class=\"text-center text-decoration-none\" href=\"VDetalleProducto.aspx?p="+producto.Codigo+"\">Ver detalles</a>" +
                       "</div>" +
                       "</div>" +
                       "<div class=\"card-footer text-center\">" +
                       "<a class=\"btn btn-outline-success\" href=\"VCatalogo.aspx?p="+producto.Codigo+"\">Agregar al carrito <i class=\"bi bi-cart-plus\"></i></a>" +
                       "</div></div>";
            cont++;
            if (cont > 3 || (numeroVueltas > 1 && cont == productos.Count()%4) || cont == productos.Count())
            {
                filas += "<div class=\"row mb-0 mb-lg-3\">" + tarjetaProductos + "</div>";
                tarjetaProductos = "";
                cont = 0;
                numeroVueltas++;
            }
        }
        contenedorProductos.InnerHtml = filas;
    }


    protected void btnBuscar_ServerClick(object sender, EventArgs e)
    {
        string nombre = i_Nombre.Value;
        string minimo = i_minimo.Value == "" ?"-1" :i_minimo.Value;
        string maximo = i_maximo.Value == "" ? "2147483647" :i_maximo.Value;
        string categoria = DDL_Categorias.SelectedValue;
        minimo = int.Parse(minimo) > int.Parse(maximo) ? maximo : minimo;
        maximo = int.Parse(minimo) > int.Parse(maximo) ? minimo : maximo;
        if (nombre == "" && (minimo == "-1" || float.Parse(minimo) < 0) && (maximo == "2147483647" || float.Parse(maximo) <= 0) && categoria == "0")
        {
            cargarDatos(null);
            return;
        }
        if((minimo == "-1" || float.Parse(minimo) < 0) && (maximo == "2147483647" || float.Parse(maximo) <= 0))
        {
            i_minimo.Value = "";
            i_maximo.Value = "";
        }
        if(minimo == "-1" && maximo == "2147483647")
        {
            minimo = "";
            maximo = "";
        }
        List <EProducto> productosFiltrados = new ProductoDAO().filtrarProductos(nombre, minimo, maximo, categoria);
        cargarDatos(productosFiltrados);
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }

    protected void btnNavbarSearch_ServerClick(object sender, EventArgs e)
    {
        string producto = busqueda.Value.Trim();
        List<EProducto> productosFiltrados = new ProductoDAO().filtrarProductos(producto, "", "", "0");
        cargarDatos(productosFiltrados);
    }
}