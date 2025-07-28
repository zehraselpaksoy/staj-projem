using System;
using System.Collections.Generic;
using System.Linq;

namespace TestFirstDemo
{
    public class Gruplayici
    {
        private int _grupSayisi;

        public Gruplayici(int grupSayisi)
        {
            this._grupSayisi = grupSayisi;
        }

        public List<List<Olcum>> Grupla(List<Olcum> olcumler)
        {
            var gruplar = new List<List<Olcum>>();

            for (int i = 0; i < olcumler.Count;)
            {
                var grup = olcumler.Skip(i).Take(_grupSayisi).ToList();
                gruplar.Add(grup);
                i += _grupSayisi;
            }

            return gruplar;
        }
    }
}