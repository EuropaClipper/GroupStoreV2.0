using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VCatalogo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //llenar la dropdown list con las categorias de productos
        List<ECategoria> categorias = new CategoriaDAO().obtenerCategorias().OrderBy(x => x.Categoria).ToList();
        categorias.Insert(0, new ECategoria { ID = 0, Categoria = "Seleccionar" });
        DDL_Categorias.DataSource = categorias;
        DDL_Categorias.DataTextField = "Categoria";
        DDL_Categorias.DataValueField = "ID";
        DDL_Categorias.DataBind();
        //
        cargarDatos();
    }

    private void cargarDatos()
    {
        List<EProducto> productos = new ProductoDAO().obtenerProductos();
        foreach (var producto in productos)
        {
            producto.Precio = new ExistenciasDAO().obtenerExistenciasProd(producto.Codigo)[0].PrecioPromedio;

        }
        DL_Catalogo.DataSource = productos;
        DL_Catalogo.DataBind();
    }
    protected void DL_Catalogo_SelectedIndexChanged(object sender, EventArgs e)
    {
        DL_Catalogo.EditItemIndex =  DL_Catalogo.SelectedIndex;
        cargarDatos();
    }
}