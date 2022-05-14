using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VHistorialVenta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<EMovimiento> movimientos;
        if (((EUsuario)Session["usuario"]).Rol.Rol.Equals("Administrador"))
        {
            EUsuarioNegocio relacion = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(((EUsuario)Session["usuario"]).Cedula);
            movimientos = new MovimientoDAO().obtenerMovimientosNegocio(relacion.NITNegocio).Where(x => x.IdTipoMovimiento.Equals(2)).ToList();
        }
        else
        {
            movimientos = new MovimientoDAO().obtenerMovimientosUsuario(((EUsuario)Session["usuario"]).Cedula).Where(x => x.IdTipoMovimiento.Equals(2)).ToList();
        }
        GV_Ventas.DataSource = movimientos;
        GV_Ventas.DataBind();
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
}