using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VHistorialCompra : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EUsuarioNegocio relacion = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(((EUsuario)Session["usuario"]).Cedula);
        List<EMovimiento> movimientos1 = new MovimientoDAO().obtenerMovimientosNegocio(relacion.NITNegocio);
        List<EMovimiento> movimientos = new MovimientoDAO().obtenerMovimientosNegocio(relacion.NITNegocio).Where(x => x.IdTipoMovimiento.Equals(1)).ToList();
        GV_Compras.DataSource = movimientos;
        GV_Compras.DataBind();
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
}