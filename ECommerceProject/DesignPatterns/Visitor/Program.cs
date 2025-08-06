using System;
using System.Collections.Generic;

namespace Visitor
{
    class Program
    {
        static void Main(string[] args)
        {
            // Çalışanları tanımla
            Manager engin = new Manager { Name = "Engin", Salary = 1000 };
            Manager salih = new Manager { Name = "Salih", Salary = 900 };
            Worker deep = new Worker { Name = "Deep", Salary = 800 };
            Worker ali = new Worker { Name = "Ali", Salary = 800 };

            // Organizasyon hiyerarşisini kur
            engin.Subordinates.Add(salih);
            engin.Subordinates.Add(deep);
            salih.Subordinates.Add(ali);

            // Organizasyon yapısını oluştur
            OrganisationalStructure organisationalStructure = new OrganisationalStructure(engin);

            // Ziyaretçileri oluştur
            PayrollVisitor payrollVisitor = new PayrollVisitor();
            Payrise payrise = new Payrise();

            // Ziyaretçileri uygula
            organisationalStructure.Accept(payrollVisitor);
            organisationalStructure.Accept(payrise);

            Console.ReadLine();
        }
    }

    class OrganisationalStructure
    {
        public EmployeeBase Employee;

        public OrganisationalStructure(EmployeeBase firstEmployee)
        {
            Employee = firstEmployee;
        }

        public void Accept(VisitorBase visitorBase)
        {
            Employee.Accept(visitorBase);
        }
    }

    // Visitor Base Class
    abstract class VisitorBase
    {
        public abstract void Visit(Manager manager);
        public abstract void Visit(Worker worker);
    }

    // Element Base Class (Employee)
    abstract class EmployeeBase
    {
        public string Name { get; set; }
        public decimal Salary { get; set; }

        public abstract void Accept(VisitorBase visitor);
    }

    // Concrete Element - Manager
    class Manager : EmployeeBase
    {
        public Manager()
        {
            Subordinates = new List<EmployeeBase>();
        }

        public List<EmployeeBase> Subordinates { get; set; }

        public override void Accept(VisitorBase visitor)
        {
            visitor.Visit(this);

            foreach (var employee in Subordinates)
            {
                employee.Accept(visitor);
            }
        }
    }

    // Concrete Element - Worker
    class Worker : EmployeeBase
    {
        public override void Accept(VisitorBase visitor)
        {
            visitor.Visit(this);
        }
    }

    // Concrete Visitor - Payroll
    class PayrollVisitor : VisitorBase
    {
        public override void Visit(Worker worker)
        {
            Console.WriteLine("{0} paid {1}", worker.Name, worker.Salary);
        }

        public override void Visit(Manager manager)
        {
            Console.WriteLine("{0} paid {1}", manager.Name, manager.Salary);
        }
    }

    // Concrete Visitor - Payrise
    class Payrise : VisitorBase
    {
        public override void Visit(Worker worker)
        {
            Console.WriteLine("{0} salary increased to {1}", worker.Name, worker.Salary * 1.1m);
        }

        public override void Visit(Manager manager)
        {
            Console.WriteLine("{0} salary increased to {1}", manager.Name, manager.Salary * 1.2m);
        }
    }
}
