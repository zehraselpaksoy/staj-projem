using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Methods
{
    class Program
    {
        static void Main(string[] args)
        {
            Add();
            Console.WriteLine(Add3(50));
            Console.WriteLine(Add2(50, 30));
            int number1 = 20;
            int number2 = 100;
            int result1 = Add4(ref number1, number2);// out: aynı ref gibidir ama refde başlangıçta atanan değeri outta atamak zorunda değiliz.
            Console.WriteLine(result1);
            Console.WriteLine(number1);
            Console.WriteLine(Multiply(5,3));
            Console.WriteLine(Multiply(5, 3,2));
            Console.WriteLine(Add5(1,5,5,7,8,9,2));
            Console.ReadLine();
        }
        static void Add()
        {
            Console.WriteLine("Added!!");
        }
        static int Add2(int number1, int number2)
        {
            int result = number1 + number2;
            return result;

        }
        static int Add3(int number1, int number2 = 25)//Default  parametreli yani eğer parametrenin değeri atanmazsa atanan değeri kullan ve hep en sondaki default değer atanmalıdır
        {
            int result = number1 + number2;
            return result;

        }
        //static int Add4(int number1, int number2) {
        //    number1 = 30;
        //    int result = number1 + number2;
        //    return result;

        //}

        static int Add4(ref int number1, int number2)
        {
            number1 = 30;
            int result = number1 + number2;
            return result;

        }

        //******** OVERLOAD ************************
        static int Multiply(int number1, int number2)
        {
            int result = number1 * number2;
            return result;

        }
        static int Multiply(int number1, int number2,int number3)
        {
            int result = number1 * number2*number3;
            return result;

        }

        //******** PARAMS ************************
        static int Add5(params int[]  numbers)//Aynı tipte birden çok gönderilern değerleri tutup işlem payapar.
        {
            return numbers.Sum();

        }


    }
}
