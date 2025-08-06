using System;

namespace Prototype
{
    class Program
    {
        static void Main(string[] args)
        {
            Customer customer = new Customer { FirsName = "Zehra Asel", LastName = "Paksoy" };

            var customer1 = (Customer)customer.Clone();
            customer1.FirsName = "Zeynep";

            Console.WriteLine(customer.FirsName);
            Console.WriteLine(customer1.FirsName);

            Console.ReadLine();

        }
    }
    public abstract class Person
    {
        public abstract Person Clone();
        public int Id { get; set; }
        public string FirsName { get; set; }
        public string LastName { get; set; }
    }
    public class Customer : Person
    {
        public string City { get; set; }

        public override Person Clone()
        {
            return (Person)MemberwiseClone();
        }
    }
    public class Employee : Person
    {
        public decimal Salary { get; set; }

        public override Person Clone()
        {
            return (Person)MemberwiseClone();
        }
    }
}
