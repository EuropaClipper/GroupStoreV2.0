﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_VProducto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["usuario"] == null) Response.Redirect("VInicioSesion.aspx");
            cargarDatos();
            if(Request.QueryString.Count > 0)
            {
                establecerDatos();
            }
            else
            {
                pCodigo.InnerText = "El codigo del producto se generará automaticamente";
            }
        }
    }
    private void establecerDatos()
    {
        string codigoProducto = Request.QueryString["cp"];
        EProducto producto = new ProductoDAO().obtenerProducto(codigoProducto);
        if(producto != null)
        {
            pCodigo.InnerText = "CÓDIGO: " + codigoProducto;
            I_nombreProducto.Value = producto.Nombre;
            I_Descripcion.Value = producto.Descripcion;
            I_cantidadMax.Value = producto.CantidadMaxima.ToString();
            I_cantidadMin.Value = producto.CantidadMinima.ToString();
            I_Capacidad.Value = producto.Capacidad.ToString();
            DDL_Categorias.SelectedValue = producto.IDCategoria.ToString();
            DDL_UMedida.SelectedValue = producto.IDUnidadMedida.ToString();
            List<EExistencias> existencias = new ExistenciasDAO().obtenerExistencias(producto.Codigo);
        }
        else
        {
            Response.Redirect("VProducto.aspx");
        }
    }
    private void cargarDatos()
    {
        //llenar la dropdown list con las bodegas que tiene el negocio
        ViewState["relacionUsuarioNegocio"] = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(((EUsuario)Session["usuario"]).Cedula);
        List<EBodega> bodegas = new BodegaDAO().obtenerBodegas(((EUsuarioNegocio)ViewState["relacionUsuarioNegocio"]).NITNegocio).OrderBy(x=> x.Nombre).ToList();
        bodegas.Insert(0, (new EBodega { ID = 0, Nombre = "Seleccionar" }));
        DDL_Bodegas.DataSource = bodegas;
        DDL_Bodegas.DataTextField = "Nombre";
        DDL_Bodegas.DataValueField = "ID";
        DDL_Bodegas.DataBind();
        //
        //llenar la dropdown list con las categorias de productos
        List < ECategoria > categorias = new CategoriaDAO().obtenerCategorias().OrderBy(x=> x.Categoria).ToList();
        categorias.Insert(0, new ECategoria { ID = 0, Categoria = "Seleccionar" });
        DDL_Categorias.DataSource = categorias;
        DDL_Categorias.DataTextField = "Categoria";
        DDL_Categorias.DataValueField = "ID";
        DDL_Categorias.DataBind();
        //
        //llenar el dropdown list de las unidades de medida
        List<EUnidadMedida> unidades = new UnidadMedidaDAO().obtenerUnidadesMedida().OrderBy(x=>x.Unidad).ToList();
        unidades.Insert(0, new EUnidadMedida { ID = 0, Unidad = "Seleccionar" });
        DDL_UMedida.DataSource = unidades;
        DDL_UMedida.DataTextField = "Unidad";
        DDL_UMedida.DataValueField = "ID";
        DDL_UMedida.DataBind();
        //
    }

    protected void btn_aggProducto_ServerClick(object sender, EventArgs e)
    {
        string[] imagenes = new string[3];
        if(FU_Imagenes.PostedFiles.Count() > 3)
        {
            MensajeError.InnerText = "Solo puede cargar 3 imagenes por producto.";
            return;
        }
        else
        {
            int i = 0;
            foreach (HttpPostedFile file in FU_Imagenes.PostedFiles)
            {
                string extension = System.IO.Path.GetExtension(file.FileName);
                if (!(extension.Equals(".jpg") || extension.Equals(".png") || extension.Equals(".jpeg")))
                {
                    errorImagenes.Attributes.Add("class", "alert alert-danger d-block mt-1 p-1");
                    MensajeError.InnerText = "Solo se admiten imagenes jpg, jpeg y png";
                    return;
                }
                else
                {
                    errorImagenes.Attributes.Add("class", "d-none");
                    var guid = Guid.NewGuid();
                    string ruta = "~\\Resources\\ImagenesCargadas\\" + guid + extension;
                    imagenes[i] = ruta;
                    file.SaveAs(Server.MapPath(ruta));
                    i++;
                }
            }
        }
        var categoriaSeleccionada = DDL_Categorias.SelectedItem.Value;
        var bodegaSeleccionada = DDL_Bodegas.SelectedItem.Value;
        int bodegaFull = new BodegaDAO().obtenerBodega(int.Parse(bodegaSeleccionada)).Capacidad;
        int existenciTotalEnBodega = new ExistenciasDAO().obtenerExistencias(int.Parse(bodegaSeleccionada)).Sum(x => x.Cantidad);
        if (bodegaFull - (existenciTotalEnBodega + int.Parse(I_Stock.Value)) < 0)
        {
            errorBodegallena.Attributes.Add("class", "alert alert-danger d-block mt-1 p-1");
            return;
        }
        else
        {
            errorBodegallena.Attributes.Add("class", "d-none");

        }
        int existenciasEnBodega = new ExistenciasDAO().obtenerExistencias(int.Parse(bodegaSeleccionada)).Count();//cuenta los productos registrados sin tener en cuenta la cantidad por producto
        string codigo = ((EUsuarioNegocio)ViewState["relacionUsuarioNegocio"]).NITNegocio.Substring(0, 4);
        string categoria = (categoriaSeleccionada.Length < 2) ? "0" + categoriaSeleccionada : categoriaSeleccionada.Substring(0, 2);
        string bodega = (bodegaSeleccionada.Length < 2) ? "0" + bodegaSeleccionada : bodegaSeleccionada.Substring(0, 2);
        codigo += categoria + bodega + I_nombreProducto.Value.Substring(0, 2).ToUpper() + (existenciasEnBodega + 1).ToString("00000");
        EProducto nuevoProducto = new EProducto
        {
            Codigo = codigo,
            Nombre = I_nombreProducto.Value.Trim(),
            CantidadMaxima = int.Parse(I_cantidadMax.Value.Trim()),
            CantidadMinima = int.Parse(I_cantidadMin.Value.Trim()),
            Capacidad = int.Parse(I_Capacidad.Value),
            IDCategoria = int.Parse(categoriaSeleccionada),
            IDUnidadMedida = int.Parse(DDL_UMedida.SelectedItem.Value),
            Descripcion = I_Descripcion.Value,
            Estado = true,
            ImagenUno = imagenes[0],
            ImagenDos = imagenes[1],
            ImagenTres = imagenes[2]
        };
        EExistencias relacionBodegaProducto = new EExistencias
        {
            Cantidad = int.Parse(I_Stock.Value.Trim()),
            PrecioPromedio = float.Parse(I_Precio.Value),
            CodigoBodega = int.Parse(bodegaSeleccionada),
            CodigoProducto = codigo
        };
        new ProductoDAO().insertarProducto(nuevoProducto);
        new ExistenciasDAO().agregarExistencia(relacionBodegaProducto);
        Response.Redirect("VProductos.aspx");
    }
    protected void cerrarSesion_ServerClick(object sender, EventArgs e)
    {
        Session["Usuario"] = null;
        Response.Redirect("VInicioSesion.aspx");
    }
}