using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Bridge
{
    class Program
    {
        static void Main(string[] args)
        {
            CustomerManager customerManager = new CustomerManager();
            customerManager.senderrBase = new EMailSender();
            customerManager.UpdateCustomer();
            Console.ReadLine();
        }
    }
    abstract class MessageSenderrBase
    {
        public void Save()
        {
            Console.WriteLine("Message saved !");
        }
        public abstract void Send(Body body);
    }

    class Body
    {
        public string Title { get; set; }
        public string Text { get; set; }
    }

    class SmsSender : MessageSenderrBase
    {
        public override void Send(Body body)
        {
            Console.WriteLine("{0} was sent via SmsSender",body.Title);
        }
    }
    class EMailSender : MessageSenderrBase
    {
        public override void Send(Body body)
        {
            Console.WriteLine("{0} was sent via EmailSender", body.Title);

        }
    }

    class CustomerManager
    {
        public MessageSenderrBase senderrBase { get; set; }
        public  void UpdateCustomer()
        {
            senderrBase.Send(new Body { Title = "About the course!" });
            Console.WriteLine("Customer updated");

        }
    }
}
