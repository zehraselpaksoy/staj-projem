use Northwind
-- DML KOMUTLARI
-- SELECT ,INSERT,UPDATE,DELETE
-- SELECT 
select * from Personeller

--Insert[Tablo ad�](kolonlar)Values(de�erler)
Insert Personeller (Adi,SoyAdi) Values('zehra','paksoy')


-- Into komutu ile de yaz�labilir
Insert into Personeller (Adi,SoyAdi) Values('zehra','paksoy')
-- Not null olan kolonlara mutlaka de�er g�nderilmelidir bo� b�rak�almaz
Insert Personeller (Unvan,UnvanEki) Values('a','b')
Insert Musteriler (MusteriAdi,Adres) Values ('Hilmi','�orum'),
                                            ('Necati','�ank�r�'), 
                                            ('R�fk�','Yozgat')
-- [Insert komutu ile select sorgusu sonucu  gelen verileri farkl� tabloya kaydeder]
Insert OrnekPersoneller1  SELECT Adi ,SoyAdi from Personeller


-- [Select Sorgusu Sonucu Gelen Verileri Farkl� Bir Tablo Olu�turarak Kaydetme]
Select Adi, SoyAdi, Ulke into OrnekPersoneller2 from Personeller 
-- Bu y�ntemle primary key ve foreign keyler olu�turulamazlar.

--DML (Veri ��leme Dili)

-- G�ncelleme

-- Update] [Tablo Ad1] Set [Kolon Ad1] = De�er

Update OrnekPersoneller Set Adi 'Mehmet'

-- [Update Sorgusuna Where �art� Yazmak]


-- [Update Sorgusunda Join Yap�lar�n� Kullanarak Birden Fazla Tabloda G�ncelleme Yapmak]

Update Urunler Set UrunAdi = k.KategoriAdi From Urunler u Inner Join Kategoriler k on u. KategoriID = k. KategoriID

-- [Update Sorgusunda Subquery �le G�ncelleme Yapmak]

Update Urunler Set UrunAdi = (Select Adi from Personeller Where PersonelID = 3)

-- [Update Sorgusunda Top Keyword� �le G�ncelleme Yapmak]

Update Top (30) Urunler Set UrunAdi = 'x'

--DML (Veri ��leme Dili)

-- Silmek

--[Tablo Reklam1]'den Sil

Delete From Urunler


-- [Delete Sorgusuna Where �art� Yazmak] 
Delete From Urunler Where KategoriID < 3

-- [Dikkat Edilmesi Gerekenler!!!]

-- Delete sorgusuyla tablo i�erisindeki t�m verileri silmeniz identity ke veride kal�nd��� yerden id de�eri verilecektir.
