using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("autenticacion", Schema = "seguridad")]
public class EAutenticacion
{
    [Key,Column("id")]
    public int ID{ get; set; }
    [Column("cedula_usuario")]
    public string CedulaUsuario{ get; set; }
    [NotMapped]
    public EUsuario Usuario { get { return new UsuarioDAO().ObtenerUsuario(CedulaUsuario); } set { } }
    [Column("ip")]
    public string IP{ get; set; }
    [Column("mac")]
    public string MAC { get; set; }
    [Column("fecha_inicio")]
    public DateTime FechaInicio { get; set; }
    [Column("session")]
    public string Session { get; set; }
    [Column("fecha_fin")]
    public DateTime FechaFin { get; set; }
}