using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dictionary
{
    class Program
    {
        static void Main(string[] args)
        {
            Dictionary<string, string> dictionary = new Dictionary<string,string>();
            dictionary.Add("BOOK", "KİTAP");
            dictionary.Add("TABLE", "TABLO");
            dictionary.Add("COMPUTER", "BİLGİSAYAR");
            Console.Write(dictionary["TABLE"]);
            foreach (var item in dictionary)
            {
                Console.WriteLine(item.Value);
            }
           
            Console.WriteLine(dictionary.ContainsKey("glass"));
            Console.WriteLine(dictionary.ContainsKey("TABLE"));

            Console.ReadLine();
        }
     }
      
}
