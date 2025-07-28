using System;
using System.Collections.Generic;

namespace Mediator
{
    class Program
    {
        static void Main(string[] args)
        {
            Mediator mediator = new Mediator();

            Teacher engin = new Teacher(mediator);
            engin.Name = "Engin";

            mediator.Teacher = engin;

            Student derin = new Student(mediator);
            derin.Name = "Derin";

            Student salih = new Student(mediator);
            salih.Name = "Salih";

            mediator.Students = new List<Student> { derin, salih };

            // Öğretmen slayt değiştiriyor
            engin.SendNewImageUrl("slide1.jpg");

            // Öğrenci soru soruyor
            salih.SendQuestion("Is it true?");

            // Öğretmen cevabı Mediator üzerinden gönderiyor
            engin.AnswerQuestion("Yes, it is true.", salih);

            Console.ReadLine();
        }
    }

    abstract class CourseMember
    {
        protected Mediator _mediator;

        public string Name { get; set; }

        protected CourseMember(Mediator mediator)
        {
            _mediator = mediator;
        }
    }

    class Teacher : CourseMember
    {
        public Teacher(Mediator mediator) : base(mediator)
        {
        }

        public void ReceiveQuestion(string question, Student student)
        {
            Console.WriteLine($"Teacher received a question from {student.Name}: {question}");
        }

        public void SendNewImageUrl(string url)
        {
            Console.WriteLine("Teacher changed slide: {0}", url);
            _mediator.UpdateImage(url);
        }

        public void AnswerQuestion(string answer, Student student)
        {
            Console.WriteLine("Teacher answered question from {0}: {1}", student.Name, answer);
            _mediator.SendAnswer(answer, student);
        }
    }

    class Student : CourseMember
    {
        public Student(Mediator mediator) : base(mediator)
        {
        }

        public void ReceiveImage(string url)
        {
            Console.WriteLine($"{Name} received image: {url}");
        }

        public void SendQuestion(string question)
        {
            _mediator.SendQuestion(question, this);
        }

        public void ReceiveAnswer(string answer)
        {
            Console.WriteLine($"{Name} received answer: {answer}");
        }
    }

    class Mediator
    {
        public Teacher Teacher { get; set; }
        public List<Student> Students { get; set; } = new List<Student>();

        public void UpdateImage(string url)
        {
            foreach (var student in Students)
            {
                student.ReceiveImage(url);
            }
        }

        public void SendQuestion(string question, Student student)
        {
            Teacher.ReceiveQuestion(question, student);
        }

        public void SendAnswer(string answer, Student student)
        {
            student.ReceiveAnswer(answer);
        }
    }
}
