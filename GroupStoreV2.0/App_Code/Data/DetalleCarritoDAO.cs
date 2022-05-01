using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;

public class DetallesCarritoDAO
{

    public List<EDetalleCarrito> obtenerDetallesCarrito(int idCarrito)
    {
        using (var db = new Mapeo())
        {
            return db.DetalleCarrito.Where(X => X.IDCarrito.Equals(idCarrito)).ToList();
        }
    }
    public void eliminarDetallesCarrito(int idCarrito)
    {
        List<EDetalleCarrito> listaDetalles = obtenerDetallesCarrito(idCarrito);
        foreach (var detalle in listaDetalles)
        {
            eliminarDetalleCarrito(detalle);
        }
    }
    public void eliminarDetalleCarrito(EDetalleCarrito detalleCarrito)
    {
        using (var db = new Mapeo())
        {
            db.DetalleCarrito.Attach(detalleCarrito);
            db.Entry(detalleCarrito).State = EntityState.Deleted;
            db.SaveChanges();
        }
    }
    public void actualizarDetalleCarrito(EDetalleCarrito detalleCarrito)
    {
        using (var db = new Mapeo())
        {
            db.DetalleCarrito.Attach(detalleCarrito);
            db.Entry(detalleCarrito).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
}