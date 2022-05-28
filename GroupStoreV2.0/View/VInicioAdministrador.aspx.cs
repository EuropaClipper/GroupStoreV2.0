using System;
using System.Collections.Generic;
using System.Globalization;
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
                cargarGraficas();
                EUsuarioNegocio relacion = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(usuarioRegistrado.Cedula);
                nombreNegocio.InnerText = relacion.Negocio.Nombre;
                registradoComo.InnerText = usuarioRegistrado.Nombres + " " + usuarioRegistrado.Apellidos;
                int pedidosNuevos = new MovimientoDAO().obtenerMovimientosNegocio(relacion.NITNegocio).Where(x => x.TipoMovimiento.Movimiento.Contains("Venta")).ToList().Count();
                numPedidosNuevos.InnerText = pedidosNuevos != 1 ? "tiene " + pedidosNuevos + " pedidos nuevos." : "tiene " + pedidosNuevos + " pedido nuevo";
            }
        }
    }
    private void cargarGraficas()
    {
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        EUsuarioNegocio relacion = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(usuarioRegistrado.Cedula);
        List<EMovimiento> movimientosVentas = new MovimientoDAO().obtenerMovimientosNegocio(relacion.NITNegocio).Where(x => x.TipoMovimiento.Movimiento.Contains("Venta")).ToList();
        float[] precios = new float[movimientosVentas.Count()];
        string[] semanas = new string[movimientosVentas.Count()];
        int cont = 0;
        foreach (var item in movimientosVentas)
        {
            precios[cont] = item.PrecioTotal;
            DateTimeFormatInfo dfi = DateTimeFormatInfo.CurrentInfo;
            DateTime LastDay = new System.DateTime(item.Anho, item.Mes, item.Dia);
            System.Globalization.Calendar cal = dfi.Calendar;
            semanas[cont] = "Sem. " + cal.GetWeekOfYear(LastDay, dfi.CalendarWeekRule,dfi.FirstDayOfWeek);
            cont++;
        }
        grafica.Series["Series1"].Points.DataBindXY(semanas, precios);
        List<EMovimiento> movimientosCompras = new MovimientoDAO().obtenerMovimientosNegocio(relacion.NITNegocio).Where(x => x.TipoMovimiento.Movimiento.Contains("Compra")).ToList();
        float[] preciosCompra = new float[movimientosVentas.Count()];
        string[] semanasCompra = new string[movimientosVentas.Count()];
        int contCompra = 0;
        foreach (var item in movimientosCompras)
        {
            preciosCompra[contCompra] = item.PrecioTotal;
            DateTimeFormatInfo dfi = DateTimeFormatInfo.CurrentInfo;
            DateTime LastDay = new System.DateTime(item.Anho, item.Mes, item.Dia);
            System.Globalization.Calendar cal = dfi.Calendar;
            semanasCompra[contCompra] = "Sem. " + cal.GetWeekOfYear(LastDay, dfi.CalendarWeekRule, dfi.FirstDayOfWeek);
            contCompra++;
        }
        graficaCompras.Series["Series1"].Points.DataBindXY(semanasCompra, preciosCompra);

    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
}