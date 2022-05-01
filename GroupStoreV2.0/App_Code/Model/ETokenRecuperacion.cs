using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("token_recuperacion", Schema = "seguridad")]
public class ETokenRecuperacion
{
    [Key,Column("id")]
    public int ID{ get; set; }
    [Column("token_generado")]
    public string TokenGenerado{ get; set; }
    [Column("fecha_inicio")]
    public DateTime FechaInicio { get; set; }
    [Column("fecha_caducidad")]
    public DateTime FechaCaducidad { get; set; }
    [Column("cedula_usuario")]
    public string CedulaUsuario { get; set; }
    [NotMapped]
    public EUsuario Usuario{ get { return new UsuarioDAO().ObtenerUsuario(CedulaUsuario); } set { } }
    //el estado hace referencia a si el token ya fue usado
    //true: ya fue usado false: aún no se ha usado
    [Column("estado")]
    public bool Estado { get; set; }
    [NotMapped]
    public string Msj_error { get; set; }
}