using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VProductos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
        {
            Response.Redirect("VInicioSesion.aspx");
        }
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        EUsuarioNegocio relacionUsuarioNegocio = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(usuarioRegistrado.Cedula);
        List<EBodega> bodegas = new BodegaDAO().obtenerBodegas(relacionUsuarioNegocio.NITNegocio);
        ViewState["bodegas"] = bodegas;
        List<EProducto> productos = new List<EProducto>();
        foreach (var bodega in bodegas)
        {
            List<EExistencias> existencias = new ExistenciasDAO().obtenerExistencias(bodega.ID);
            foreach (var existencia in existencias)
            {
                EProducto producto = existencia.Producto;
                producto.Stock = existencia.Cantidad;
                producto.Precio = existencia.PrecioPromedio;
                producto.IDBodega = bodega.ID;
                productos.Add(producto);
            }
        }
        GV_Productos.DataSource = productos;
        GV_Productos.DataBind();
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
    protected void btnAgregarProducto_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("VProducto.aspx");
    }
    protected void GV_Productos_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GV_Productos.SelectedRow;
        int idBodega = ((List<EBodega>)ViewState["bodegas"]).Find(x => x.Nombre.Equals(row.Cells[1].Text)).ID;
        Response.Redirect("VProducto.aspx" + "?cp=" + row.Cells[0].Text + "&" + "b=" + idBodega);
    }

    protected void GV_Productos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        EProducto producto = (EProducto)e.Row.DataItem;
        if (producto != null)
        {
            float precio = float.Parse(e.Row.Cells[5].Text);
            e.Row.Cells[5].Text = precio.ToString("C2");
        }
    }

    protected void GV_Productos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}