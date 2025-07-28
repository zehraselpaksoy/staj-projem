using System;

namespace Singleton
{
    class Program
    {
        static void Main(string[] args)
        {
            var customerManager = CutomerManager.CreateAsSingleton();
            customerManager.Save();
        }
    }
    class CutomerManager
    {
        private static CutomerManager _customerManager;
        static object _lockObject = new object();
        private CutomerManager()
        {
        }
        public static CutomerManager CreateAsSingleton()
        {
            lock (_lockObject)
            {
                if (_customerManager == null)
                {
                    _customerManager = new CutomerManager();
                }
            }
            return _customerManager;
        }
        public void Save()
        {
            Console.WriteLine("Saved !");
        }
    }
}
