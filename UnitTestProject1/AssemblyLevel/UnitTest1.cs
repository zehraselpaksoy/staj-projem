using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Diagnostics;

namespace AssemblyLevel
{
    [TestClass]
    public class UnitTest1
    {
        [AssemblyInitialize]
        public static void AssemblyInitialize(TestContext testContext)
        {
            Debug.WriteLine("Runnig AssemblyInitialize");
        }

        [AssemblyCleanup]
        public static void AssemblyCleanup()
        {
            Debug.WriteLine("Runnig AssemblyCleanup");
        }

        [ClassInitialize]
        public static void ClassInitialize(TestContext testContext)
        {
            Debug.WriteLine("Runnig UnitTest1 ClassInitialize");
        }

        [ClassCleanup]
        public static void ClassCleanup()
        {
            Debug.WriteLine("Runnig UnitTest1 ClassCleanup");
        }

        [TestInitialize]
        public void TestInitialize()
        {
            Debug.WriteLine("Runnig UnitTest1 TestInitialize");
        }

        [TestCleanup]
        public void TestCleanup()
        {
            Debug.WriteLine("Runnig UnitTest1 TestCleanup");
        }

        [TestMethod]
        public void TestMethod1()
        {
            Debug.WriteLine("Runnig UnitTest1 TestMethod1");
        }

        [TestMethod]
        public void TestMethod2()
        {
            Debug.WriteLine("Runnig UnitTest1 TestMethod2");
        }
    }
}