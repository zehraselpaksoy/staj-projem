using ECommerceProject.DataAccess.Concrete;
using ECommerceProject.Entities.Concrete;
using System.Collections.Generic;
using System.Data.Entity;

namespace ECommerceProject.DataAccess.Concrete
{
    public class DataInitializer : DropCreateDatabaseIfModelChanges<DataContext>
    {
        protected override void Seed(DataContext context)
        {
            var erkek = new Category { Name = "Erkek", Description = "Erkek ürünleri" };
            var kadin = new Category { Name = "Kadın", Description = "Kadın ürünleri" };

            context.Categories.Add(erkek);
            context.Categories.Add(kadin);
            context.SaveChanges();

            var erkekGiyim = new Category { Name = "Giyim", Description = "Erkek Giyim", ParentId = erkek.Id };
            context.Categories.Add(erkekGiyim);
            context.SaveChanges();

            var erkekGomlek = new Category { Name = "Gömlek", Description = "Erkek Gömlek", ParentId = erkekGiyim.Id };
            context.Categories.Add(erkekGomlek);
            context.SaveChanges();

            var kadinGiyim = new Category { Name = "Giyim", Description = "Kadın Giyim", ParentId = kadin.Id };
            context.Categories.Add(kadinGiyim);
            context.SaveChanges();

            var kadinEtek = new Category { Name = "Etek", Description = "Kadın Etek", ParentId = kadinGiyim.Id };
            context.Categories.Add(kadinEtek);
            context.SaveChanges();

            var urun1 = new Product
            {
                Name = "Keten Erkek Gömlek",
                Description = "Şık keten gömlek",
                Price = 299.99m,
                Stock = 20,
                CategoryId = erkekGomlek.Id
            };

            var urun2 = new Product
            {
                Name = "Yazlık Kadın Etek",
                Description = "Rahat yazlık etek",
                Price = 399.50m,
                Stock = 15,
                CategoryId = kadinEtek.Id
            };

            context.Products.AddRange(new List<Product> { urun1, urun2 });

            context.SaveChanges();

            base.Seed(context);
        }
    }
}
