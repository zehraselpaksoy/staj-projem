-- Subquery(iç içe sorgu)
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
Delete from PersonellerX Where SoyAdi 'Gençay'

SELECT @@ROWCOUNT

Select * from Personeller

SELECT @@ROWCOUNT

Insert PersonellerX (Adi, SoyAdi) Values('Gençay', 'Yýldýz'),

('Ahmet', 'Uslu'), ('Aslý', 'Güngör')

SELECT @@ROWCOUNT  

-- Identity Kolonuna müdahale etme 
DBCC Checkident(PersonellerX,reseed,27)

-- Null kontrol
-- Coalesce Fonksiyonu Ýle Null Kontrolü

Select MusteriAdi, Coalesce (Bolge, 'Bölge Bilinmiyor') from Musteriler

IsNull Fonksiyonu Ýle Null Kontrolü

Select MusteriAdi, Isnull(Bolge, 'Bölge Bilinmiyor') from Musteriler

--NullIf Fonksiyonu Ýle Null Kontrolü
-- Fonksiyona verilen kolon, ikinci parametre verilen deðere eþit ise o kolonu Null olarak getirir.

Select HedefStokDuzeyi from Urunler

Select AVG(HedefStokDuzeyi) from Urunler

-- Hedef stok düzeyi 0 olmayan ürünlerin ortalamasý nedir?

Select AVG(HedefStokDuzeyi) from Urunler Where HedefStokDuzeyi <> 0

Select AVG(NullIf (HedefStokDuzeyi, 0)) from Urunler

-- Bir Tablonun Primary Key Olup Olmadýðýný Kontrol Etme

select  OBJECTPROPERTY(OBJECT_ID('Personeller'), 'TableHas PrimaryKey') öðesini seçin