using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VPedidos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        if (!(usuarioRegistrado != null && (usuarioRegistrado.Rol.Rol.Equals("Proveedor") || usuarioRegistrado.Rol.Rol.Equals("Administrador"))))
        {
            Response.Redirect("VPrincipal.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                cargarPedidos();
            }
        }
    }
    void cargarPedidos()
    {
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        EUsuarioNegocio relacionUsuarioNegocio = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(usuarioRegistrado.Cedula);
        string tarjetas = "";
        string filas = "";
        List<EMovimiento> movimientos = new MovimientoDAO().obtenerMovimientosNegocio(relacionUsuarioNegocio.NITNegocio).Where(x=>x.Estado.Estado.Equals("Pendiente")).ToList();
        if(movimientos.Count() == 0)
        {
            tarjetas += "<h3 Class=\"text-center\">No se encontraron pedidos pendientes</h3>";
        }
        else
        {
            int cont = 0;
            foreach (var movimiento in movimientos)
            {
                List<EDetalle> detallesMovimiento = new DetalleDAO().obtenerDetalles(movimiento.ID);
                int produtosPedido = detallesMovimiento.Sum(x => x.Cantidad);
                float precioTotal = movimiento.PrecioTotal;
                tarjetas += "<div class=\"card text-center m-3 col-12 col-lg-3\">" +
                    "<div class=\"card-body\">" +
                    "<h5 class=\"card-title\">ID Comprador: " + movimiento.CedulaUsuario + "</h5>" +
                    "<p class=\"card-text\"><b>Descripción:</b><br/>" + movimiento.Descripcion +
                    "<br/>" + produtosPedido + " productos cargados</p>" +
                    "<a href=\"VPedido.aspx?mid=" + movimiento.ID + "\" class=\"btn btn-outline-primary\">Ver detalles del pedido</a>" +
                    "</div></div>";
                if (cont > 1)
                {
                    filas += "<div class=\"row justify-content-center\">" + tarjetas + "</div>";
                    tarjetas = "";
                    cont = 0;
                }
                cont++;
            }
        }
        tarjetasPedidos.InnerHtml = filas;
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
}