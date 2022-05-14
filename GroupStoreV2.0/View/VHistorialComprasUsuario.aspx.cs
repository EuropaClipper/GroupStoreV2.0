using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VHistorialComprasUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] != null) MV_Estado.ActiveViewIndex = 0;
        else MV_Estado.ActiveViewIndex = 1;
        List<EMovimiento> movimientos = new MovimientoDAO().obtenerMovimientosUsuario(((EUsuario)Session["usuario"]).Cedula).Where(x => x.IdTipoMovimiento.Equals(1)).ToList();
        GV_Compras.DataSource = movimientos;
        GV_Compras.DataBind();
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
}