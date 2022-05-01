using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VRecuperarContrasena : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        validarIngreso();
    }
    private void validarIngreso()
    {
        if (Request.QueryString.Count == 0)
        {
            Response.Redirect("VInicioSesion.aspx");
        }
        string tokenEnUrl = Request.QueryString["t"];
        ETokenRecuperacion tokenRecuperacion = new TokenRecuperacionDAO().verificarToken(tokenEnUrl);
        if (tokenRecuperacion == null)
        {
            Response.Redirect("VInicioSesion.aspx");
        }
        if (tokenRecuperacion.Estado == true)
        {
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El token ya fue usado. Genere uno nuevo.');window.location.href=\"VInicioSesion.aspx\";</script>");
        }
        if (tokenRecuperacion.FechaCaducidad < DateTime.Now)
        {
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El token está vencido. Genere uno nuevo.');window.location.href=\"VInicioSesion.aspx\";</script>");
        }
        ViewState["tokenUsuario"] = tokenRecuperacion;
        ViewState["cedulaUsuario"] = tokenRecuperacion.CedulaUsuario;
    }
    protected void CambiarContrasena_ServerClick(object sender, EventArgs e)
    {
        string cedulaUsuario = ViewState["cedulaUsuario"].ToString();
        ((ETokenRecuperacion)ViewState["tokenUsuario"]).Estado = true;
        new TokenRecuperacionDAO().actualizarToken(((ETokenRecuperacion)ViewState["tokenUsuario"]));
        EUsuario usuarioActualizado = new UsuarioDAO().ObtenerUsuario(cedulaUsuario);
        usuarioActualizado.Contrasena = I_Contrasena.Value.Trim();
        new UsuarioDAO().actualizarUsuario(usuarioActualizado);
        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Contraseña cambiada con exito.');window.location.href=\"VInicioSesion.aspx\";</script>");
    }
}