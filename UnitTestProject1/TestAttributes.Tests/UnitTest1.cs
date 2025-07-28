using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Threading;

namespace TestAttributes.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        [Ignore]
        [Owner("Görkem")]
        [TestCategory("Tester")]
        [Priority(1)]
        [TestProperty("Güncelleyen", "Görkem")]
        [TestProperty("Güncelleyen-2", "Engin")]
        public void TestMethod1()
        {
            Assert.AreEqual(1, 1);
        }

        [TestMethod]
        [TestCategory("Developer")]
        [Priority(2)]
        [TestProperty("Güncelleyen", "Salih")]
        [Timeout(2000)]
        [Description("Bu test iki sayının eşitliğini kontrol eder.")]
        public void TestMethod2()
        {
            Thread.Sleep(1500);
            Assert.AreEqual(1, 1);
        }

        [TestMethod]
        public void TestMethod3()
        {
            Assert.AreEqual(1, 1);
        }

        [TestMethod]
        [Ignore]
        public void TestMethod4()
        {
            Assert.AreEqual(1, 1);
        }

        [TestMethod]
        public void TestMethod5()
        {
            Assert.AreEqual(1, 1);
        }
    }
}