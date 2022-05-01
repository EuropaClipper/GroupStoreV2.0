using System;
using System.Data.Entity;
using System.Linq;
public class AutenticacionDAO
{
    public void insertarAutenticacion(EAutenticacion autenticacion)
    {
        using(var db = new Mapeo())
        {
            db.Autenticacion.Add(autenticacion);
            db.SaveChanges();
        }
    }
    public void actualizarAutenticacion(EAutenticacion autenticacion)
    {
        using(var db = new Mapeo())
        {
            db.Autenticacion.Attach(autenticacion);
            db.Entry(autenticacion).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
    public EAutenticacion buscarAutenticacion(string cedulaUsuario, DateTime fechaInicio)
    {
        using (var db = new Mapeo())
        {
            return db.Autenticacion.Where(x => x.CedulaUsuario.Equals(cedulaUsuario) && x.FechaInicio.Equals(fechaInicio) && (x.FechaFin == null)).FirstOrDefault();
        }
    }
}