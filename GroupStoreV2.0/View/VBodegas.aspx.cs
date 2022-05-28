using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VBodegas : System.Web.UI.Page
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
                EUsuarioNegocio relacion = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(usuarioRegistrado.Cedula);
                nombreNegocio.InnerText = relacion.Negocio.Nombre;
                registradoComo.InnerText = usuarioRegistrado.Nombres + " " + usuarioRegistrado.Apellidos;
                cargarBodegas();
            }
        }
    }
    void cargarBodegas()
    {
        EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
        List<EBodega> bodegas = new List<EBodega>();
        if (usuarioRegistrado.Rol.Rol == "Administrador")
        {
            MV_Aside.ActiveViewIndex = 0;
            MV_Nav.ActiveViewIndex = 0;
            EUsuarioNegocio relacionUsuarioNegocio = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(usuarioRegistrado.Cedula);
            ViewState["relacionUsuarioNegocio"] = relacionUsuarioNegocio;
            bodegas = new BodegaDAO().obtenerBodegas(relacionUsuarioNegocio.NITNegocio);
        }
        else
        {
            MV_Aside.ActiveViewIndex = 1;
            MV_Nav.ActiveViewIndex = 1;
            bodegas = new BodegaDAO().obtenerBodegas(usuarioRegistrado.Cedula);
        }
        foreach (var bodega in bodegas)
        {
            int contadorProductos = 0;
            List<EExistencias> existencias = new ExistenciasDAO().obtenerExistencias(bodega.ID);
            foreach (var producto in existencias)
            {
                contadorProductos += producto.Cantidad;
            }
            bodega.NumeroProductos = contadorProductos;
        }
        GV_Bodegas.DataSource = bodegas;
        GV_Bodegas.DataBind();
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }

    protected void btnAgregarBodega_ServerClick(object sender, EventArgs e)
    {
        I_NombreBodega.Value = "";
        I_Capacidad.Value = "";
        FilaAggEdit.Attributes.Add("class", "container-fluid col-12 col-md-12 col-lg-11 mt-4 bg-secondary bg-opacity-10 shadow rounded-3 pt-1 pb-2");
        MV_EdAggBodega.ActiveViewIndex = 0;
        BodegaCodigo.InnerText = "El código de la bodega se generará automaticamente.";
        ViewState["Editar"] = false;
    }

    protected void btnAggBodega_ServerClick(object sender, EventArgs e)
    {
        FilaAggEdit.Attributes.Add("class", "d-none");
        string nit = ((EUsuarioNegocio)ViewState["relacionUsuarioNegocio"]).NITNegocio;
        EBodega nuevaBodega = new EBodega()
        {
            ID = nit.Substring(0, 5) + "BO" + new BodegaDAO().obtenerBodegas(nit).Count(),
            Capacidad = int.Parse(I_Capacidad.Value.Trim()),
            Nombre = I_NombreBodega.Value.Trim(),
            NITNegocio = nit
        };
        new BodegaDAO().insertarBodega(nuevaBodega);
        I_NombreBodega.Value = "";
        I_Capacidad.Value = "";
        cargarBodegas();
    }

    protected void GV_Bodegas_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow fila = GV_Bodegas.SelectedRow;
        FilaAggEdit.Attributes.Add("class", "container-fluid col-12 col-md-12 col-lg-11 mt-4 bg-secondary bg-opacity-10 shadow rounded-3 pt-1 pb-2");
        MV_EdAggBodega.ActiveViewIndex = 1;
        BodegaCodigo.InnerText = "Código de bodega: " + fila.Cells[1].Text;
        ViewState["IDBodega"] = fila.Cells[1].Text;
        I_NombreBodega.Value = fila.Cells[2].Text;
        I_Capacidad.Value = fila.Cells[3].Text;

    }

    protected void btnEditar_ServerClick(object sender, EventArgs e)
    {
        EBodega bodega = new BodegaDAO().obtenerBodega(ViewState["IDBodega"].ToString());
        bodega.Nombre = I_NombreBodega.Value.Trim();
        bodega.Capacidad = int.Parse(I_Capacidad.Value.Trim());
        new BodegaDAO().actualizarBodega(bodega);
        cargarBodegas();
    }

    protected void cerrarVentanaAggEd_ServerClick(object sender, EventArgs e)
    {
        FilaAggEdit.Attributes.Add("class", "d-none");
        Response.Redirect("VBodegas.aspx");
    }


    protected void GV_Bodegas_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string idBodega = e.Keys[0].ToString();
        EBodega bodega = new BodegaDAO().obtenerBodega(idBodega);
        int existencias = new ExistenciasDAO().obtenerExistencias(idBodega).Sum(x=> x.Cantidad);
        if(existencias > 0)
        {
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('No puede eliminar la bodega "+bodega.Nombre+".\\nHay "+existencias+
                " producto(s) cagado(s).');window.location.href=\"VBodegas.aspx\";</script>");
        }
        else
        {
            new BodegaDAO().eliminarBodega(bodega);
            cargarBodegas();
        }
    }
}