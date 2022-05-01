using System.Data.Entity;
public class Mapeo : DbContext
{
    static Mapeo()
    {
        Database.SetInitializer<Mapeo>(null);
    }
    public Mapeo() : base("name=BDGroupStore") { }
    private readonly string schema;
    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        modelBuilder.HasDefaultSchema(this.schema);
        base.OnModelCreating(modelBuilder);
     }
    public virtual DbSet<EUsuario> Usuario { get; set; }
    public virtual DbSet<ENegocio> Negocio { get; set; }
    public virtual DbSet<ERol> Rol{ get; set; }
    public virtual DbSet<ETokenRecuperacion> TokenRecuperacion { get; set; }
    public virtual DbSet<EAutenticacion> Autenticacion{ get; set; }
    public virtual DbSet<EBodega> Bodega { get; set; }
    public virtual DbSet<ECarrito> Carrito { get; set; }
    public virtual DbSet<ECategoria> Categoria { get; set; }
    public virtual DbSet<EDetalle> Detalle { get; set; }
    public virtual DbSet<EDetalleCarrito> DetalleCarrito { get; set; }
    public virtual DbSet<EExistencias> Existencia { get; set; }
    public virtual DbSet<EMovimiento> Movimiento { get; set; }
    public virtual DbSet<ETipoMovimiento> TipoMovimiento { get; set; }
    public virtual DbSet<EProducto> Producto { get; set; }
    public virtual DbSet<EUnidadMedida> UnidadMedida { get; set; }
    public virtual DbSet<EUsuarioNegocio> UsuarioNegocio { get; set; }
}