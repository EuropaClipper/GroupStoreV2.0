using System.Linq;


public class RolDAO
{
    public ERol ObtenerRol(int id_rol)
    {
        using (var db = new Mapeo())
        {
            return db.Rol.Where(x => x.Id_rol.Equals(id_rol)).FirstOrDefault();
        }
    }
}