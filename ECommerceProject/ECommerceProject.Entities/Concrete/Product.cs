﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerceProject.Entities.Concrete
{
    public class Product
    {
            public int Id { get; set; }
            public string Name { get; set; }
            public decimal Price { get; set; }
            public int Stock { get; set; }
            public string Description { get; set; }

            public int CategoryId { get; set; }
            public virtual Category Category { get; set; }
        
    }
}
