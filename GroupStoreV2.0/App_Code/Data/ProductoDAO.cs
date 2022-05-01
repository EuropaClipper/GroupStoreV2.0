using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;

public class ProductoDAO
{
    public void insertarProducto(EProducto producto)
    {
        using(var db = new Mapeo())
        {
            db.Producto.Add(producto);
            db.SaveChanges();
        }
    }
    public void actualizarProducto(EProducto producto)
    {
        using(var db = new Mapeo())
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
        using(var db = new Mapeo())
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
}