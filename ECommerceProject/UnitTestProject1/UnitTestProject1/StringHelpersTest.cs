using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace UnitTestProject1
{
    [TestClass]
    public class StringHelperTests
    {
        [TestMethod]
        public void BasVeSonExtraBosluklarSilinmeli()
        {
            // Hazırlık (Arrange)
            string girilenIfade = "   Zehra Asel   ";
            string beklenenIfade = "Zehra Asel";

            // Uygulama (Act)
            string gercekIfade = Helpers.StringHelper.FazlaBosluklariSil(girilenIfade);

            // Doğrulama (Assert)
            Assert.AreEqual(beklenenIfade, gercekIfade);
        }

        [TestMethod]
        public void AradakiFazlaBosluklarTekBoslukOlacak()
        {
            // Hazırlık (Arrange)
            string girilenIfade = "Zehra    Asel   Engin    Demiroğ\nAhmet   Sait   Duran";
            string beklenenIfade = "Zehra Asel Engin Demiroğ Ahmet Sait Duran";

            // Uygulama (Act)
            string gercekIfade = Helpers.StringHelper.FazlaBosluklariSil(girilenIfade);

            // Doğrulama (Assert)
            Assert.AreEqual(beklenenIfade, gercekIfade);
        }
    }
}
