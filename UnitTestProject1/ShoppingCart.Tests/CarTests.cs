
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ShopiningCart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.Tests
{
    [TestClass]
    public class CartTests
    {
        /* Test Seviyesi Initialize ve Cleanup Örneği

         private CartManager _cartManager;
         private CartItem _cartItem;

         [TestInitialize]
         public void TestInitialize()
         {
             _cartManager = new CartManager();
             _cartItem = new CartItem()
             {
                 Product = new Product
                 {
                     ProductId = 1,
                     ProductName = "Laptop",
                     UnitPrice = 2500
                 },
                 Quantity = 1
             };

             _cartManager.Add(_cartItem);
         }

         [TestCleanup]
         public void TestCleanup()
         {
             _cartManager.Clear();
         }

         [TestMethod]
         public void Sepete_urun_eklenebilmelidir()
         {
             //Arrange
             const int beklenen = 1;

             //Act
             var toplamElemanSayisi = _cartManager.TotalItems;

             //Assert
             Assert.AreEqual(beklenen, toplamElemanSayisi);
         }

         [TestMethod]
         public void Sepette_olan_urun_cikarilabilmelidir()
         {
             //Arrange
             var sepetteOlanElemanSayisi = _cartManager.TotalItems;

             //Act
             _cartManager.Remove(1);
             var sepetteKalanElemanSayisi = _cartManager.TotalItems;

             //Assert
             Assert.AreEqual(sepetteOlanElemanSayisi - 1, 
                             sepetteKalanElemanSayisi);
         }

         [TestMethod]
         public void Sepet_temizlenebilmelidir()
         {
             //Arrange -> TestInitialize metodundan gelicek

             //Act
             _cartManager.Clear();

             //Assert
             Assert.AreEqual(0, _cartManager.TotalQuantity);
             Assert.AreEqual(0, _cartManager.TotalItems);

         }*/

        /*Class Seviyesi Initialize ve Cleanup Örneği*/
        private static CartManager _cartManager;
        private static CartItem _cartItem;

        [ClassInitialize]
        public static void ClassInitialize(TestContext testContext)
        {
            _cartManager = new CartManager();
            _cartItem = new CartItem()
            {
                Product = new Product
                {
                    ProductId = 1,
                    ProductName = "Laptop",
                    UnitPrice = 2500
                },
                Quantity = 1
            };

            _cartManager.Add(_cartItem);
        }

        [ClassCleanup]
        public static void ClassCleanup()
        {
            _cartManager.Clear();
        }

        [TestMethod]
        public void Sepette_olan_urunden_bir_adet_eklendiginde_sepetteki_toplam_urun_adedi_bir_artmali_ve_eleman_sayisi_ayni_kalmali()
        {
            //Arrange
            decimal toplamAdet = _cartManager.TotalQuantity;
            decimal toplamElemanSayisi = _cartManager.TotalItems;

            //Act
            _cartManager.Add(new CartItem()
            {
                Product = new Product
                {
                    ProductId = 2,
                    ProductName = "Mouse",
                    UnitPrice = 10
                },
                Quantity = 1
            });

            //Assert
            Assert.AreEqual(toplamAdet + 1, _cartManager.TotalQuantity);
            Assert.AreEqual(toplamElemanSayisi + 1, _cartManager.TotalItems);
        }

        [TestMethod]
        public void Sepete_farkli_urunden_bir_adet_eklendiginde_sepetteki_toplam_urun_adedi_ve_eleman_sayisi_bir_artmali()
        {
            //Arrange
            decimal toplamAdet = _cartManager.TotalQuantity;
            decimal toplamElemanSayisi = _cartManager.TotalItems;

            //Act
            _cartManager.Add(_cartItem);

            //Assert
            Assert.AreEqual(toplamAdet + 1,
                            _cartManager.TotalQuantity);
            Assert.AreEqual(toplamElemanSayisi, _cartManager.TotalItems);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        //[ExpectedException(typeof(Exception), AllowDerivedTypes = true)]
        public void Sepete_ayni_urun_ikinci_kez_eklendiginde_hata_vermelidir()
        {
            _cartManager.Add(_cartItem);
        }

        /* Assembly Seviyesi Initialize ve Cleanup Örneği solution içinde ayrı bir projede*/
    }
}
