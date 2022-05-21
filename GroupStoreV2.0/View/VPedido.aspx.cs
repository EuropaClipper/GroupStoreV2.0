using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VPedido : System.Web.UI.Page
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
                if(Request.QueryString.Count == 0)
                {
                    Response.Redirect("VPedidos.aspx");
                }
                else
                {
                    cargarDetallesPedido();
                }
            }
        }
    }
    private void cargarDetallesPedido()
    {
        int idMovimiento = int.Parse(Request.QueryString["mid"]);
        EMovimiento movimiento = new MovimientoDAO().obtenerMovimiento(idMovimiento);
        List<EDetalle> detalle = new DetalleDAO().obtenerDetalles(idMovimiento);
        nombre.InnerText = movimiento.Usuario.Nombres + " " + movimiento.Usuario.Apellidos;
        id.InnerText = movimiento.CedulaUsuario;
        string fechaP = (movimiento.Dia<10 ?"0"+movimiento.Dia :""+movimiento.Dia) +"/";
        fechaP += movimiento.Mes < 10 ? "0" + movimiento.Mes :""+movimiento.Mes;
        fechaP += "/" + movimiento.Anho;
        fecha.InnerText = fechaP;
        descripcion.InnerText = movimiento.Descripcion;
        string precioT = detalle.Sum(x => x.Total).ToString("C2");
        precio.InnerText = precioT;
        GV_ListaProductos.DataSource = detalle;
        GV_ListaProductos.DataBind();
        
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
}