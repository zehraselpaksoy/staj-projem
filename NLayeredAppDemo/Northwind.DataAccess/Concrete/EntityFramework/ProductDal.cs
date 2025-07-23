using Northwind.DataAccess.Abstract;
using Northwinds.Entities.Concrete;
using Northwinds.Entities.Concrete.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Northwind.DataAccess.Concrete.EntityFramework
{
    public class EfProductDal:IProductDal
    {
        public List<Product> GetAll()
        {
            using (NorthwindContext context = new NorthwindContext())
            {
                return context.Products.ToList();
            }
        }
        public Product Get(int id)
        {
            using (NorthwindContext context = new NorthwindContext())
            {
                return context.Products.SingleOrDefault(p=>p.ProductId==id);
            }
        }
        public void Add(Product product)
        {

            using (NorthwindContext context = new NorthwindContext())
            {
                context.Products.Add(product);
                context.SaveChanges();//değişiklikleri veri  tabanına kaydeder

            }
        }
        public void Update(Product product)
        {
          
        }
        public void Delete(Product product)
        {
            
        }
    }
}
