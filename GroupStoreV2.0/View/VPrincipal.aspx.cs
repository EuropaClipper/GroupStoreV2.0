using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VPrincipal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] != null) MV_Estado.ActiveViewIndex = 0;
        else MV_Estado.ActiveViewIndex = 1;
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