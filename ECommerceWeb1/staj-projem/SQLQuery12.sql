-- Union | Union All
-- Birden fazla select sorgusu sonucunu tek seferde alt alta g�stermemizi sa�lar.

Select Adi, SoyAdi from Personeller

Select Adi, SoyAdi from Personeller


Select Adi, SoyAdi from Personeller



Select SevkAdi, SevkAdresi from Satislar

-- Joinler yan yana, Union alt alta tablolar� birle�tirir. Joinlerde belirli (ili�kisel) bir kolon �zerinden birle�tirme yap�l�rken,
-- Union'da b�yle bir durum yoktur.

-- With Rollup

-- Group By ile  gruplanm�� veri k�mesinde ara toplam al�nmas�n� sa�lar
 

Select SatisID, UrunID, SUM(Miktar) from [Satis Detaylari]

Group By SatisID, UrunID With Rollup

Select KategoriID, UrunID, SUM (TedarikciID) from Urunler Group By KategoriID, UrunID With Rollup

-- [Having �art�yla birlikte,With Rollup, ]

Select SatisID, UrunID, SUM(Miktar) from [Satis Detaylari] Group By SatisID, UrunID With Rollup Having SUM(Miktar) > 100

--With Cube

--Group By  ile  gruplanm�� veri k�mesinde teker teker toplam al�nmas�n� sa�lar
 

Select SatisID, UrunID, SUM(Miktar) from [Satis Detaylari]

Group By SatisID, UrunID With Cube

Select KategoriID, UrunID, SUM (TedarikciID) from Urunler Group By KategoriID, UrunID With Cube

-- Having �art�yla birlikte,With Cube,

Select SatisID, UrunID, SUM(Miktar) from [Satis Detaylari] Group By SatisID, UrunID With Cube Having SUM(Miktar) > 100

Select UrunID, BirimFiyati from Urunler

select 
UrunID,
case
When BirimFiyati > 0 and BirimFiyati < 50 Then '�in Mal�'
When BirimFiyati between 50 and 100 Then 'Ucuz'
When BirimFiyati between 100 and 200 Then 'Normal'
When BirimFiyati > 200 Then 'Pahal�'
else
'Belirsiz'
end
from Urunler

-- with ties 
select top 6* from [Satis Detaylari] order by SatisID

--with komutu

with PersonelSatis(id,adi,soyadi,satisid)
as(
select p.PersonelID,Adi,SoyAdi,SatisID from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID
)
select * from PersonelSatis ps inner join [Satis Detaylari]	sd on ps.satisid=sd.SatisID