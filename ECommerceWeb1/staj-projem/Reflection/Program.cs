using System;
using System.Reflection;

namespace Reflection
{
    class Program
    {
        static void Main(string[] args)
        {
            //Dortİslem dortİslem = new Dortİslem(2, 3);
            //Console.WriteLine(dortİslem.Topla1());
            //Console.WriteLine(dortİslem.Topla(3,4));

            var tip = typeof(Dortİslem);
            //Dortİslem dortİslem = (Dortİslem)Activator.CreateInstance(tip, 6, 7);
            //Console.WriteLine(dortİslem.Topla(4, 5));
            //Console.WriteLine(dortİslem.Topla1());
            //Bu şekilde gelen tipe göre çalışma zamanında direkt çalıştırı ama gerekmedikçe kullanılmamalıdır.

            var instance = Activator.CreateInstance(tip, 6, 5);
            MethodInfo methodInfo = instance.GetType().GetMethod("Topla1");
            Console.WriteLine(methodInfo.Invoke(instance, null));

            Console.WriteLine("********************************");
            var metotlar = tip.GetMethods();
            foreach (var info in metotlar)
            {
                Console.WriteLine("method adı : {0}", info.Name);
                foreach (var parametreInfo in info.GetParameters())
                {
                    Console.WriteLine("Paramerte : {0}", parametreInfo.Name);
                }
                foreach (var attribute in info.GetCustomAttributes())
                {
                    Console.WriteLine("Attribute Name : {0}", attribute.GetType().Name);
                }
            }
            Console.ReadLine();

        }
    }
    public class Dortİslem
    {
        private int _sayi1;
        private int _sayi2;
        public int Topla(int sayi1, int sayi2) { return sayi1 + sayi2; }
        public int Carp(int sayi1, int sayi2) { return sayi1 * sayi2; }
        public Dortİslem(int sayi1, int sayi2)
        {
            _sayi1 = sayi1;
            _sayi2 = sayi2;
        }
        public int Topla1() { return _sayi1 + _sayi2; }
        [MetodName("Carpma")]
        public int Carp2() { return _sayi1 * _sayi2; }
    }
    public class MetodNameAttribute : Attribute
    {
        public MetodNameAttribute(string name)
        {
        }
    }
}
