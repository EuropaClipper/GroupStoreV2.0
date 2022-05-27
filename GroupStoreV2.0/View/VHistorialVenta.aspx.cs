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
        if (!IsPostBack)
        {
            EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
            if (!(usuarioRegistrado != null && (usuarioRegistrado.Rol.Rol.Equals("Proveedor") || usuarioRegistrado.Rol.Rol.Equals("Administrador"))))
            {
                Response.Redirect("VInicioSesion.aspx");
            }
            else
            {
                cargarHistorialVentas();
            }
        }
    }
    private void cargarHistorialVentas()
    {
        List<EMovimiento> movimientos;
        if (((EUsuario)Session["usuario"]).Rol.Rol.Equals("Administrador"))
        {
            MV_Nav.ActiveViewIndex = 0;
            MV_Aside.ActiveViewIndex = 0;
            EUsuarioNegocio relacion = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(((EUsuario)Session["usuario"]).Cedula);
            movimientos = new MovimientoDAO().obtenerMovimientosNegocio(relacion.NITNegocio).Where(x => x.IdTipoMovimiento.Equals(2)).ToList();
        }
        else
        {
            MV_Nav.ActiveViewIndex = 1;
            MV_Aside.ActiveViewIndex = 1;
            movimientos = new MovimientoDAO().obtenerMovimientosUsuario(((EUsuario)Session["usuario"]).Cedula).Where(x => x.IdTipoMovimiento.Equals(2)).ToList();
        }
        foreach (var movimiento in movimientos)
        {
            string fechaP = (movimiento.Dia < 10 ? "0" + movimiento.Dia : "" + movimiento.Dia) + "/";
            fechaP += movimiento.Mes < 10 ? "0" + movimiento.Mes : "" + movimiento.Mes;
            fechaP += "/" + movimiento.Anho;
            movimiento.Fecha = fechaP;
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