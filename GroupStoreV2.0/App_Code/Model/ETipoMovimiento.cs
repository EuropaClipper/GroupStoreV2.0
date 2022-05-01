using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("tipo_movimineto", Schema = "public")]
public class ETipoMovimiento
{
    [Key,Column("id")]
    public int ID{ get; set; }
    [Column("movimiento")]
    public string Movimiento{ get; set; }
}