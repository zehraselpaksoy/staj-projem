use Northwind
-- Inner Join
-- Genel mantýk
-- select * from tablo1 Inner Join tablo2 on Tablo1.IliskiliKolon = Tablo2.IliskiliKolon
-- select * from tablo1 t1 Inner Join tablo2 t2 on t1.IliskiliKolon = t2.IliskiliKolon 
-- Ýki tabloyu birleþtirme

-- Hangi personel hangi satýþlarý yapmýþtýr (Personeller Satislar)
select * from Personeller p Inner Join Satislar s on p.PersonelID = s.PersonelID

--Hangi ürün hangi kategoride (Urunler kategoriler)
select u.UrunAdi ,k.KategoriAdi from Urunler u Inner Join Kategoriler k on u.KategoriID = k.KategoriID

-- where komutu kullanýmý
-- Beveregas kategorisindeki ürünlerim (Ürünler kategöri)
select u.UrunAdi from Kategoriler k Inner Join Urunler u on k.KategoriID = u.KategoriID 
    where k.KategoriAdi='Beveregas'

-- Beveregas kategorisindeki ürünlerimin sayýsý kaçtýr (Ürünler kategöri)
select COUNT(u.UrunAdi) from Kategoriler k Inner Join Urunler u on k.KategoriID = u.KategoriID 

-- Seafood kategorisindeki ürünlerin listesi (Ürünler kategöri)
select u.UrunAdi from Kategoriler k Inner Join Urunler u on k.KategoriID=u.KategoriID where k.KategoriAdi='Seafood'


-- Hangi satýþý hangi personel yapmýþtýr (Personeller Satislar)

-- Faks numarasý "Null" olmayan tedarikçilerden alýnmýþ ürünler nereldir (Urunler Tedarikci)
select * from Urunler u Inner Join Tedarikciler t on u.TedarikciID=t.TedarikciID where t.Faks <> 'Null'
select * from Urunler u Inner Join Tedarikciler t on u.TedarikciID=t.TedarikciID where t.Faks is not null

-- Ýkiden fazla tabloyu birleþtirme 
-- 1997 yýlýndan sonra Nancy nin satýþ  yaptýðý firmalarýn isimleri :(1997 dahil)(Musteriler ,Satislar,Personeller)

-- Limited olan tedarikçilerden  alýnmýþ seafood kategorisindeki ürünlerimin toplam satýþ tutarý.(Urunler ,Kategoriler,Tedarikciler )
select SUM(u.HedefStokDuzeyi*u.BirimFiyati) from Urunler u inner join Tedarikciler t on u.TedarikciID=t.TedarikciID 
inner join Kategoriler k on u.KategoriID = k.KategoriID 
where  t.SirketAdi like '%ltd.%' and k.KategoriAdi='Seafood' 

-- Ayný tabloyu iliþkisel olrak birleþtirme 
-- Personellerimin baðlý olarak çalýþtýðý kiþileri listele

-- Inner Joýn ve Group By
-- Hangi personelim (adý ve soyadý ile birlikte), toplam kaç adetlik satýþ yapmýþ.
-- Satýþ adedi 100 den fazla olanlar gelsin, personelin adýnýn baþ harfi M olan kayýtlar gelsin ?
	
select p.Adi,' ',p.SoyAdi,Count(s.SatisID) from Personeller p
inner join Satislar s on p.PersonelID=s.PersonelID 
where p.Adi like 'M%' group by p.Adi,' ' ,p.SoyAdi
having Count(s.SatisID) > 100

-- Seafood kategorisindeki ürünlerin sayýsý kaçtýr(Urunler,Kategoriler)
	
select k.KategoriAdi ,COUNT(u.UrunAdi) from Urunler u inner join Kategoriler k on u.KategoriID = k.KategoriID
where k.KategoriAdi = 'Seafood' Group By k.KategoriAdi

-- Hangi personelim toplam kaç adet satýþ yapmýþ (personeller satislar)
select p.Adi ,COUNT(s.SatisID)  from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID 
GROUP BY p.Adi

-- En çok satýþ yapan personelim?
	
select top 1 p.Adi,Count(s.SatisID) from Personeller  p inner join Satislar  s on p.PersonelID=s.PersonelID 
group by p.Adi order by Count(s.SatisID) desc

-- Adýnda “a” harfi olan personellerin satýþ id si 10500 den büyük olan satýþlarýnýn toplam tutarýný(miktar * birimfiyat) ve 
-- bu satýþlarýn hangi tarihte gerçekleþtiðini listele.
	
select SUM(sd.Miktar*sd.BirimFiyati),s.SatisTarihi from Personeller  p inner join Satislar  s on p.PersonelID=s.PersonelID inner join [Satis Detaylari]  sd on s.SatisID=sd.SatisID where s.SatisID > 10500 and p.Adi like '%a%' group   by s.SatisTarihi


