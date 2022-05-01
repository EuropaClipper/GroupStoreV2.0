using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("categoria", Schema = "public")]
public class ECategoria
{
    [Key,Column("id")]
    public int ID { get; set; }
    [Column("categoria")]
    public string Categoria { get; set; }
}