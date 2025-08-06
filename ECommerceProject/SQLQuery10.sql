use Northwind
-- DML KOMUTLARI
-- SELECT ,INSERT,UPDATE,DELETE
-- SELECT 
select * from Personeller

--Insert[Tablo adý](kolonlar)Values(deðerler)
Insert Personeller (Adi,SoyAdi) Values('zehra','paksoy')


-- Into komutu ile de yazýlabilir
Insert into Personeller (Adi,SoyAdi) Values('zehra','paksoy')
-- Not null olan kolonlara mutlaka deðer gönderilmelidir boþ býrakýalmaz
Insert Personeller (Unvan,UnvanEki) Values('a','b')
Insert Musteriler (MusteriAdi,Adres) Values ('Hilmi','Çorum'),
                                            ('Necati','Çankýrý'), 
                                            ('Rýfký','Yozgat')
-- [Insert komutu ile select sorgusu sonucu  gelen verileri farklý tabloya kaydeder]
Insert OrnekPersoneller1  SELECT Adi ,SoyAdi from Personeller


-- [Select Sorgusu Sonucu Gelen Verileri Farklý Bir Tablo Oluþturarak Kaydetme]
Select Adi, SoyAdi, Ulke into OrnekPersoneller2 from Personeller 
-- Bu yöntemle primary key ve foreign keyler oluþturulamazlar.

--DML (Veri Ýþleme Dili)

-- Güncelleme

-- Update] [Tablo Ad1] Set [Kolon Ad1] = Deðer

Update OrnekPersoneller Set Adi 'Mehmet'

-- [Update Sorgusuna Where Þartý Yazmak]


-- [Update Sorgusunda Join Yapýlarýný Kullanarak Birden Fazla Tabloda Güncelleme Yapmak]

Update Urunler Set UrunAdi = k.KategoriAdi From Urunler u Inner Join Kategoriler k on u. KategoriID = k. KategoriID

-- [Update Sorgusunda Subquery Ýle Güncelleme Yapmak]

Update Urunler Set UrunAdi = (Select Adi from Personeller Where PersonelID = 3)

-- [Update Sorgusunda Top Keywordü Ýle Güncelleme Yapmak]

Update Top (30) Urunler Set UrunAdi = 'x'

--DML (Veri Ýþleme Dili)

-- Silmek

--[Tablo Reklam1]'den Sil

Delete From Urunler


-- [Delete Sorgusuna Where Þartý Yazmak] 
Delete From Urunler Where KategoriID < 3

-- [Dikkat Edilmesi Gerekenler!!!]

-- Delete sorgusuyla tablo içerisindeki tüm verileri silmeniz identity ke veride kalýndýðý yerden id deðeri verilecektir.
