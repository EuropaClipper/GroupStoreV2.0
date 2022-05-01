using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

public class DetalleDAO
{
    public List<EDetalle> obtenerDetalles(int idMovimiento)
    {
        using (var db = new Mapeo())
        {
            return db.Detalle.Where(x => x.IDMovimineto.Equals(idMovimiento)).ToList();
        }
    }
    public EDetalle obtenerDetalle(int idMovimineto, int idBodega, string codigoProducto)
    {
        using (var db = new Mapeo())
        {
            return db.Detalle.Where(x => x.IDMovimineto.Equals(idMovimineto) && x.CodigoBodega.Equals(idBodega) && x.CodigoProducto.Equals(codigoProducto)).FirstOrDefault();
        }
    }
    public void insertarDetalle(EDetalle detalle)
    {
        using(var db = new Mapeo())
        {
            db.Detalle.Add(detalle);
            db.SaveChanges();
        }
    }
    public void actualizarDetalle(EDetalle detalle)
    {
        using (var db = new Mapeo())
        {
            db.Detalle.Attach(detalle);
            db.Entry(detalle).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
    public void eliminarDetalle(EDetalle detalle)
    {
        using(var db = new Mapeo())
        {
            db.Detalle.Attach(detalle);
            db.Entry(detalle).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
    public void eliminarDetalles(int idMovimiento)
    {
        List<EDetalle> listaDetalles = obtenerDetalles(idMovimiento);
        foreach (var item in listaDetalles)
        {
            eliminarDetalle(item);
        }
    }
}