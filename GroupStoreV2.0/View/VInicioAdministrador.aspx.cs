using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VInicioAdministrador : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        if (!(usuarioRegistrado != null && usuarioRegistrado.Rol.Rol.Equals("Administrador")))
        {
            Response.Redirect("VPrincipal.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                EUsuarioNegocio relacion = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(usuarioRegistrado.Cedula);
                nombreNegocio.InnerText = relacion.Negocio.Nombre;
                registradoComo.InnerText = usuarioRegistrado.Nombres + " " + usuarioRegistrado.Apellidos;
                int pedidosNuevos = new MovimientoDAO().obtenerMovimientosNegocio(relacion.NITNegocio).Where(x => x.TipoMovimiento.Movimiento.Contains("Venta")).ToList().Count();
                numPedidosNuevos.InnerText = pedidosNuevos != 1 ? "tiene " + pedidosNuevos + " pedidos nuevos." : "tiene " + pedidosNuevos + " pedido nuevo";
            }
        }
    }

    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
}