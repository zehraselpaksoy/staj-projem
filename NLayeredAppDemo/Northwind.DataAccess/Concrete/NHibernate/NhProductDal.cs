﻿using Northwind.DataAccess.Abstract;
using Northwinds.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Northwind.DataAccess.Concrete.NHibernate
{
    public class NhProductDal : IProductDal
    {
        public void Add(Product product)
        {
            throw new NotImplementedException();
        }

        public void Delete(Product product)
        {
            throw new NotImplementedException();
        }

       

        public Product Get(Expression<Func<Product, bool>> filter)
        {
            throw new NotImplementedException();
        }


        public List<Product> GetAll(Expression<Func<Product, bool>> filter = null)
        {
            List<Product> products = new List<Product> {
                new Product { ProductId=1,ProductName="Laptop",
                    QuantityPerUnit="1 in a box",UnitPrice= 3000,
                    UnitsInStock=11,CategoryId=1}};
            return products;
        }

        public void Update(Product product)
        {
            throw new NotImplementedException();
        }
    }
}
