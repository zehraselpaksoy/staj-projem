using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Constructor
{
    class Program
    {
        static void Main(string[] args)
        {
            CustomerManaegr customerManaegr = new CustomerManaegr(10);
            customerManaegr.Add();

            Product product = new Product { Id = 1, Name ="Laptop "};

            Console.ReadLine();
        }
    }
    class CustomerManaegr
    {
        private int _count;
        public CustomerManaegr(int count)
        {
            _count = count;
        }

        public void List()
        {
            Console.WriteLine("Listed !");
        }
        public void Add()
        {
            Console.WriteLine("Added !");
        }

    }
    class Product
    {
        //public Product() { }

        public int Id { get; set; }
        public string Name { get; set; }    
        
          public Product(int id,string name) {
            _id=id;
            _name = name;

        }
        private int _id { get; set; }
        private string _name  { get; set; }
    }
}
