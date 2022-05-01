using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("negocio", Schema = "public")]
public class ENegocio
{
    [Key,Column("nit")]
    public string Nit { get; set; }
    [Column("nombre")]
    public string Nombre { get; set; }
    [Column("direccion")]
    public string Direccion { get; set; }
    [Column("telefono")]
    public string telefono { get; set; }

}