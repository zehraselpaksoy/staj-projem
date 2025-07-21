using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Arrays
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] students =new string[3];
            students[0] = "zehra";
            students[1] = "asel";
            students[0] = "ayşe";


            string[] students2 = { "zehra" , "asel","ayşe"};

            string[] students3 = new string[3] { "zehra", "asel", "ayşe" };

            foreach (var student in students)
            {
                Console.WriteLine(student);
            }

            foreach (var student in students2)
            {
                Console.WriteLine(student);
            }

            foreach (var student in students3)
            {
                Console.WriteLine(student);
            }

            //string[,] regions = new string[7, 3];
            string[,] regions = new string[5, 3] { 
                {"İstanbul","İzmir","Balıkesir" },
                { "Ankara","Konya","Kırıkkale"},
                {"Antalya","Adana","Mersin" },
                {"Rize","Trobzaon","Samsun" },
                {"İzmir","Muğla","Manisa" }               
            };
            for (int i = 0; i <= regions.GetUpperBound(0); i++)//SATIR
            {
                for (int j = 0; j <= regions.GetUpperBound(1); j++)
                {
                    Console.WriteLine(regions[i, j]);
                }
                Console.WriteLine("********************");
            }

            Console.WriteLine();
            Console.ReadLine();
        }
    }
}
