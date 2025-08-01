using System.Collections.Generic;
using ECommerceProject.Business.Concrete;
using ECommerceProject.Entities.Concrete;

namespace ECommerceProject.Business.Abstract
{
    public interface IProductService
    {
        List<ProductDto> GetAllProductsWithCategories();
        List<ProductDto> GetProductsByCategory(int categoryId); // Yeni eklendi
        Product GetProductById(int id);
    }
}
