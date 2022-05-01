using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("existencias", Schema = "public")]
public class EExistencias
{
    [Key,Column("id")]
    public int ID { get; set; }
    [Column("codigo_producto")]
    public string CodigoProducto { get; set; }
    [NotMapped]
    public EProducto Producto { get { return new ProductoDAO().obtenerProducto(CodigoProducto); } set { } }
    [Column("codigo_bodega")]
    public int CodigoBodega { get; set; }
    [NotMapped]
    public EBodega Bodega { get { return new BodegaDAO().obtenerBodega(CodigoBodega); } set { } }
    [Column("cantidad")]
    public int Cantidad{ get; set; }
    [Column("precio_promedio")]
    public float PrecioPromedio { get; set; }
}