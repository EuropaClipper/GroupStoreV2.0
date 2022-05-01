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
        List<EProducto> productos = new List<EProducto>();
        productos.Add(new EProducto { Nombre = "papa", IDCategoria = 1, Codigo = "1212jnjdsjk", Estado = true });
        productos.Add(new EProducto { Nombre = "papa", IDCategoria = 1, Codigo = "1212jnjdsjk", Estado = true });
        productos.Add(new EProducto { Nombre = "papa", IDCategoria = 1, Codigo = "1212jnjdsjk", Estado = true });
        productos.Add(new EProducto { Nombre = "papa", IDCategoria = 1, Codigo = "1212jnjdsjk", Estado = true });
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
}