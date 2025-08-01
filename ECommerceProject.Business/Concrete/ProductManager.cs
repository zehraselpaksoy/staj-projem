using ECommerceProject.Business.Abstract;
using ECommerceProject.DataAccess.Concrete;
using ECommerceProject.Entities.Concrete;
using System.Collections.Generic;
using System.Linq;

namespace ECommerceProject.Business.Concrete
{
    public class ProductManager : IProductService
    {
        private readonly DataContext _context;

        public ProductManager()
        {
            _context = new DataContext();
        }

        public List<ProductDto> GetAllProductsWithCategories()
        {
            return _context.Products
                .Include("Category")  // Lambda değil, string ile yazılır EF6'da
                .Include("Category.ParentCategory")  // İlişkili tabloları yüklemek için string olarak path verilir
                .Include("Category.ParentCategory.ParentCategory")
                .Select(p => new ProductDto
                {
                    Id = p.Id,
                    Name = p.Name,
                    Price = p.Price,
                    Description = p.Description,
                    CategoryName = p.Category != null ? p.Category.Name : null,
                    ParentCategoryName = p.Category != null && p.Category.ParentCategory != null
                        ? p.Category.ParentCategory.Name : null,
                    GrandParentCategoryName = p.Category != null && p.Category.ParentCategory != null
                        && p.Category.ParentCategory.ParentCategory != null
                        ? p.Category.ParentCategory.ParentCategory.Name : null
                })
                .ToList();
        }

        // Yeni metod: Kategoriye göre filtreleme
        public List<ProductDto> GetProductsByCategory(int categoryId)
        {
            return _context.Products
                .Where(p => p.CategoryId == categoryId)
                .Select(p => new ProductDto
                {
                    Id = p.Id,
                    Name = p.Name,
                    Price = p.Price,
                    Description = p.Description,
                    CategoryName = p.Category != null ? p.Category.Name : null,
                    ParentCategoryName = p.Category != null && p.Category.ParentCategory != null
                        ? p.Category.ParentCategory.Name : null,
                    GrandParentCategoryName = p.Category != null && p.Category.ParentCategory != null
                        && p.Category.ParentCategory.ParentCategory != null
                        ? p.Category.ParentCategory.ParentCategory.Name : null
                })
                .ToList();
        }

        public Product GetProductById(int id)
        {
            return _context.Products.Find(id);
        }
    }
}
