using System;
using System.Collections.Generic;
using System.Linq;
public class UnidadMedidaDAO
{
    public EUnidadMedida obtenerUnidadMedida(int id)
    {
        using(var db = new Mapeo())
        {
            return db.UnidadMedida.Where(x => x.ID.Equals(id)).FirstOrDefault();
        }
    }
    public List<EUnidadMedida> obtenerUnidadesMedida()
    {
        using (var db = new Mapeo())
        {
            return db.UnidadMedida.ToList();
        }
    }
}