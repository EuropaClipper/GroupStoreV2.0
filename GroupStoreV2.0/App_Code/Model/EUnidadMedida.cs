using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("unidad_medida", Schema = "public")]
public class EUnidadMedida
{
    [Key,Column("id")]
    public int ID{ get; set; }
    [Column("unidad")]
    public string Unidad { get; set; }
    [Column("abreviatura")]
    public string Abreviatura { get; set; }
}