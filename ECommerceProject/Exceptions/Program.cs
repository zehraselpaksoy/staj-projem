using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Exceptions
{
    class Program
    {
        static void Main(string[] args)
        {
            // ExceptionIntro();
            try
            {
                Find();
            }
            catch (RecordNotFoundException e)
            {
                Console.WriteLine(e.Message);
            }



            Console.ReadLine();

            HandleException(() => {
                Find();
            });
            Console.ReadLine();
        }

        private static void HandleException(Action action)
        {

            try
            {
                action.Invoke();
            }
            catch (Exception e)
            {
            }
        }

        private static void Find()
        {
            List<string> students = new List<string> { "engin", "zehra", "asel" };
            if (!students.Contains("Ahmet"))
            {
                throw new RecordNotFoundException ( "Record  Not Found" );
            }
            else
            {
                Console.WriteLine("Record Found !");
            }
        }

        private static void ExceptionIntro()
        {
            try
            {
                string[] student = new string[3] { "engin", "zehra", "asel" };
                student[3] = "zeynep";
            }
            catch (Exception exception)
            {

                Console.WriteLine(exception.Message);
            }

        }
    }
}
