using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
public class MovimientoDAO
{
  public EMovimiento obtenerMovimiento(int idMovimiento)
    {
        using(var db = new Mapeo())
        {
            return db.Movimiento.Where(x => x.ID.Equals(idMovimiento)).FirstOrDefault();
        }
    }
    public List<EMovimiento> obtenerMovimientosNegocio(string nitNegocio)
    {
        using (var db = new Mapeo())
        {
            return db.Movimiento.Where(x => x.NITNegocio.Equals(nitNegocio)).ToList();
        }
    }
    public List<EMovimiento> obtenerMovimientosUsuario(string cedulaUsuario)
    {
        using (var db = new Mapeo())
        {
            return db.Movimiento.Where(x => x.CedulaUsuario.Equals(cedulaUsuario)).ToList();
        }
    }
    public void insertarMovimiento(EMovimiento movimiento)
    {
        using(var db = new Mapeo())
        {
            db.Movimiento.Add(movimiento);
            db.SaveChanges();
        }
    }
    public void actualizarMovimineto(EMovimiento movimiento)
    {
        using(var db = new Mapeo())
        {
            db.Movimiento.Attach(movimiento);
            db.Entry(movimiento).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
}