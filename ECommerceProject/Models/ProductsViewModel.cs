using System.Collections.Generic;
using ECommerceProject.Business.Concrete; // ProductDto
using ECommerceProject.Entities.Concrete; // Category

public class ProductsViewModel
{
    public List<Category> Categories { get; set; }
    public List<ProductDto> Products { get; set; }
    public int? SelectedCategoryId { get; set; }
    public List<int> FavoriteProductIds { get; set; }

}
