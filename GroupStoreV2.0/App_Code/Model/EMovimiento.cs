using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("movimiento", Schema = "public")]
public class EMovimiento
{
    [Key,Column("id")]
    public int ID { get; set; }
    [Column("tipo_movimiento")]
    public int IdTipoMovimiento { get; set; }
    [NotMapped]
    public ETipoMovimiento  TipoMovimiento{ get { return new TipoMovimientoDAO().obtenerMovimineto(IdTipoMovimiento); } set { } }
    [Column("cedula_usuario")]
    public string  CedulaUsuario{ get; set; }
    [NotMapped]
    public EUsuario Usuario { get { return new UsuarioDAO().ObtenerUsuario(CedulaUsuario); } set { } }
    [Column("nit_negocio")]
    public string NITNegocio { get; set; }
    [NotMapped]
    public ENegocio Negocio { get { return new NegocioDAO().ObtenerNegocio(NITNegocio); } set { } }
    [Column("descripcion")]
    public string Descripcion { get; set; }
    [Column("dia")]
    public int Dia{ get; set; }
    [Column("mes")]
    public int Mes { get; set; }
    [Column("anho")]
    public int Anho { get; set; }
    [Column("id_estado")]
    public int IDEstado { get; set; }
    [Column("precio_total")]
    public int PrecioTotal { get; set; }
    [NotMapped]
    public EEstado Estado { get { return new EstadoDAO().obtenerEstado(IDEstado); } set { } }
    [NotMapped]
    public string Fecha { get; set; }
}