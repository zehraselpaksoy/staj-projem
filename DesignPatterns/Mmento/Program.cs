using System;

namespace MementoPattern
{
    class Program
    {
        static void Main(string[] args)
        {
            Book book = new Book();
            book.Title = "Yüzüklerin Efendisi";
            book.Author = "J.R.R. Tolkien";
            book.Isbn = "123456";

            // Memento nesnesini saklıyoruz
            CareTaker careTaker = new CareTaker();
            careTaker.Memento = book.CreateUndo();

            // Güncelleme yapıyoruz
            book.Title = "Silmarillion";
            book.Author = "Tolkien";

            Console.WriteLine("Değiştirildikten sonra:");
            book.ShowBook();

            // Geri alma
            book.RestoreFromUndo(careTaker.Memento);

            Console.WriteLine("Geri alındıktan sonra:");
            book.ShowBook();

            Console.ReadLine();
        }
    }

    class Book
    {
        private string _title;
        private string _author;
        private string _isbn;
        private DateTime _lastEdited;

        public string Title
        {
            get { return _title; }
            set { _title = value; SetLastEdited(); }
        }

        public string Author
        {
            get { return _author; }
            set { _author = value; SetLastEdited(); }
        }

        public string Isbn
        {
            get { return _isbn; }
            set { _isbn = value; SetLastEdited(); }
        }

        private void SetLastEdited()
        {
            _lastEdited = DateTime.UtcNow;
        }

        public Memento CreateUndo()
        {
            return new Memento(_title, _author, _isbn, _lastEdited);
        }

        public void RestoreFromUndo(Memento memento)
        {
            _title = memento.Title;
            _author = memento.Author;
            _isbn = memento.Isbn;
            _lastEdited = memento.LastEdited;
        }

        public void ShowBook()
        {
            Console.WriteLine("{0}, {1}, {2} - Düzenlenme Tarihi: {3}", _isbn, _title, _author, _lastEdited);
        }
    }

    class Memento
    {
        public string Title { get; }
        public string Author { get; }
        public string Isbn { get; }
        public DateTime LastEdited { get; }

        public Memento(string title, string author, string isbn, DateTime lastEdited)
        {
            Title = title;
            Author = author;
            Isbn = isbn;
            LastEdited = lastEdited;
        }
    }

    class CareTaker
    {
        public Memento Memento { get; set; }
    }
}
