using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
public class BodegaDAO
{
    public void insertarBodega(EBodega bodega)
    {
        using(var db = new Mapeo())
        {
            db.Bodega.Add(bodega);
            db.SaveChanges();
        }
    }
    public void actualizarBodega(EBodega bodega)
    {
        using(var db = new Mapeo())
        {
            db.Bodega.Attach(bodega);
            db.Entry(bodega).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
    public void eliminarBodega(EBodega bodega)
    {
        using(var db = new Mapeo())
        {
            db.Bodega.Attach(bodega);
            db.Entry(bodega).State = EntityState.Deleted;
            db.SaveChanges();
        }
    }
    public EBodega obtenerBodega(int idBodega)
    {
        using(var db = new Mapeo())
        {
            return db.Bodega.Where(x => x.ID.Equals(idBodega)).FirstOrDefault();
        }
    }
    public List<EBodega> obtenerBodegas(string NITNegocio)
    {
        using (var db = new Mapeo())
        {
            return db.Bodega.Where(x => x.NITNegocio.Equals(NITNegocio)).ToList();
        }
    }
}