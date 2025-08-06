using ECommerceProject.DataAccess.Concrete;
using ECommerceProject.Business.Abstract;
using ECommerceProject.Entities.Concrete;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System;

namespace ECommerceProject.Business.Concrete
{
    public class ProductManager : IProductService
    {
        private readonly DataContext _context;

        // Buraya ICategoryService'i enjekte etmek en iyi pratiktir,
        // ancak mevcut kodunuzla uyumlu olması için DataContext'i kullanmaya devam ediyoruz.
        public ProductManager(DataContext context)
        {
            _context = context;
        }

        public List<ProductDto> GetAllProductsWithCategories()
        {
            var products = _context.Products
                .Include(p => p.Category)
                    .ThenInclude(c => c.ParentCategory)
                        .ThenInclude(pc => pc.ParentCategory)
                .ToList();

            return products.Select(p => new ProductDto
            {
                Id = p.Id,
                Name = p.Name,
                Price = p.Price,
                Description = p.Description,
                CategoryName = p.Category?.Name,
                ParentCategoryName = p.Category?.ParentCategory?.Name,
                GrandParentCategoryName = p.Category?.ParentCategory?.ParentCategory?.Name,
                FullCategoryPath = BuildCategoryPath(p.Category)
            }).ToList();
        }

        public List<ProductDto> GetProductsByCategory(int categoryId)
        {
            // Veritabanından tüm kategorileri çekerek hiyerarşi oluşturuyoruz.
            var allCategories = _context.Categories.ToList();

            // Verilen kategori ID'sinin kendisini ve tüm alt kategorilerini buluyoruz.
            var categoryIds = GetAllChildCategoryIds(categoryId, allCategories);

            var products = _context.Products
                .Where(p => categoryIds.Contains(p.CategoryId))
                .Include(p => p.Category)
                    .ThenInclude(c => c.ParentCategory)
                        .ThenInclude(pc => pc.ParentCategory)
                .ToList();

            return products.Select(p => new ProductDto
            {
                Id = p.Id,
                Name = p.Name,
                Price = p.Price,
                Description = p.Description,
                CategoryName = p.Category?.Name,
                ParentCategoryName = p.Category?.ParentCategory?.Name,
                GrandParentCategoryName = p.Category?.ParentCategory?.ParentCategory?.Name,
                FullCategoryPath = BuildCategoryPath(p.Category)
            }).ToList();
        }

        // Bu yardımcı metot, hiyerarşik kategori ID'lerini bulur.
        private List<int> GetAllChildCategoryIds(int parentId, List<Category> allCategories)
        {
            var result = new List<int> { parentId };

            void AddChildren(int id)
            {
                var children = allCategories
                    .Where(c => c.ParentId == id)
                    .Select(c => c.Id)
                    .ToList();

                foreach (var childId in children)
                {
                    result.Add(childId);
                    AddChildren(childId);
                }
            }

            AddChildren(parentId);
            return result;
        }

        public Product GetProductById(int id)
        {
            return _context.Products
                .Include(p => p.Category)
                    .ThenInclude(c => c.ParentCategory)
                        .ThenInclude(pc => pc.ParentCategory)
                .FirstOrDefault(p => p.Id == id);
        }

        private string BuildCategoryPath(Category category)
        {
            var path = new List<string>();
            var currentCategory = category;
            while (currentCategory != null)
            {
                path.Insert(0, currentCategory.Name);
                currentCategory = currentCategory.ParentCategory;
            }
            return string.Join(" > ", path);
        }
    }
}