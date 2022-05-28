using System;
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
            cargarDatos(); EUsuario usuarioRegistrado = (EUsuario)Session["usuario"];
            EUsuarioNegocio relacion = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(usuarioRegistrado.Cedula);
            nombreNegocio.InnerText = relacion.Negocio.Nombre;
            registradoComo.InnerText = usuarioRegistrado.Nombres + " " + usuarioRegistrado.Apellidos;
            if (Request.QueryString.Count > 0)
            {
                establecerDatos();
            }
            else
            {
                pCodigo.InnerText = "El codigo del producto se generará automaticamente";
                MV_BEditar.ActiveViewIndex = 0;
                MV_Editar.ActiveViewIndex = 0;
            }
        }
    }
    private void establecerDatos()
    {
        if (Request.QueryString["b"] == "") Response.Redirect("VProducto.aspx");
        string codigoProducto = Request.QueryString["cp"];
        string idBodega = Request.QueryString["b"];
        EProducto producto = new ProductoDAO().obtenerProducto(codigoProducto);
        EExistencias existencia = new ExistenciasDAO().obtenerExistencia(idBodega, codigoProducto);
        if (producto != null && existencia != null)
        {
            //cuando se edite el producto se necesita el precio, stock y idBodega. los asignare aquí
            producto.Stock = existencia.Cantidad;
            producto.IDBodega = idBodega;
            producto.Precio = existencia.PrecioPromedio;
            //
            ViewState["producto"] = producto;//variable para tener el producto a mano para hacer la edición
            MV_BEditar.ActiveViewIndex = 1;
            MV_Editar.ActiveViewIndex = 1;
            pCodigo.InnerText = "CÓDIGO: " + codigoProducto;
            I_nombreProducto.Value = producto.Nombre;
            I_Descripcion.Value = producto.Descripcion;
            I_cantidadMax.Value = producto.CantidadMaxima.ToString();
            I_cantidadMin.Value = producto.CantidadMinima.ToString();
            I_Capacidad.Value = producto.Capacidad.ToString();
            DDL_Categorias.SelectedValue = producto.IDCategoria.ToString();
            DDL_UMedida.SelectedValue = producto.IDUnidadMedida.ToString();
            DDL_Bodegas.SelectedValue = idBodega;
            I_Stock.Value = existencia.Cantidad.ToString();
            I_Precio.Value = existencia.PrecioPromedio.ToString();
            imagenUno.Attributes.Add("src", producto.ImagenUno);
            imagenDos.Attributes.Add("src", producto.ImagenDos);
            imagenTres.Attributes.Add("src", producto.ImagenTres);
        }
        else
        {
            MV_BEditar.ActiveViewIndex = 0;
            MV_Editar.ActiveViewIndex = 0;
            Response.Redirect("VProducto.aspx");
        }
    }
    private void cargarDatos()
    {
        //llenar la dropdown list con las bodegas que tiene el negocio
        List<EBodega> bodegas = new List<EBodega>();
        if (((EUsuario)Session["usuario"]).Rol.Rol == "Administrador")
        {
            MV_Aside.ActiveViewIndex = 0;
            MV_Nav.ActiveViewIndex = 0;
            ViewState["relacionUsuarioNegocio"] = new UsuarioNegocioDAO().obtenerRelacionUsuarioNegocio(((EUsuario)Session["usuario"]).Cedula);
            bodegas = new BodegaDAO().obtenerBodegas(((EUsuarioNegocio)ViewState["relacionUsuarioNegocio"]).NITNegocio).OrderBy(x => x.Nombre).ToList();
        }
        else
        {
            MV_Aside.ActiveViewIndex = 1;
            MV_Nav.ActiveViewIndex = 1;
            bodegas = new BodegaDAO().obtenerBodegas(((EUsuario)Session["usuario"]).Cedula).OrderBy(x => x.Nombre).ToList();
        }
        bodegas.Insert(0, (new EBodega { ID = "0", Nombre = "Seleccionar" }));
        DDL_Bodegas.DataSource = bodegas;
        DDL_Bodegas.DataTextField = "Nombre";
        DDL_Bodegas.DataValueField = "ID";
        DDL_Bodegas.DataBind();
        //
        //llenar la dropdown list con las categorias de productos
        List<ECategoria> categorias = new CategoriaDAO().obtenerCategorias().OrderBy(x => x.Categoria).ToList();
        categorias.Insert(0, new ECategoria { ID = 0, Categoria = "Seleccionar" });
        DDL_Categorias.DataSource = categorias;
        DDL_Categorias.DataTextField = "Categoria";
        DDL_Categorias.DataValueField = "ID";
        DDL_Categorias.DataBind();
        //
        //llenar el dropdown list de las unidades de medida
        List<EUnidadMedida> unidades = new UnidadMedidaDAO().obtenerUnidadesMedida().OrderBy(x => x.Unidad).ToList();
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
        if (FU_Imagenes.PostedFiles.Count() > 3)
        {
            errorImagenes.Attributes.Add("class", "alert alert-danger d-block mt-1 p-1");
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
        int bodegaFull = new BodegaDAO().obtenerBodega(bodegaSeleccionada).Capacidad;
        int existenciTotalEnBodega = new ExistenciasDAO().obtenerExistencias(bodegaSeleccionada).Sum(x => x.Cantidad);
        if (bodegaFull - (existenciTotalEnBodega + int.Parse(I_Stock.Value)) < 0)
        {
            errorBodegallena.Attributes.Add("class", "alert alert-danger d-block mt-1 p-1");
            return;
        }
        else
        {
            errorBodegallena.Attributes.Add("class", "d-none");

        }
        int existenciasEnBodega = new ExistenciasDAO().obtenerExistencias(bodegaSeleccionada).Count();//cuenta los productos registrados sin tener en cuenta la cantidad por producto
        string codigo = ((EUsuario)Session["usuario"]).Rol.Rol == "Administrador" ? ((EUsuarioNegocio)ViewState["relacionUsuarioNegocio"]).NITNegocio.Substring(0, 4) : ((EUsuario)Session["usuario"]).Cedula.Substring(0, 4);
        string categoria = (categoriaSeleccionada.Length < 2) ? "0" + categoriaSeleccionada : categoriaSeleccionada.Substring(0, 2);
        //string bodega = (bodegaSeleccionada.Length < 2) ? "0" + bodegaSeleccionada : bodegaSeleccionada.Substring(0, 2);
        var aleatorio = Guid.NewGuid().ToString().Substring(0, 2);
        codigo += categoria + aleatorio + I_nombreProducto.Value.Substring(0, 2).ToUpper() + (existenciasEnBodega + 1).ToString("00000");
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
            ImagenDos = imagenes[1] != null ? imagenes[1] : "~\\Resources\\Pagina\\imagen-no-disponible.jpg",
            ImagenTres = imagenes[2] != null ? imagenes[2] : "~\\Resources\\Pagina\\imagen-no-disponible.jpg"
        };
        EExistencias relacionBodegaProducto = new EExistencias
        {
            Cantidad = int.Parse(I_Stock.Value.Trim()),
            PrecioPromedio = float.Parse(I_Precio.Value),
            CodigoBodega = bodegaSeleccionada,
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

    protected void btnEditarProducto_ServerClick(object sender, EventArgs e)
    {
        bool editado = false;
        EProducto producto = (EProducto)ViewState["producto"];
        //si los campos no estan en blanco y no son iguales a lo que yá se tenía se modifica el campo
        if (I_nombreProducto.Value != "" && I_nombreProducto.Value != producto.Nombre)
        {
            producto.Nombre = I_nombreProducto.Value;
            editado = true;
        }
        if (I_cantidadMax.Value != "" && int.Parse(I_cantidadMax.Value) != producto.CantidadMaxima)
        {
            producto.CantidadMaxima = int.Parse(I_cantidadMax.Value);
            editado = true;
        }
        if (I_cantidadMin.Value != "" && int.Parse(I_cantidadMin.Value) != producto.CantidadMinima)
        {
            producto.CantidadMinima = int.Parse(I_cantidadMin.Value);
            editado = true;
        }
        if (I_Precio.Value != "" && float.Parse(I_Precio.Value) != producto.Precio)
        {
            producto.Precio = float.Parse(I_Precio.Value);
            editado = true;
        }
        if (I_Stock.Value != "" && int.Parse(I_Stock.Value) != producto.Stock)
        {
            var bodegaSeleccionada = DDL_Bodegas.SelectedItem.Value;
            int bodegaFull = new BodegaDAO().obtenerBodega(bodegaSeleccionada).Capacidad;
            int existenciTotalEnBodega = new ExistenciasDAO().obtenerExistencias(bodegaSeleccionada).Where(x => x.CodigoProducto != producto.Codigo).Sum(x => x.Cantidad);
            if (bodegaFull - (existenciTotalEnBodega + int.Parse(I_Stock.Value)) < 0)
            {
                errorBodegallena.Attributes.Add("class", "alert alert-danger d-block mt-1 p-1");
                return;
            }
            else
            {
                errorBodegallena.Attributes.Add("class", "d-none");

            }
            producto.Stock = int.Parse(I_Stock.Value);
            editado = true;
        }
        if (I_Capacidad.Value != "" && float.Parse(I_Capacidad.Value) != producto.Capacidad)
        {
            producto.Capacidad = float.Parse(I_Capacidad.Value);
            editado = true;
        }
        if (DDL_UMedida.SelectedValue != "0" && DDL_UMedida.SelectedValue != producto.IDUnidadMedida.ToString())
        {
            producto.IDUnidadMedida = int.Parse(DDL_UMedida.SelectedValue);
            editado = true;
        }
        if (DDL_Categorias.SelectedValue != "0" && DDL_Categorias.SelectedValue != producto.IDCategoria.ToString())
        {
            producto.IDCategoria = int.Parse(DDL_Categorias.SelectedValue);
            editado = true;
        }
        if (DDL_Bodegas.SelectedValue != "0" && DDL_Bodegas.SelectedValue != producto.IDBodega.ToString())
        {
            producto.IDBodega = DDL_Bodegas.SelectedValue;
            editado = true;
        }
        if (FU_Imagenes.HasFiles)
        {
            int i = 0;
            string[] imagenes = new string[3];
            if (FU_Imagenes.PostedFiles.Count() > 3)
            {
                errorImagenes.Attributes.Add("class", "alert alert-danger d-block mt-1 p-1");
                MensajeError.InnerText = "Solo puede cargar 3 imagenes por producto.";
                return;
            }
            else
            {
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
            switch (i)
            {
                case 1:
                    producto.ImagenUno = imagenes[0];
                    break;
                case 2:
                    producto.ImagenUno = imagenes[0];
                    producto.ImagenDos = imagenes[1];
                    break;
                case 3:
                    producto.ImagenUno = imagenes[0];
                    producto.ImagenDos = imagenes[1];
                    producto.ImagenTres = imagenes[2];
                    break;
            }
            editado = true;
        }
        if (editado)
        {
            EExistencias existencia = new ExistenciasDAO().obtenerExistencia(producto.IDBodega, producto.Codigo);
            existencia.Cantidad = producto.Stock;
            existencia.CodigoBodega = producto.IDBodega;
            existencia.PrecioPromedio = producto.Precio;
            new ExistenciasDAO().actualizarExistencia(existencia);
            new ProductoDAO().actualizarProducto(producto);
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El producto se ha editado correctamente');window.location.href=\"VProducto.aspx?cp=" + producto.Codigo
                + "&b=" + producto.IDBodega + "\";</script>");
        }
        else
        {
            return;
        }
    }
}