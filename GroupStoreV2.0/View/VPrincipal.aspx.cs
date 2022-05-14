using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VPrincipal : System.Web.UI.Page
{
    private string[] imagenes;
    private string[] nombres;
    private string[] descripciones;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] != null) MV_Estado.ActiveViewIndex = 0;
        else MV_Estado.ActiveViewIndex = 1;
        List<EProducto> productos = new ProductoDAO().obtenerProductos();
        imagenes = new string[6];
        nombres = new string[6];
        descripciones = new string[6];
        int i = 0;
        foreach (var producto in productos)
        {
            if (i < 6)
            {
                imagenes[i] = producto.ImagenUno;
                nombres[i] = producto.Nombre;
                descripciones[i] = producto.Descripcion;
                i++;
            }
        }
        img1.Src = imagenes[0];
        img2.Src = imagenes[1];
        img3.Src = imagenes[2];
        img4.Src = imagenes[3];
        img5.Src = imagenes[4];
        img6.Src = imagenes[5];
        pr1.InnerText = nombres[0];
        pr2.InnerText = nombres[1];
        pr3.InnerText = nombres[2];
        pr4.InnerText = nombres[3];
        pr5.InnerText = nombres[4];
        pr6.InnerText = nombres[5];
        dsc1.InnerText = descripciones[0];
        dsc2.InnerText = descripciones[1];
        dsc3.InnerText = descripciones[2];
        dsc4.InnerText = descripciones[3];
        dsc5.InnerText = descripciones[4];
        dsc6.InnerText = descripciones[5];
    }
    //protected void categoria_ServerClick(object sender, EventArgs e)
    //{
    //    inicio.Attributes.Add("class", "nav-link");
    //    categoria.Attributes.Add("class", "nav-link active");
    //    tiendas.Attributes.Add("class", "nav-link");
    //    proveedores.Attributes.Add("class", "nav-link");
    //    //contacto.Attributes.Add("class", "nav-link");

    //}

    //protected void inicio_ServerClick(object sender, EventArgs e)
    //{
    //    inicio.Attributes.Add("class", "nav-link active");
    //    categoria.Attributes.Add("class", "nav-link");
    //    tiendas.Attributes.Add("class", "nav-link");
    //    proveedores.Attributes.Add("class", "nav-link");
    //    //contacto.Attributes.Add("class", "nav-link");

    //}

    //protected void tiendas_ServerClick(object sender, EventArgs e)
    //{
    //    inicio.Attributes.Add("class", "nav-link");
    //    categoria.Attributes.Add("class", "nav-link");
    //    tiendas.Attributes.Add("class", "nav-link active");
    //    proveedores.Attributes.Add("class", "nav-link");
    //    //contacto.Attributes.Add("class", "nav-link");
    //}

    //protected void proveedores_ServerClick(object sender, EventArgs e)
    //{
    //    inicio.Attributes.Add("class", "nav-link");
    //    categoria.Attributes.Add("class", "nav-link");
    //    tiendas.Attributes.Add("class", "nav-link");
    //    proveedores.Attributes.Add("class", "nav-link active");
    //   // contacto.Attributes.Add("class", "nav-link");
    //}

    //protected void contacto_ServerClick(object sender, EventArgs e)
    //{
    //    inicio.Attributes.Add("class", "nav-link");
    //    categoria.Attributes.Add("class", "nav-link");
    //    tiendas.Attributes.Add("class", "nav-link");
    //    proveedores.Attributes.Add("class", "nav-link");
    //    //contacto.Attributes.Add("class", "nav-link active");
    //}
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
}