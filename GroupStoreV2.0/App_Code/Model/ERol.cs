using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("roles", Schema = "public")]
public class ERol
{
    [Key,Column("id_rol")]
    public int Id_rol{ get; set; }
    [Column("rol")]
    public string Rol { get; set; }
}