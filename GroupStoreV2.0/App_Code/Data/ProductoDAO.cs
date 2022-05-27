using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;

public class ProductoDAO
{
    public void insertarProducto(EProducto producto)
    {
        using (var db = new Mapeo())
        {
            db.Producto.Add(producto);
            db.SaveChanges();
        }
    }
    public void actualizarProducto(EProducto producto)
    {
        using (var db = new Mapeo())
        {
            db.Producto.Attach(producto);
            db.Entry(producto).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
    public void eliminarProducto(EProducto producto)
    {
        using (var db = new Mapeo())
        {
            db.Producto.Attach(producto);
            db.Entry(producto).State = EntityState.Deleted;
            db.SaveChanges();
        }
    }
    //#faltan los metodos obtener *tener en cuenta los join *no se usaron los join
    //para conseguir los datos del join se usó [NotMapped] en metodos que regresan
    //un objeto que representa la tabla con la que se relaciona 
    public EProducto obtenerProducto(string codigoProducto)
    {
        using (var db = new Mapeo())
        {
            return db.Producto.Where(x => x.Codigo.Equals(codigoProducto)).FirstOrDefault();
        }
    }
    public List<EProducto> obtenerProductos()
    {
        using (var db = new Mapeo())
        {
            return db.Producto.ToList();
        }
    }
    public List<EProducto> filtrarProductos(string nombre, string minimo, string maximo, string categoria)
    {
        if (nombre != "" && minimo == "" && maximo == "" && categoria == "0")//filtro nombre
        {
            return obtenerProductos().Where(x => x.Nombre.Contains(nombre)).ToList();
        }
        else
        {
            if (nombre == "" && minimo != "" && maximo != "" && categoria == "0")//filtro precio
            {
                List<EProducto> productos = obtenerProductos();
                foreach (var producto in productos)
                {
                    producto.Precio = new ExistenciasDAO().obtenerExistenciasProd(producto.Codigo).First().PrecioPromedio;
                }
                return productos.Where(x => x.Precio <= float.Parse(maximo) && x.Precio >= float.Parse(minimo)).ToList();
            }
            else
            {
                if (nombre == "" && minimo == "" && maximo == "" && categoria != "0")//filtro categoria
                {
                    return obtenerProductos().Where(x => x.IDCategoria.Equals(int.Parse(categoria))).ToList();
                }
                else
                {
                    if (nombre != "" && minimo != "" && maximo != "" && categoria != "0")//todos los filtros
                    {
                        return obtenerProductos().Where(x => x.Nombre.Contains(nombre) && x.Precio >= float.Parse(minimo) && x.Precio <= float.Parse(maximo) && x.IDCategoria.Equals(int.Parse(categoria))).ToList();
                    }
                    else
                    {
                        if (nombre != "" && minimo != "" && maximo != "" && categoria == "0")//filtro nombre-precio
                        {
                            List<EProducto> productos = obtenerProductos();
                            foreach (var producto in productos)
                            {
                                producto.Precio = new ExistenciasDAO().obtenerExistenciasProd(producto.Codigo).First().PrecioPromedio;
                            }
                            return productos.Where(x => x.Nombre.Contains(nombre) && (x.Precio >= float.Parse(minimo) && x.Precio <= float.Parse(maximo))).ToList();
                        }
                        else
                        {
                            if (nombre != "" && minimo == "" && maximo == "" && categoria != "0")//filtro nombre-categoria
                            {
                                return obtenerProductos().Where(x => x.Nombre.Contains(nombre) && x.IDCategoria.Equals(int.Parse(categoria))).ToList();
                            }
                            else
                            {
                                if (nombre == "" && minimo != "" && maximo != "" && categoria != "0")//filtro precio-categoria
                                {
                                    List<EProducto> productos = obtenerProductos();
                                    foreach (var producto in productos)
                                    {
                                        producto.Precio = new ExistenciasDAO().obtenerExistenciasProd(producto.Codigo).First().PrecioPromedio;
                                    }
                                    return productos.Where(x => (x.Precio >= float.Parse(minimo) && x.Precio <= float.Parse(maximo)) && x.IDCategoria.Equals(int.Parse(categoria))).ToList();
                                }
                            }
                        }
                    }
                }
            }
        }
        return null;
    }
}