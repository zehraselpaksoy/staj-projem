﻿using Northwinds.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Northwinds.Entities.Concrete
{
    public class Product: IEntity
    {
        public string ProductName { get; set; }
        public int CategoryId { get; set; }
        public int ProductId { get; set; }
        public decimal UnitPrice { get; set; }
        public Int16 UnitsInStock { get; set; }
        public string QuantityPerUnit { get; set; }

    }
}
