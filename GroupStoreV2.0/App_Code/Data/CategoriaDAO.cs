using System.Collections.Generic;
using System.Linq;
public class CategoriaDAO
{
    public List<ECategoria> obtenerCategorias()
    {
        using (var db = new Mapeo())
        {
            return db.Categoria.ToList();
        }
    }
    public ECategoria obtenerCategoria(int idCateogria)
    {
        using (var db = new Mapeo())
        {
            return db.Categoria.Where(x => x.ID.Equals(idCateogria)).FirstOrDefault();
        }
    }

}