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
    public EDetalleCarrito obtenerDetalleCarrito(string codigoProducto, int idCarrito)
    {
        using (var db = new Mapeo())
        {
            return db.DetalleCarrito.Where(x => x.IDCarrito.Equals(idCarrito) && x.CodigoProducto.Equals(codigoProducto)).First();
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
    public void insertarDetalleCarrito(EDetalleCarrito detalle)
    {
        using (var db = new Mapeo())
        {
            db.DetalleCarrito.Add(detalle);
            db.SaveChanges();
        }
    }
    public EDetalleCarrito obtenerDetalle(int idDetalle)
    {
        using (var db = new Mapeo())
        {
            return db.DetalleCarrito.Where(x => x.ID.Equals(idDetalle)).FirstOrDefault();
        }
    }
}