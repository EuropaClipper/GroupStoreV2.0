using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("bodega", Schema = "public")]
public class EBodega
{
    [Key,Column("id")]
    public int ID { get; set; }
    [Column("nombre")]
    public string Nombre { get; set; }
    [Column("capacidad")]
    public int Capacidad { get; set; }
    [Column("nit_negocio")]
    public string NITNegocio { get; set; }
    [NotMapped]
    public ENegocio Negocio { get { return new NegocioDAO().ObtenerNegocio(NITNegocio); } set { } }
}