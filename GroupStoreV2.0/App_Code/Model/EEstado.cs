using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("estado", Schema = "public")]
public class EEstado
{
    [Column("id")]
    public int ID { get; set; }
    [Column("estado")]
    public string Estado { get; set; }
}
