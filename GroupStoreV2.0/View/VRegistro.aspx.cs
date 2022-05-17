using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VRegistro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        switch (DDL_Roles.SelectedValue)
        {
            case "Comprador":
                MV_Registro.ActiveViewIndex = 1;
                MV_Registro_Usuarios.ActiveViewIndex = 0;
                break;
            case "Proveedor":
                MV_Registro.ActiveViewIndex = 1;
                MV_Registro_Usuarios.ActiveViewIndex = 1;
                break;
            case "Negocio":
                MV_Registro.ActiveViewIndex = 0;
                break;
        }
    }
    //Método para realizar el registro de los usuarios y negocios
    protected void Btn_Continuar_clic(object sender, EventArgs e)
    {
        if (DDL_Roles.SelectedValue == "Negocio")
        {
            bool check = true;
            if (new NegocioDAO().ObtenerNegocio(I_Nit.Value.Trim()) == null)
            {
                ErrorNIT.Attributes.Add("class", "d-none");
            }
            else
            {
                ErrorNIT.Attributes.Add("class", "alert alert-danger col-11 d-block");
                check = false;
            }
            if (!I_ContrasenaAdmin.Value.Equals(I_CContrasenaAdmin.Value))
            {
                errorContrasenaAdmin.Attributes.Add("class", "alert alert-danger col-11 d-block");
                check = false;
            }
            else
            {
                errorContrasenaAdmin.Attributes.Add("class", "d-none");
            }
            if (new UsuarioDAO().correoDisponible(I_CorreoAdmin.Value.Trim()))
            {
                errorCorreoAdmin.Attributes.Add("class", "d-none");
            }
            else
            {
                errorCorreoAdmin.Attributes.Add("class", "alert alert-danger col-11 d-block");
                check = false;
            }
            if (new UsuarioDAO().ObtenerUsuario(I_CedulaAdmin.Value.Trim()) == null)
            {
                errorCedulaAdmin.Attributes.Add("class", "d-none");
            }
            else
            {
                errorCedulaAdmin.Attributes.Add("class", "alert alert-danger col-11 d-block");
                check = false;
            }
            if (check == false) return;

            ENegocio nuevo_negocio = new ENegocio { Nit = I_Nit.Value, Nombre = I_NombreNegocio.Value, Direccion = I_DireccionNegocio.Value, telefono = I_TelefonoNegocio.Value };
            EUsuario usuario_admin_negocio = new EUsuario
            {
                Cedula = I_CedulaAdmin.Value,
                Nombres = I_NombresAdmin.Value,
                Apellidos = I_ApellidosAdmin.Value,
                Correo = I_CorreoAdmin.Value,
                Contrasena = I_CContrasenaAdmin.Value,
                ID_Rol = 1
            };
            EBodega bodegaAuto = new EBodega()
            {
                ID = nuevo_negocio.Nit.Substring(0,5) + "BO001",
                Capacidad = 500,
                NITNegocio = nuevo_negocio.Nit,
                Nombre = "Principal"
            };
            EUsuarioNegocio nuevaRelacion = new EUsuarioNegocio { CedulaUsuario = usuario_admin_negocio.Cedula, NITNegocio = nuevo_negocio.Nit };
            new NegocioDAO().InsertarNegocio(nuevo_negocio);
            new UsuarioDAO().InsertarUsuario(usuario_admin_negocio);
            new BodegaDAO().insertarBodega(bodegaAuto);
            new UsuarioNegocioDAO().insertarRelacionUsuarioNegocio(nuevaRelacion);
        }
        else
        {
            bool check = true;
            if (!I_Contrasena.Value.Equals(I_CContrasena.Value))
            {
                errorContrasena.Attributes.Add("class", "alert alert-danger col-11 d-block");
                check = false;
            }
            else
            {
                errorContrasena.Attributes.Add("class", "d-none");
            }
            if (new UsuarioDAO().correoDisponible(I_Correo.Value.Trim()))
            {
                errorCorreo.Attributes.Add("class", "d-none");
            }
            else
            {
                errorCorreo.Attributes.Add("class", "alert alert-danger col-11 d-block");
                check = false;
            }
            if (new UsuarioDAO().ObtenerUsuario(I_Cedula.Value.Trim()) == null)
            {
                errorCedula.Attributes.Add("class", "d-none");
            }
            else
            {
                errorCedula.Attributes.Add("class", "alert alert-danger col-11 d-block");
                check = false;
            }
            if (check == false) return;
            EUsuario usuario_nuevo = new EUsuario
            {
                Nombres = I_Nombres.Value.Trim(),
                Apellidos = I_Apellidos.Value.Trim(),
                Cedula = I_Cedula.Value.Trim(),
                Correo = I_Correo.Value.Trim(),
                Contrasena = I_CContrasena.Value.Trim(),
                Telefono = I_Telefono.Value.Trim(),
                Direccion = I_Direccion.Value.Trim()
            };
            if (DDL_Roles.SelectedValue == "Proveedor")
            {
                usuario_nuevo.Empresa = I_Empresa.Value;
                if (inputGroupFile01.PostedFile.ContentLength != 0)
                {
                    usuario_nuevo.Certificados = inputGroupFile01.Value;
                }
                usuario_nuevo.ID_Rol = 3;
                ENegocio negocio = new ENegocio
                {
                    Nit = usuario_nuevo.Cedula,
                    Nombre = usuario_nuevo.Empresa,
                    Direccion = usuario_nuevo.Direccion,
                    telefono = usuario_nuevo.Telefono
                };
                new NegocioDAO().InsertarNegocio(negocio);
            }
            else
            {
                usuario_nuevo.ID_Rol = 2;
            }
            new UsuarioDAO().InsertarUsuario(usuario_nuevo);
        }
        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Registro exitoso');window.location.href=\"VInicioSesion.aspx\";</script>");
    }

}