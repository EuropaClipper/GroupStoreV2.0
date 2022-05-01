using System.Linq;
using System.Data.Entity;
public class CarritoDAO
{
    public ECarrito obtenerCarrito(string cedulaUsuario)
    {
        using(var db = new Mapeo())
        {
            return db.Carrito.Where(x => x.CedulaUsuario.Equals(cedulaUsuario)).FirstOrDefault();
        }
    }
    public ECarrito obtenerCarrito(int idCarrito)
    {
        using (var db = new Mapeo())
        {
            return db.Carrito.Where(x => x.ID.Equals(idCarrito)).FirstOrDefault();
        }
    }
    public void actualizarCarrito(ECarrito carrito)
    {
        using(var db = new Mapeo())
        {
            db.Carrito.Attach(carrito);
            db.Entry(carrito).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
    public void eliminarCarrito(string cedulaUsuario)
    {
        ECarrito carrito = obtenerCarrito(cedulaUsuario);
        new DetallesCarritoDAO().eliminarDetallesCarrito(carrito.ID);
        using (var db = new Mapeo())
        {
            db.Carrito.Attach(carrito);
            db.Entry(carrito).State = EntityState.Deleted;
            db.SaveChanges();
        }
    }
}