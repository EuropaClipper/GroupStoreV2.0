using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Serializable]
[Table("detalle_carrito", Schema = "public")]
public class EDetalleCarrito
{
    [Key,Column("id")]
    public int ID { get; set; }
    [Column("id_carrito")]
    public int IDCarrito { get; set; }
    [NotMapped]
    public ECarrito carrito { get { return new CarritoDAO().obtenerCarrito(IDCarrito); } set { } }
    [Column("codigo_producto")]
    public string CodigoProducto { get; set; }
    [NotMapped]
    public EProducto Producto { get { return new ProductoDAO().obtenerProducto(CodigoProducto); } set { } }
    [Column("cantidad")]
    public int Cantidad { get; set; }
    [Column("subtotal")]
    public float SubTotal { get; set; }
}