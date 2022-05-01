using System;
using System.Collections.Generic;
using System.Linq;

public class UsuarioNegocioDAO
{
    public void insertarRelacionUsuarioNegocio(EUsuarioNegocio relacion)
    {
        using(var db = new Mapeo())
        {
            db.UsuarioNegocio.Add(relacion);
            db.SaveChanges();
        }
    }
    public EUsuarioNegocio obtenerRelacionUsuarioNegocio(string cedula)
    {
        using(var db = new Mapeo())
        {
            return db.UsuarioNegocio.Where(x => x.CedulaUsuario.Equals(cedula)).FirstOrDefault();
        }
    }
}