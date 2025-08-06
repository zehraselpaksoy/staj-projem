using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Composite
{
    class Program
    {
        static void Main(string[] args)
        {
            Employee zehra = new Employee { Name = "zehra" };
            Employee asel = new Employee { Name = "asel" };
            zehra.AddSubordinate(asel);
            Employee zeynep = new Employee { Name = "zeynep" };
            zehra.AddSubordinate(zeynep);
            Contractor yagmur = new Contractor { Name = "Yağmur" };
            zeynep.AddSubordinate(yagmur);
            Employee ayse = new Employee { Name = "Ayşe" };
            asel.AddSubordinate(ayse);
            Console.WriteLine(zehra.Name);
            foreach (Employee manager in zehra)
            {
                Console.WriteLine("  {0}",manager.Name);
                foreach (IPerson employee in manager)
                {
                    Console.WriteLine("    {0}", employee.Name);
                }
            }
            Console.ReadLine();
        }
    }
    interface IPerson
    {
        string Name { get; set; }

    }
    class Contractor : IPerson
    {
        public string Name { get; set ; }
    }
    class Employee : IPerson,IEnumerable<IPerson>
    {
        List<IPerson> _subordinates = new List<IPerson>();

        public void AddSubordinate(IPerson person)
        {
            _subordinates.Add(person);
        }
        public void RemoveSubordinate(IPerson person)
        {
            _subordinates.Remove(person);
        }
        public IPerson GetSubordinate(int index)
        {
            return _subordinates[index];
        }
        public string Name { get ; set ; }

        public IEnumerator<IPerson> GetEnumerator()
        {
            foreach (var subordinate in _subordinates)
            {
                yield return subordinate;
            }
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
    }
}
