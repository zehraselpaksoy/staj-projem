use Northwind
-- Inner Join
-- Genel mant�k
-- select * from tablo1 Inner Join tablo2 on Tablo1.IliskiliKolon = Tablo2.IliskiliKolon
-- select * from tablo1 t1 Inner Join tablo2 t2 on t1.IliskiliKolon = t2.IliskiliKolon 
-- �ki tabloyu birle�tirme

-- Hangi personel hangi sat��lar� yapm��t�r (Personeller Satislar)
select * from Personeller p Inner Join Satislar s on p.PersonelID = s.PersonelID

--Hangi �r�n hangi kategoride (Urunler kategoriler)
select u.UrunAdi ,k.KategoriAdi from Urunler u Inner Join Kategoriler k on u.KategoriID = k.KategoriID

-- where komutu kullan�m�
-- Beveregas kategorisindeki �r�nlerim (�r�nler kateg�ri)
select u.UrunAdi from Kategoriler k Inner Join Urunler u on k.KategoriID = u.KategoriID 
    where k.KategoriAdi='Beveregas'

-- Beveregas kategorisindeki �r�nlerimin say�s� ka�t�r (�r�nler kateg�ri)
select COUNT(u.UrunAdi) from Kategoriler k Inner Join Urunler u on k.KategoriID = u.KategoriID 

-- Seafood kategorisindeki �r�nlerin listesi (�r�nler kateg�ri)
select u.UrunAdi from Kategoriler k Inner Join Urunler u on k.KategoriID=u.KategoriID where k.KategoriAdi='Seafood'


-- Hangi sat��� hangi personel yapm��t�r (Personeller Satislar)

-- Faks numaras� "Null" olmayan tedarik�ilerden al�nm�� �r�nler nereldir (Urunler Tedarikci)
select * from Urunler u Inner Join Tedarikciler t on u.TedarikciID=t.TedarikciID where t.Faks <> 'Null'
select * from Urunler u Inner Join Tedarikciler t on u.TedarikciID=t.TedarikciID where t.Faks is not null

-- �kiden fazla tabloyu birle�tirme 
-- 1997 y�l�ndan sonra Nancy nin sat��  yapt��� firmalar�n isimleri :(1997 dahil)(Musteriler ,Satislar,Personeller)

-- Limited olan tedarik�ilerden  al�nm�� seafood kategorisindeki �r�nlerimin toplam sat�� tutar�.(Urunler ,Kategoriler,Tedarikciler )
select SUM(u.HedefStokDuzeyi*u.BirimFiyati) from Urunler u inner join Tedarikciler t on u.TedarikciID=t.TedarikciID 
inner join Kategoriler k on u.KategoriID = k.KategoriID 
where  t.SirketAdi like '%ltd.%' and k.KategoriAdi='Seafood' 

-- Ayn� tabloyu ili�kisel olrak birle�tirme 
-- Personellerimin ba�l� olarak �al��t��� ki�ileri listele

-- Inner Jo�n ve Group By
-- Hangi personelim (ad� ve soyad� ile birlikte), toplam ka� adetlik sat�� yapm��.
-- Sat�� adedi 100 den fazla olanlar gelsin, personelin ad�n�n ba� harfi M olan kay�tlar gelsin ?
	
select p.Adi,' ',p.SoyAdi,Count(s.SatisID) from Personeller p
inner join Satislar s on p.PersonelID=s.PersonelID 
where p.Adi like 'M%' group by p.Adi,' ' ,p.SoyAdi
having Count(s.SatisID) > 100

-- Seafood kategorisindeki �r�nlerin say�s� ka�t�r(Urunler,Kategoriler)
	
select k.KategoriAdi ,COUNT(u.UrunAdi) from Urunler u inner join Kategoriler k on u.KategoriID = k.KategoriID
where k.KategoriAdi = 'Seafood' Group By k.KategoriAdi

-- Hangi personelim toplam ka� adet sat�� yapm�� (personeller satislar)
select p.Adi ,COUNT(s.SatisID)  from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID 
GROUP BY p.Adi

-- En �ok sat�� yapan personelim?
	
select top 1 p.Adi,Count(s.SatisID) from Personeller  p inner join Satislar  s on p.PersonelID=s.PersonelID 
group by p.Adi order by Count(s.SatisID) desc

-- Ad�nda �a� harfi olan personellerin sat�� id si 10500 den b�y�k olan sat��lar�n�n toplam tutar�n�(miktar * birimfiyat) ve 
-- bu sat��lar�n hangi tarihte ger�ekle�ti�ini listele.
	
select SUM(sd.Miktar*sd.BirimFiyati),s.SatisTarihi from Personeller  p inner join Satislar  s on p.PersonelID=s.PersonelID inner join [Satis Detaylari]  sd on s.SatisID=sd.SatisID where s.SatisID > 10500 and p.Adi like '%a%' group   by s.SatisTarihi


