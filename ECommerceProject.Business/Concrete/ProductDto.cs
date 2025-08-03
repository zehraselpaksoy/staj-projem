namespace ECommerceProject.Business.Concrete
{
    public class ProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }

        // Eski sabit alanlar (isteğe bağlı)
        public string CategoryName { get; set; }
        public string ParentCategoryName { get; set; }
        public string GrandParentCategoryName { get; set; }

        // ✅ Yeni alan: Tüm kategori yolunu tutar
        public string FullCategoryPath { get; set; }
    }
}
