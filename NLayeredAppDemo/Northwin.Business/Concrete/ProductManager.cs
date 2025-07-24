using FluentValidation;
using Northwin.Business.Abstract;
using Northwin.Business.Utilities;
using Northwin.Business.ValidationRules.FluentValidation;
using Northwind.DataAccess.Abstract;
using Northwind.DataAccess.Concrete;
using Northwind.DataAccess.Concrete.EntityFramework;
using Northwinds.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Northwin.Business.Concrete
{
    public class ProductManager:IProductService
    {
        private IProductDal _productDal;
        public List<Product> GetAll()
        {
            return _productDal.GetAll();
        }

        public List<Product > GetProductsByCategory(int categoryId)
        {
            return _productDal.GetAll(p=>p.CategoryId==categoryId);
        }

        public List<Product> GetProductsByProductName(string productName)
        {
            return _productDal.GetAll(p => p.ProductName.ToLower().Contains(productName.ToLower()));
        }
     
        public void Add(Product product)
        {
           ValidationTool.Validate(new ProductValidator (),product);
            _productDal.Add(product); 
        }

        public void Update(Product product)
        {
            ValidationTool.Validate(new ProductValidator(), product);
            _productDal.Update(product);    
        }

        public void Delete(Product product)
        {
            _productDal.Delete(product);
        }

        public ProductManager(IProductDal productDal)
        {
            _productDal = productDal;
        }
    }
}
 