namespace ECommerceProject.Business.Concrete
{
    public class ProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }

        
        public string CategoryName { get; set; }
        public string ParentCategoryName { get; set; }
        public string GrandParentCategoryName { get; set; }

        
        public string FullCategoryPath { get; set; }
    }
}
