using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Helpers
{
    public class StringHelper
    {
        // Gereksinimler:
        // 1. Baş ve sondaki ekstra boşluklar silinecek.
        // 2. İfade içindeki birden fazla ardışık boşluklar tek boşluk haline getirilecek.
        public static string FazlaBosluklariSil(string ifade)
        {
            // Baş ve sondaki boşlukları temizle
            ifade = ifade.Trim();

            string yeniIfade = string.Empty;

            for (int i = 0; i < ifade.Length; i++)
            {
                if (ifade[i] == ' ' && i + 1 < ifade.Length && ifade[i + 1] == ' ')
                {
                    continue;
                }
                yeniIfade += ifade[i];
            }

            return yeniIfade;
        } 
    }
}