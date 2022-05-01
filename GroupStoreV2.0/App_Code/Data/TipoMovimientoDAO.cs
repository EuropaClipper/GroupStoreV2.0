using System;
using System.Collections.Generic;
using System.Linq;
public class TipoMovimientoDAO
{
    public ETipoMovimiento obtenerMovimineto(int id)
    {
        using(var db = new Mapeo())
        {
            return db.TipoMovimiento.Where(x => x.ID.Equals(id)).FirstOrDefault();
        }
    }
}