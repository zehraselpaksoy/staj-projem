using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    class Program
    {
        static void Main(string[] args)
        {
            //InterfacesIntro();
            //Demo();
            ICustomerDal[] customerDals = new ICustomerDal[3] {
            new SqlCustomerDal(),
            new OracleCustomerDal(),
            new MySqlCustomerDal() };
            foreach (var customerDal in customerDals)
            {
                customerDal.Add();
            }
            Console.ReadLine();
        }

        private static void Demo()
        {
             CustomerManager customerManager = new
                 CustomerManager();
            customerManager.Add(new SqlCustomerDal());
        }

        private static void InterfacesIntro()
        {
            PersonManager personManager = new PersonManager();
            personManager.Add(new Customer { Id = 1, FirstName = "Zehra", LasttName = "Asel", Address = "İstanbul" });
            Student student = new Student() { Id = 2, FirstName = "Ayşe", LasttName = "Nur", Departmant = "Computer Sciences" };
            personManager.Add(student);
        }

        interface IPerson //Temel nesen oluşturup diğer nesnelerin kullanmasını sağlar
        {
            int Id { get; set; }
            String FirstName { get; set; }
            String LasttName { get; set; }
        }
        class Customer : IPerson
        {
            public int Id { get; set; }
            public string FirstName { get; set; }
            public string LasttName { get; set; }
            public string Address { get; set; }
        }
        class Student : IPerson
        {
            public int Id { get; set; }
            public string FirstName { get; set; }
            public string LasttName { get; set; }
            public string Departmant { get; set; }
        }
        class PersonManager
        {
            public void Add(IPerson person)
            {
                Console.WriteLine(person.FirstName);
            }
        }
    }
}
