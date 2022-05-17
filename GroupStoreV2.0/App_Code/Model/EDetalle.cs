using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("detalle", Schema = "public")]
public class EDetalle
{
    [Key, Column("id")]
    public int ID { get; set; }
    [Column("id_movimiento")]
    public int IDMovimineto { get; set; }
    [NotMapped]
    public EMovimiento Movimineto { get { return new MovimientoDAO().obtenerMovimiento(IDMovimineto); } set { } }
    [Column("codigo_producto")]
    public string CodigoProducto { get; set; }
    [NotMapped]
    public EProducto Producto { get { return new ProductoDAO().obtenerProducto(CodigoProducto); } set { } }
    [Column("id_bodega")]
    public string CodigoBodega { get; set; }
    [NotMapped]
    public EBodega Bodega{ get { return new BodegaDAO().obtenerBodega(CodigoBodega); } set { } }
    [Column("cantidad")]
    public int Cantidad { get; set; }
    [Column("total")]
    public float Total { get; set; }
}