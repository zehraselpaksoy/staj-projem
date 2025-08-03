using ECommerceProject.Business.Abstract;
using ECommerceProject.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerceProject.Business.Concrete
{
    public class CategoryManager : ICategoryService
    {
        public List<Category> GetAllWithHierarchy()
        {
            using (var context = new DataContext())
            {
                return context.Categories
                    .Include("ParentCategory")
                    .Include("SubCategories")
                    .ToList();
            }
        }
    }
}
