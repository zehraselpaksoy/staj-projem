using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    class Customer
    {
        //Field
       public string _firstName;

        //property
        public int Id { get; set; }
        public string FirstNme { get { return _firstName; } set { _firstName = value; } }
        public string LastName   { get; set; }
        public string City { get; set; }


    }
}
