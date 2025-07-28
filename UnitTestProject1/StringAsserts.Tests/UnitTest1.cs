using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Text.RegularExpressions;

namespace StringAsserts.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void StringContainsTest()
        {
            StringAssert.Contains("Welcome to TestWorld!", "ome");
        }

        [TestMethod]
        public void StringMatches_test()
        {
            StringAssert.Matches("Welcome to TestWorld!", new Regex(@"[a-zA-Z]"));
            StringAssert.DoesNotMatch("Welcome to TestWorld!", new Regex(@"[0-9]"));
        }

        [TestMethod]
        public void StartsWith_test()
        {
            StringAssert.StartsWith("Welcome to TestWorld!", "Welc");
        }

        [TestMethod]
        public void EndsWith_test()
        {
            StringAssert.EndsWith("Welcome to TestWorld!", "orld!");
        }
    }
}