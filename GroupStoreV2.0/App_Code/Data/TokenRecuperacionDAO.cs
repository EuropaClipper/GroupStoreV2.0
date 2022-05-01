using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class TokenRecuperacionDAO
{
    public void InsetarToken(ETokenRecuperacion token)
    {
        using (var db = new Mapeo())
        {
            db.TokenRecuperacion.Add(token);
            db.SaveChanges();
        }
    }
    public void actualizarToken(ETokenRecuperacion tokenRecuperacion)
    {
        using(var db = new Mapeo())
        {
            db.TokenRecuperacion.Attach(tokenRecuperacion);
            db.Entry(tokenRecuperacion).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    }
    public ETokenRecuperacion obtenerTokenUsuario(EUsuario usuario)
    {
        using(var db = new Mapeo())
        {
            return db.TokenRecuperacion.Where(x => x.CedulaUsuario.Equals(usuario.Cedula) && x.FechaCaducidad > DateTime.Now).FirstOrDefault();
        }
    }
    public ETokenRecuperacion verificarToken(string token)
    {
        using(var db = new Mapeo())
        {
            return db.TokenRecuperacion.Where(x => x.TokenGenerado.Equals(token)).FirstOrDefault();
        }
    }
}