using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("carrito", Schema = "public")]
public class ECarrito
{
    [Key,Column("id")]
    public int ID { get; set; }
    [Column("cedula_usuario")]
    public string CedulaUsuario { get; set; }
    [NotMapped]
    public EUsuario Usuario { get { return new UsuarioDAO().ObtenerUsuario(CedulaUsuario); } set { } }
    [Column("cantidad_total")]
    public int CatidadTotal { get; set; }
    [Column("precio_total")]
    public float PrecioTotal { get; set; }
}