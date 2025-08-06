using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delegates
{ //Elçi
    public delegate void MyDelegate(); // Dönüş değeri olmayan ve paramaetre almayan operasyonlara elçilik yapıyor

    class Program
    {
        static void Main(string[] args)
        {
            CustomerManager customerManager = new CustomerManager();
            MyDelegate myDelegate = customerManager.SendMessage;//Sadece bunu yaptığımızda çalışmaz daha burası görev verme aşaması

            myDelegate += customerManager.ShowAlert;// Ekleme yapıldığı gibi çıkartmada yapılabilir

            myDelegate -= customerManager.SendMessage;

            myDelegate();// İşte şimdi çalışır çünkü burada görevi icra et demek

            Console.ReadLine();

        }
    }
    public class CustomerManager
    {
        public void SendMessage()
        {
            Console.WriteLine("Hello");
        }
        public void ShowAlert()
        {
            Console.WriteLine("Be careful!");
        }
    }
}
