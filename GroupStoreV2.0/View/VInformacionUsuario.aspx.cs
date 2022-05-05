using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VInformacionUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null) Response.Redirect("VInicioSesion.aspx");
        if (!IsPostBack)
        {
            EUsuario usuario = new UsuarioDAO().ObtenerUsuarios().Where(x => x.Cedula.Equals(((EUsuario)Session["usuario"]).Cedula)).FirstOrDefault();
            if (usuario.Rol.Rol.Equals("Administrador")) MV_NavUsuarios.ActiveViewIndex = 1;
            else MV_NavUsuarios.ActiveViewIndex = 0;
            cedula.Value = usuario.Cedula;
            cdl2.Value = usuario.Cedula;
            nombre.Value = usuario.Nombres;
            nom2.Value = usuario.Nombres;
            apellidos.Value = usuario.Apellidos;
            ape2.Value = usuario.Apellidos;
            correo.Value = usuario.Correo;
            correo2.Value = usuario.Correo;
            cont2.Value = usuario.Contrasena;
            //multiview usuarios 0.usuarios 1.administrador
            //multiview comprador/proveedor 0.comprador 1.proveedor
            switch (((EUsuario)Session["usuario"]).ID_Rol)
            {
                case 1:
                    MV_Usuarios.ActiveViewIndex = 1;
                    MV_UsuariosModal.ActiveViewIndex = 1;
                    break;
                case 2:
                    MV_Usuarios.ActiveViewIndex = 0;
                    MV_UsuariosModal.ActiveViewIndex = 0;
                    MV_CompProv.ActiveViewIndex = 0;
                    MV_CompProvModal.ActiveViewIndex = 0;
                    direccion.Value = usuario.Direccion;
                    dir2.Value = usuario.Direccion;
                    telefono.Value = usuario.Telefono;
                    tel2.Value = usuario.Telefono;
                    break;
                case 3:
                    MV_Usuarios.ActiveViewIndex = 0;
                    MV_UsuariosModal.ActiveViewIndex = 0;
                    MV_CompProv.ActiveViewIndex = 1;
                    MV_CompProvModal.ActiveViewIndex = 1;
                    direccion.Value = usuario.Direccion;
                    dir2.Value = usuario.Direccion;
                    telefono.Value = usuario.Telefono;
                    tel2.Value = usuario.Telefono;
                    empresa.Value = usuario.Empresa;
                    empresa2.Value = usuario.Empresa;
                    cert2.Value = usuario.Certificados;
                    break;
            }
        }

    }
    protected void Btn_Editar(object sender, EventArgs e)
    {
        EUsuario usuario = new UsuarioDAO().ObtenerUsuario(cdl2.Value);
        usuario.Cedula = cdl2.Value;
        usuario.Nombres = nom2.Value;
        usuario.Apellidos = ape2.Value;
        usuario.Correo = correo2.Value;
        usuario.Contrasena = cont2.Value;
        usuario.Direccion = dir2.Value;
        usuario.Telefono = tel2.Value;
        usuario.Empresa = empresa2.Value;
        usuario.Certificados = cert2.Value;
        new UsuarioDAO().actualizarUsuario(usuario);
        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Datos actualizados');window.location.href=\"VInformacionUsuario.aspx\";</script>");
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
}