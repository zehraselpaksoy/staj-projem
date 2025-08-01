using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Proxy
{
    class Program
    {
        static void Main(string[] args)
        {
            CreditBase manager = new CrediManagerProxy();
            Console.WriteLine(manager.Calcute());
            Console.WriteLine(manager.Calcute());

            Console.ReadLine();

        }
    }
    abstract class CreditBase
    {
        public abstract int Calcute();
    }
    class CreditManager : CreditBase
    {
        public override int Calcute()
        {
            int result = 1;
            for (int i = 1; i < 5; i++)
            {
                result *= i;
                Thread.Sleep(1000);
            }
            return result;
        }
    }
    class CrediManagerProxy : CreditBase
    {
        private CreditManager _creditManager;
        private int _cachedValue;
        public override int Calcute()
        {
            if (_creditManager ==null)
            {
                _creditManager = new CreditManager();
                _cachedValue = _creditManager.Calcute();
            }
            return _cachedValue;
        }
    }
}

    
