using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("usuario_negocio", Schema = "public")]
public class EUsuarioNegocio
{
    [Key,Column("id")]
    public int ID { get; set; }
    [Column("nit_negocio")]
    public string NITNegocio{ get; set; }
    [NotMapped]
    public ENegocio Negocio { get { return new NegocioDAO().ObtenerNegocio(NITNegocio); } set { } }
    [Column("cedula_usuario")]
    public string  CedulaUsuario{ get; set; }
    [NotMapped]
    public EUsuario Usuario { get { return new UsuarioDAO().ObtenerUsuario(CedulaUsuario); } set { } }
}