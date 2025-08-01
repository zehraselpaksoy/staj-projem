using Ninject;
using System;

namespace DependencyInjection
{
    class Program
    {
        static void Main(string[] args)
        {
            // Ninject kernel (container) oluşturuluyor
            IKernel kernel = new StandardKernel();

            // IProductDal arayüzü NhProductDal ile eşleniyor ve singleton scope veriliyor
            kernel.Bind<IProductDal>().To<NhProductDal>().InSingletonScope();

            // ProductManager nesnesi, IoC container'dan IProductDal alarak oluşturuluyor
            ProductManager productManager = new ProductManager(kernel.Get<IProductDal>());

            productManager.Save();

            Console.ReadLine();
        }
    }

    // Interface tanımı
    interface IProductDal
    {
        void Save();
    }

    // Entity Framework ile veri erişimi
    class EfProductDal : IProductDal
    {
        public void Save()
        {
            Console.WriteLine("Saved with Ef");
        }
    }

    // NHibernate ile veri erişimi
    class NhProductDal : IProductDal
    {
        public void Save()
        {
            Console.WriteLine("Saved with Nh");
        }
    }

    // Business Logic sınıfı
    class ProductManager
    {
        private IProductDal _productDal;

        // Constructor Dependency Injection
        public ProductManager(IProductDal productDal)
        {
            _productDal = productDal;
        }

        public void Save()
        {
            // İş kuralları buraya eklenebilir
            _productDal.Save();
        }
    }
}
