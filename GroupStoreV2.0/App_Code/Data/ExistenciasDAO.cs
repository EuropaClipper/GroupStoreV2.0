using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;

public class ExistenciasDAO
{
    public void agregarExistencia(EExistencias existencia)
    {
        using (var db = new Mapeo())
        {
            db.Existencia.Add(existencia);
            db.SaveChanges();
        }
    }
    public void actualizarExistencia(EExistencias existencia)
    {
        using (var db = new Mapeo())
        {
            db.Existencia.Attach(existencia);
            db.Entry(existencia).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
    public void eliminarExistencia(EExistencias existencia)
    {
        using (var db = new Mapeo())
        {
            db.Existencia.Attach(existencia);
            db.Entry(existencia).State = EntityState.Deleted;
            db.SaveChanges();
        }
    }
    public EExistencias obtenerExistencia(int idBodega, string codigoproducto)
    {
        using (var db = new Mapeo())
        {
            return db.Existencia.Where(x => x.CodigoBodega.Equals(idBodega) && x.CodigoProducto.Equals(codigoproducto)).FirstOrDefault();
        }
    }
    public List<EExistencias> obtenerExistencias(int idBodega)
    {
        using (var db = new Mapeo())
        {
            return db.Existencia.Where(x => x.CodigoBodega.Equals(idBodega)).ToList();
        }
    }
    public List<EExistencias> obtenerExistencias(string codigoProducto)
    {
        using (var db = new Mapeo())
        {
            return db.Existencia.Where(x => x.CodigoProducto.Equals(codigoProducto)).ToList();
        }
    }
}