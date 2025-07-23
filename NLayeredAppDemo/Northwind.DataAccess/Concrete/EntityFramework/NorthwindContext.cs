using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;


namespace Northwinds.Entities.Concrete.EntityFramework
{
    public class NorthwindContext :DbContext
    {
        public DbSet<Product> Products { get; set; }

    }
}
