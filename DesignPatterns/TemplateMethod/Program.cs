using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TemplateMethod
{
    class Program
    {
        static void Main(string[] args)
        {
            // Her algoritmadan bir örnek oluşturuluyor
            ScoringAlgorithm mens = new MensScoringAlgorithm();
            ScoringAlgorithm womens = new WomensScoringAlgorithm();
            ScoringAlgorithm children = new ChildrenScoringAlgorithm();

            int hits = 10;
            TimeSpan time = TimeSpan.FromSeconds(30);

            Console.WriteLine(" Mens Score: " + mens.GenerateScore(hits, time));       // Beklenen: 1000 - 6 = 994
            Console.WriteLine(" Womens Score: " + womens.GenerateScore(hits, time));   // Beklenen: 1000 - 10 = 990
            Console.WriteLine(" Children Score: " + children.GenerateScore(hits, time)); // Beklenen: 800 - 15 = 785

            Console.ReadLine(); 
        }
    }
    abstract class ScoringAlgorithm
    {
        public int GenerateScore(int hits, TimeSpan time)
        {
            int score = CalculateBaseScore(hits);
            int reduction = CalculateReduction(time);
            return CalculateOverallScore(score, reduction);
        }

        public abstract int CalculateOverallScore(int score, int reduction);
        public abstract int CalculateReduction(TimeSpan time);
        public abstract int CalculateBaseScore(int hits);
    }
    class MensScoringAlgorithm : ScoringAlgorithm
    {
        public override int CalculateOverallScore(int score, int reduction)
        {
            return score - reduction;  // Eksik return tamamlandı
        }

        public override int CalculateReduction(TimeSpan time)
        {
            return (int)time.TotalSeconds / 5;  // Zaman arttıkça puan azalır
        }

        public override int CalculateBaseScore(int hits)
        {
            return hits * 100;  // Her isabet 100 puan
        }
    }
    class ChildrenScoringAlgorithm : ScoringAlgorithm
    {
        public override int CalculateOverallScore(int score, int reduction)
        {
            return score - reduction; // Hatalı olan "score reduction;" yerine düzeltildi
        }

        public override int CalculateReduction(TimeSpan time)
        {
            return (int)time.TotalSeconds / 2; // Zaman arttıkça daha fazla puan düşer (hassas değerlendirme)
        }

        public override int CalculateBaseScore(int hits)
        {
            return hits * 80; // Çocuklar için her isabet 80 puan değerinde
        }
    }
    class WomensScoringAlgorithm : ScoringAlgorithm
    {
        public override int CalculateOverallScore(int score, int reduction)
        {
            return score - reduction;  // ✔ Doğru: puandan ceza çıkarılıyor
        }

        public override int CalculateReduction(TimeSpan time)
        {
            return (int)time.TotalSeconds / 3;  // ✔ Kadınlar için ceza daha az (3 saniyede 1 puan)
        }

        public override int CalculateBaseScore(int hits)
        {
            return hits * 100;  // ✔ Her isabet 100 puan
        }
    }

}
