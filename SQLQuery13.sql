-- Subquery(i� i�e sorgu)
select * from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID where Adi ='Nancy'

Select SatisID, SatisTarihi from Satislar Where PersonelID= (Select PersonelID from Personeller Where Adi = 'Nancy')

select * from Personeller where Adi =(Select Adi from Personeller where UnvanEki ='Ms.')


-- Bulk Insert = Harici bir kaynaktan tablo ekleme 
Bulk Insert Kisiler
From 'C:\Users\ZEHRA ASEL\OneDrive\Desktop\Kisiler.txt'
With( 
 Fieldterminator = '\t',
rowterminator ='\n'
)

-- Truncate :
Truncate Table PersonellerX
-- @@Identity
Insert Kategoriler (KategoriAdi, Tanimi) Values('X', 'X Kategorisi')

select @@IDENTITY

Insert PersonellerX (Adi, SoyAdi) Values('Ela', 'Elif')
select @@IDENTITY

--RowCount :
Delete from PersonellerX Where SoyAdi 'Gen�ay'

SELECT @@ROWCOUNT

Select * from Personeller

SELECT @@ROWCOUNT

Insert PersonellerX (Adi, SoyAdi) Values('Gen�ay', 'Y�ld�z'),

('Ahmet', 'Uslu'), ('Asl�', 'G�ng�r')

SELECT @@ROWCOUNT  

-- Identity Kolonuna m�dahale etme 
DBCC Checkident(PersonellerX,reseed,27)

-- Null kontrol
-- Coalesce Fonksiyonu �le Null Kontrol�

Select MusteriAdi, Coalesce (Bolge, 'B�lge Bilinmiyor') from Musteriler

IsNull Fonksiyonu �le Null Kontrol�

Select MusteriAdi, Isnull(Bolge, 'B�lge Bilinmiyor') from Musteriler

--NullIf Fonksiyonu �le Null Kontrol�
-- Fonksiyona verilen kolon, ikinci parametre verilen de�ere e�it ise o kolonu Null olarak getirir.

Select HedefStokDuzeyi from Urunler

Select AVG(HedefStokDuzeyi) from Urunler

-- Hedef stok d�zeyi 0 olmayan �r�nlerin ortalamas� nedir?

Select AVG(HedefStokDuzeyi) from Urunler Where HedefStokDuzeyi <> 0

Select AVG(NullIf (HedefStokDuzeyi, 0)) from Urunler

-- Bir Tablonun Primary Key Olup Olmad���n� Kontrol Etme

select  OBJECTPROPERTY(OBJECT_ID('Personeller'), 'TableHas PrimaryKey') ��esini se�in