using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntitiyFrameworkDemoü
{
    public class ProductDal
    {
        public List<Product> GetAll() 
        {
            using (EtradeContext context = new EtradeContext())
            {
                return context.Products.ToList();
            }
        }
        public Product GetById(int id)
        {
            using (EtradeContext context = new EtradeContext())
            {
                 var result =context.Products.FirstOrDefault(p => p.Id == id);//lİNQ
                return result;
            }
        }

        public List<Product> GetFiyat(decimal fiyat)
        {
            using (EtradeContext context = new EtradeContext())
            {
                return context.Products.Where(P=>P.Fiyat<=fiyat).ToList();
            }
        }
        public List<Product> GetFiyat(decimal min,decimal max )
        {
            using (EtradeContext context = new EtradeContext())
            {
                return context.Products.Where(P => P.Fiyat >= min &&P.Fiyat<=max).ToList();
            }
        }
        public void Add(Product product)
        {
            using (EtradeContext context = new EtradeContext())
            {
               context.Products.Add(product);
                context.SaveChanges();
            }
        }
        public void Update(Product product)
        {
            using (EtradeContext context = new EtradeContext())
            {
                var entitiy = context.Entry(product);//Bizim verdiğimizi veri tabanındaki ile eşleştiriyor
                entitiy.State = EntityState.Modified;
                context.SaveChanges();
            }
        }
        public void Delete(Product product)
        {
            using (EtradeContext context = new EtradeContext())
            {
                var entitiy = context.Entry(product);//Bizim verdiğimizi veri tabanındaki ile eşleştiriyor
                entitiy.State = EntityState.Deleted;
                context.SaveChanges();
            }
        }
    }
}
