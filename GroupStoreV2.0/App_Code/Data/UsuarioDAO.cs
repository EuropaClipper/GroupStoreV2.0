using System.Collections.Generic;
using System.Linq;

public class UsuarioDAO
{
    public List<EUsuario> ObtenerUsuarios()
    {
        using (var db = new Mapeo())
        {
            return db.Usuario.ToList();
        }
    }
    public EUsuario ObtenerUsuario(string cedula)
    {
        using (var db = new Mapeo())
        {
            return db.Usuario.Where(x => x.Cedula.Equals(cedula)).FirstOrDefault();
        }
    }
    public bool VerificarUsuario(string correo, string contrasena)
    {
        if (ObtenerUsuarios().Where(x => x.Correo.Equals(correo) && x.Contrasena.Equals(contrasena)).FirstOrDefault() != null) return true;
        return false;

    }
    public void InsertarUsuario(EUsuario usuario)
    {
        using (var db = new Mapeo())
        {
            db.Usuario.Add(usuario);
            db.SaveChanges();
        }

    }
    public bool correoDisponible(string correo)
    {
        return ObtenerUsuarios().Find(x => x.Correo.Equals(correo)) == null ? true : false;
    }
    public void actualizarUsuario(EUsuario usuario)
    {
        using(var db = new Mapeo())
        {
            db.Usuario.Attach(usuario);
            db.Entry(usuario).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    }
}