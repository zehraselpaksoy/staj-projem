using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssertDemos
{
    [TestClass]
    public class Demo1
    {
        public TestContext TestContext { get; set; }

        [TestInitialize]
        public void TestInitialize()
        {
            TestContext.WriteLine("Test adı: {0}", TestContext.TestName);
            TestContext.WriteLine("Test durumu: {0}", TestContext.CurrentTestOutcome);
        }

        [TestCleanup]
        public void TestCleanup()
        {
            TestContext.WriteLine("Test adı: {0}", TestContext.TestName);
            TestContext.WriteLine("Test durumu: {0}", TestContext.CurrentTestOutcome);
        }

        [TestMethod]
        public void TestMethod1()
        {
            const double girilenDeger = 16;
            const double beklenen = 4;
            double gerceklesen = Math.Sqrt(girilenDeger);

            Assert.AreEqual(beklenen,
                            gerceklesen,
                            "{0} sayısının karekökü {1} olmalıdır. Elde edilen: {2}",
                            girilenDeger,
                            beklenen,
                            gerceklesen);
        }

        [TestMethod]
        public void TestMethod2()
        {
            double beklenen = 3.1622;
            // Formül: |beklenen - gerçekleşen| <= delta
            double delta = 0.0001;

            double gerceklesen = Math.Sqrt(10);
            Assert.AreEqual(beklenen, gerceklesen, delta);
        }

        [TestMethod]
        public void TestMethod3()
        {
            string beklenen = "Gorkem";
            string gerceklesen = "gorkem";

            Assert.AreEqual(beklenen, gerceklesen, true);
        }

        [TestMethod]
        public void TestMethod4()
        {
            const double beklenmeyen = 0;
            var gerceklesen = Math.Pow(5, 0);

            Assert.AreNotEqual(beklenmeyen, gerceklesen);
        }

        [TestMethod]
        public void TestMethod5()
        {
            var sayilar = new byte[] { 1, 2, 3 };
            var digerSayilar = new byte[] { 1, 2, 3 };

            Assert.AreNotSame(sayilar, digerSayilar);
        }

        [TestMethod]
        public void TestMethod6()
        {
            int a = 1;
            int b = 1;

            Assert.Inconclusive("Bu test yeterli değildir");
        }

        [TestMethod]
        public void TestMethod7()
        {
            var sayi = 5;

            Assert.IsInstanceOfType(sayi, typeof(int));
            Assert.IsNotInstanceOfType(sayi, typeof(decimal));
        }

        [TestMethod]
        public void TestMethod8()
        {
            Assert.IsTrue(10 % 2 == 0);
            Assert.IsFalse(10 % 2 == 1);
        }

        [TestMethod]
        public void TestMethod9()
        {
            List<string> sayilar = new List<string> { "Salih", "Engin", "Ahmet" };

            var cIleBaslayanIlkIsim = sayilar.FirstOrDefault(t => t.StartsWith("C"));
            var sIleBaslayanIlkIsim = sayilar.FirstOrDefault(t => t.StartsWith("S"));

            Assert.IsNull(cIleBaslayanIlkIsim);
            Assert.IsNotNull(sIleBaslayanIlkIsim);
        }

        [TestMethod]
        public void TestMethod10()
        {
            try
            {
                var sayi = 5;
                int sonuc = sayi / 0;
            }
            catch (DivideByZeroException)
            {
                Assert.Fail("Sayı 0'a bölünemediğinden \n test başarısız oldu.");
            }
        }
    }
}