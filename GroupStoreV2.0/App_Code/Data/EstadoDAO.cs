using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class EstadoDAO
{
    public EEstado obtenerEstado(int id)
    {
        using (var db = new Mapeo())
        {
            return db.Estado.Where(x => x.ID.Equals(id)).FirstOrDefault();
        }
    }
}