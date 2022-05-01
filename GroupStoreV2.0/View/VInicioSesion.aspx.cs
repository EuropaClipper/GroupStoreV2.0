using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VInicioSesion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_IniciarSesion_Click(object sender, EventArgs e)
    {
        if (new UsuarioDAO().VerificarUsuario(I_Correo.Value.Trim(), I_Contrasena.Value.Trim()))
        {
            Session["usuario"] = new UsuarioDAO().ObtenerUsuarios().Where(x => x.Correo.Equals(I_Correo.Value.Trim()) && x.Contrasena.Equals(I_Contrasena.Value.Trim())).First();
            string rol = ((EUsuario)Session["usuario"]).Rol.Rol;
            switch (rol)
            {
                case "Administrador":
                    Response.Redirect("VInicioAdministrador.aspx");
                    break;
                case "Comprador":
                    Response.Redirect("VPrincipal.aspx");
                    break;
                case "Proveedor":
                    Response.Redirect("VPrincipal.aspx");
                    break;
            }
        }
        else this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Datos incorrectos');</script>");
    }


    protected void Btn_Continuar_clic(object sender, EventArgs e)
    {
        string correo = I_CorreoRecuperacion.Value.Trim();
        ETokenRecuperacion tokenRecuperacion = new RecuperacionContrasena().enviarTokenRecuperacion(correo);
        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('" + tokenRecuperacion.Msj_error + "');window.location.href=\"VInicioSesion.aspx\";</script>");
    }
}