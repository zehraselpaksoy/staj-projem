using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections;
using System.Collections.Generic;

namespace CollectionAsserts.Tests
{
    [TestClass]
    public class UnitTest1
    {
        private List<string> _kullanicilar;

        [TestInitialize]
        public void DataOlustur()
        {
            _kullanicilar = new List<string>();

            _kullanicilar.Add("Salih");
            _kullanicilar.Add("Engin");
            _kullanicilar.Add("Ahmet");
        }

        [TestMethod]
        public void Elemanlar_ve_sirasi_ayni_olmalidir()
        {
            List<string> yeniKullanicilar = new List<string>();
            yeniKullanicilar.Add("Salih");
            yeniKullanicilar.Add("Engin");
            yeniKullanicilar.Add("Ahmet");

            CollectionAssert.AreEqual(_kullanicilar, yeniKullanicilar);
        }

        [TestMethod]
        public void Elemanlar_ayni_fakat_sirasi_farklı_olmalidir()
        {
            List<string> yeniKullanicilar = new List<string>();
            yeniKullanicilar.Add("Ahmet");
            yeniKullanicilar.Add("Salih");
            yeniKullanicilar.Add("Engin");

            CollectionAssert.AreEquivalent(_kullanicilar, yeniKullanicilar);
        }
        [TestMethod]
        public void Elemanlardan_en_az_biri_farklı_olmalidir()
        {
            List<string> yeniKullanicilar = new List<string>();
            yeniKullanicilar.Add("Ahmet");
            yeniKullanicilar.Add("Gorkem");
            yeniKullanicilar.Add("Engin");

            CollectionAssert.AreNotEquivalent(_kullanicilar, yeniKullanicilar);
        }

        [TestMethod]
        public void Kullanicilar_null_deger_almamalidir()
        {
            CollectionAssert.AllItemsAreNotNull(_kullanicilar);
        }

        [TestMethod]
        public void Kullanicilar_unique_olmalidir()
        {
            CollectionAssert.AllItemsAreUnique(_kullanicilar);
        }

        [TestMethod]
        public void Tum_elemanlar_ayni_tipte_olmalidir()
        {
            ArrayList liste = new ArrayList()
            {
                "Salih", "Engin", "Ahmet" //12
            };

            CollectionAssert.AllItemsAreInstancesOfType(liste, typeof(string));
        }

        [TestMethod]
        public void IsSubsetOf_test()
        {
            List<string> yeniKullanicilar = new List<string> { "Salih", "Engin" };
            List<string> eskiKullanicilar = new List<string> { "Salih", "Cevdet" };

            CollectionAssert.IsSubsetOf(yeniKullanicilar, _kullanicilar);
            CollectionAssert.IsNotSubsetOf(eskiKullanicilar, _kullanicilar);
        }

        [TestMethod]
        public void Contains_test()
        {
            CollectionAssert.Contains(_kullanicilar, "Salih");
            CollectionAssert.DoesNotContain(_kullanicilar, "Cevat");
        }
    }
}