﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Strings
{
    class Program
    {
        static void Main(string[] args)
        {
            İntro();
            string sentence ="My name is Zehra";
            var result = sentence.Length;
            var result2 = sentence.Clone();
            sentence = "My name is Asel";
            bool result3 = sentence.EndsWith("ğ");
            bool result4 = sentence.EndsWith("My name");
            var result5 = sentence.IndexOf("name");
            var result6 = sentence.IndexOf(" ");
            var result7 = sentence.LastIndexOf("");
            var result8 = sentence.Insert(0, " hello,");
            var result9 = sentence.Substring(3,4);//3.karakterden itibaren 4 tane al
            var result10 = sentence.ToLower();
            var result11 = sentence.ToUpper();
            var result12 = sentence.Replace( " ", " he,");
            var result13 = sentence.Remove(2,4);
            Console.WriteLine(result);
            Console.WriteLine(result2);
            Console.WriteLine(result3);
            Console.WriteLine(result4);
            Console.WriteLine(result5);
            Console.WriteLine(result6);
            Console.WriteLine(result7);
            Console.WriteLine(result8);
            Console.WriteLine(result9);
            Console.WriteLine(result10);
            Console.WriteLine(result11);

            Console.WriteLine(result12);
            Console.WriteLine(result13);
            Console.ReadLine();

        }

        private static void İntro()
        {
            string city = "Ankara";
            //Console.WriteLine(city[0]);
            foreach (var item in city)
            {
                Console.WriteLine(item);
            }
            string city2 = "Ankara";
            string result = city + city2;
            Console.WriteLine(result);
           
        }
    }
}
