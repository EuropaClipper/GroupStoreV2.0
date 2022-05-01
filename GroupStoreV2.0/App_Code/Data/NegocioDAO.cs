using System.Collections.Generic;
using System.Linq;


public class NegocioDAO
{
    public List<ENegocio> ObtenerNegocios()
    {
        using (var db = new Mapeo())
        {
            return db.Negocio.ToList();
        }
    }
    public ENegocio ObtenerNegocio(string nit)
    {
        using (var db = new Mapeo())
        {
            return db.Negocio.Where(x => x.Nit.Equals(nit)).FirstOrDefault();
        }
    }
    public void InsertarNegocio(ENegocio negocio)
    {
        using (var db = new Mapeo())
        {
            db.Negocio.Add(negocio);
            db.SaveChanges();
        }
    }
}