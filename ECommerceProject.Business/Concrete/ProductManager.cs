using ECommerceProject.Business.Abstract;
using ECommerceProject.DataAccess.Concrete;
using ECommerceProject.Entities.Concrete;
using System.Collections.Generic;
using System.Data.Entity;
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

        // Tüm ürünleri kategori hiyerarşisiyle getir
        public List<ProductDto> GetAllProductsWithCategories()
        {
            var products = _context.Products
                .Include("Category")
                .Include("Category.ParentCategory")
                .Include("Category.ParentCategory.ParentCategory")
                .ToList(); 

            return products.Select(p => new ProductDto
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
                    ? p.Category.ParentCategory.ParentCategory.Name : null,

                
                FullCategoryPath = BuildCategoryPath(p.Category)
            }).ToList();
        }

        // Seçilen kategori ve alt kategorilere göre ürünleri getir
        public List<ProductDto> GetProductsByCategory(int categoryId)
        {
            var allCategories = _context.Categories.ToList();
            var categoryIds = GetAllChildCategoryIds(categoryId, allCategories);

            var products = _context.Products
                .Where(p => categoryIds.Contains(p.CategoryId))
                .Include("Category")
                .Include("Category.ParentCategory")
                .Include("Category.ParentCategory.ParentCategory")
                .ToList();

            return products.Select(p => new ProductDto
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
                    ? p.Category.ParentCategory.ParentCategory.Name : null,

               
                FullCategoryPath = BuildCategoryPath(p.Category)
            }).ToList();
        }

        // Alt kategori ID'lerini 
        private List<int> GetAllChildCategoryIds(int parentId, List<Category> allCategories)
        {
            var result = new List<int> { parentId };

            void AddChildren(int id)
            {
                var children = allCategories.Where(c => c.ParentId == id).Select(c => c.Id).ToList();
                foreach (var childId in children)
                {
                    result.Add(childId);
                    AddChildren(childId); 
                }
            }

            AddChildren(parentId);
            return result;
        }

        // Tek ürün getir
        public Product GetProductById(int id)
        {
            return _context.Products.Find(id);
        }

        // Kategori hiyerarşisini yukarıdan aşağıya oluştur
        private string BuildCategoryPath(Category category)
        {
            var path = new List<string>();
            while (category != null)
            {
                path.Insert(0, category.Name);
                category = category.ParentCategory;
            }
            return string.Join(" > ", path);
        }
    }
}
