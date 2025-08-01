using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Loops
{
    class Program
    {
        static void Main(string[] args)
        {
            ForLoop1();
            ForLoop2();
            WhileLoop();
            DoWhileLoop();
            ForEachLoop();
            if (IsPrimeNumber(6))
            {
                Console.WriteLine("This is a prime number");
            }
            else
            {
                Console.WriteLine("This is not a prime number");
            }

                Console.ReadLine();
        }
        private static bool IsPrimeNumber (int number) {
            bool asalMi = true;
            for (int i = 2; i < number-1; i++)
            {
                if (number%i==0)
                {
                    asalMi = false;
                    i = number; 
                }
                
            }
            return asalMi;
        }
        private static void ForEachLoop()
        {
            string[] students = new string[3] { "zehra", "asel", "ayşe" };
            foreach (var student in students)
            {
                Console.WriteLine(student);
            }
        }

        private static void DoWhileLoop()
        {
            int number = 13;
            do
            {
                Console.WriteLine(number);
                number--;
            } while (number >= 110);
        }

        private static void WhileLoop()
        {
            int number = 100;

            while (number >= 0)
            {
                Console.WriteLine(number);
                number--;
            }
            Console.WriteLine("Now number is {0} ", number);
        }

        private static void ForLoop2()
        {
            Console.WriteLine("1'den 100'e kadar tek sayılar!!");
            for (int i = 1; i <= 100; i += 2)
            {
                Console.WriteLine(i);
            }
            Console.WriteLine("Finished!!");
        }

        private static void ForLoop1()
        {
            Console.WriteLine("1'den 100'e kadar sayılar!!");
            for (int i = 1; i <= 100; i++)
            {
                Console.WriteLine(i);
            }
            Console.WriteLine("Finished!!");
        }
    }
}
