using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    class Program
    {
        static void Main(string[] args)
        {
            CustomerManager customerManager = new CustomerManager();
            customerManager.Add();
            customerManager.Update();
            ProductManager productManager = new ProductManager();
            productManager.Add();
            productManager.Update();
            Customer customer = new Customer();
            customer.Id = 1;
            customer.FirstNme = "Zehra";
            customer.LastName = "Paksoy";
            customer.City = "Kahramanmaraş";
            Customer customer1 = new Customer { Id = 2, City = "İstanbul", FirstNme = "Ayşe", LastName = "Nur" };
            Console.WriteLine(customer1.FirstNme);


            Console.ReadLine();
        }
    }
     
   
}
