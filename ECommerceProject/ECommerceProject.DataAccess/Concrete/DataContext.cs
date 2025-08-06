using ECommerceProject.Entities.Concrete;
using System.Data.Entity;

public class DataContext : DbContext
{
    public DataContext() : base("dataConnection")
    {
        this.Configuration.ProxyCreationEnabled = false;
        this.Configuration.LazyLoadingEnabled = false;
    }

    public DbSet<User> Users { get; set; }
    public DbSet<Category> Categories { get; set; }
    public DbSet<Product> Products { get; set; }
    public DbSet<Favorite> Favorites { get; set; }
    public DbSet<CartItem> CartItems { get; set; }
    public DbSet<Order> Orders { get; set; }    
    public DbSet<OrderItem> OrderItems { get; set; }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>()
            .HasOptional(c => c.ParentCategory)
            .WithMany(c => c.SubCategories)
            .HasForeignKey(c => c.ParentId)
            .WillCascadeOnDelete(false);

       
            modelBuilder.Entity<Product>()
            .HasRequired(p => p.Category)
            .WithMany(c => c.Products)
            .HasForeignKey(p => p.CategoryId)
            .WillCascadeOnDelete(false);

        modelBuilder.Entity<Favorite>()
            .HasRequired(f => f.User)
            .WithMany(u => u.Favorites)
            .HasForeignKey(f => f.UserId);

        modelBuilder.Entity<Favorite>()
            .HasRequired(f => f.Product)
            .WithMany()
            .HasForeignKey(f => f.ProductId);

        modelBuilder.Entity<CartItem>()
            .HasOptional(c => c.User)
            .WithMany(u => u.CartItems)
            .HasForeignKey(c => c.UserId);

        modelBuilder.Entity<CartItem>()
            .HasRequired(c => c.Product)
            .WithMany()
            .HasForeignKey(c => c.ProductId);

        modelBuilder.Entity<Order>()
            .HasRequired(o => o.User)
            .WithMany(u => u.Orders)
            .HasForeignKey(o => o.UserId);

        modelBuilder.Entity<OrderItem>()
            .HasRequired(oi => oi.Order)
            .WithMany(o => o.OrderItems)
            .HasForeignKey(oi => oi.OrderId);

        modelBuilder.Entity<OrderItem>()
            .HasRequired(oi => oi.Product)
            .WithMany()
            .HasForeignKey(oi => oi.ProductId);


        base.OnModelCreating(modelBuilder);
    }
}
