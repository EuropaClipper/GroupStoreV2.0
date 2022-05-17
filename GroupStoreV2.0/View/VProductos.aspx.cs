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
        if(!IsPostBack)cargarProductos();
    }
    private void cargarProductos()
    {
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        List<EBodega> bodegas;
        if (usuarioRegistrado.Rol.Rol == "Administrador")
        {
            EUsuarioNegocio relacionUsuarioNegocio = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(usuarioRegistrado.Cedula);
            bodegas = new BodegaDAO().obtenerBodegas(relacionUsuarioNegocio.NITNegocio);
        }
        else
        {
            bodegas = new BodegaDAO().obtenerBodegas(usuarioRegistrado.Cedula);
        }
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
        string idBodega = ((List<EBodega>)ViewState["bodegas"]).Find(x => x.Nombre.Equals(row.Cells[2].Text)).ID;
        Response.Redirect("VProducto.aspx" + "?cp=" + row.Cells[1].Text + "&" + "b=" + idBodega);
    }

    protected void GV_Productos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        EProducto producto = (EProducto)e.Row.DataItem;
        if (producto != null)
        {
            e.Row.Cells[6].Text = producto.Precio.ToString("C2");
            if (producto.Estado)
            {
                e.Row.Cells[7].Text = "Activo";
            }
            else
            {
                e.Row.Cells[7].Text = "Inactivo";
            }
        }
    }

    protected void GV_Productos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string codigo = e.Keys[0].ToString();
        EProducto producto = new ProductoDAO().obtenerProducto(codigo);
        if (producto.Estado)
        {
            producto.Estado = false;
        }
        else
        {
            producto.Estado = true;
        }
        new ProductoDAO().actualizarProducto(producto);
        cargarProductos();
    }
}