using RecapProject1.Entities;
using System.Data.Entity;

namespace RecapProject1
{
    public class NorthwindContext : DbContext
    {
        public DbSet<Product> Products { get; set; }//Benim elimde bir product var ve o veritabanında productsa karşılık gelir
        public DbSet<Category> Categories { get; set; }

    }
}
