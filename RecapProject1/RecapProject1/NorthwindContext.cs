using RecapProject1.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecapProject1
{
    public class NorthwindContext:DbContext
    {
        public DbSet<Product> Products { get; set; }//Benim elimde bir product var ve o veritabanında productsa karşılık gelir
        public DbSet<Category> Categories { get; set; }

    }
}
