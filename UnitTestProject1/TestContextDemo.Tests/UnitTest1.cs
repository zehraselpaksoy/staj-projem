using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace TestContextDemo.Tests
{
    [TestClass]
    public class UnitTest1
    {
        public TestContext TestContext { get; set; }

        [TestInitialize]
        public void TestInitialize()
        {
            TestContext.WriteLine("Test adı: {0}", TestContext.TestName);
            TestContext.WriteLine("Test durumu: {0}", TestContext.CurrentTestOutcome);
            TestContext.Properties["bilgi"] = "Bu bir ekstra bilgidir.";
        }

        [TestCleanup]
        public void TestCleanup()
        {
            TestContext.WriteLine("Test adı: {0}", TestContext.TestName);
            TestContext.WriteLine("Test durumu: {0}", TestContext.CurrentTestOutcome);
            TestContext.WriteLine("Test bilgi: {0}", TestContext.Properties["bilgi"]);
        }

        [TestMethod]
        public void TestMethod1()
        {
            TestContext.WriteLine("Test adı: {0} çalıştı", TestContext.TestName);
        }
    }
}