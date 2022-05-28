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
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        if (usuarioRegistrado == null || !usuarioRegistrado.Rol.Rol.Contains("Comprador")) Response.Redirect("VInicioSesion.aspx");
        List<EMovimiento> movimientos = new MovimientoDAO().obtenerMovimientosUsuario(usuarioRegistrado.Cedula).Where(x => x.IdTipoMovimiento.Equals(2)).ToList();
        GV_Compras.DataSource = movimientos;
        GV_Compras.DataBind();
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }

    protected void btnNavbarSearch_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("VCatalogo.aspx?b=" + busqueda.Value.Trim());
    }
}