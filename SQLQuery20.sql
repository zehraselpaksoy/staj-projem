-- Geçici Tablolar - Temporary Tables

-- Genellikle bir SQL Server üzerinde farklý lokasyonlarda birden fazla kiþinin çalýþtýðý durumlarda ya da verilerin test amaçlý geçici
-- bir yerlerde tutulmasý, iþlenmesi amacýyla kullanýlan yapýlardýr.

-- Bilinen tablo yapýsýnýn aynýsýný saðlarlar. Tek farklarý fiziksel olarak oluþmazlar. Sadece bellekte geçici olarak oluþturulurlar.

-- Select, Insert, Update ve Delete iþlemleri yapýlabilir. Ýliþki kurulabilir.

-- Sunucu u kapatýldýðýnda ya da oturum sahibi oturumu kapattýðýnda bellekten silinirler.


-- #Bir Tabloyu Fiziksel Olarak Kopyalama
Select * Into GeciciPersoneller from Personeller
-- Bu þekilde bir kullanýmda sadece primary key ve foreign key constraintler oluþturulmaz. Geri kalan herþey birebir fiziksel olarak
-- oluþur.


-- #Bir Tabloyu # ifadesi ile Belleðe Geçici Olarak Kopyalama
Select * Into #GeciciPersoneller from Personeller


Select * from #GeciciPersoneller
Insert #GeciciPersoneller(Adi, SoyAdi) Values('zehra', 'paskoy')
Delete from #GeciciPersoneller Where PersonelID = 12
Update #GeciciPersoneller Set Adi = 'Hilmi', SoyAdi = 'Celayir' Where PersonelID = 5


-- Geçici tablo üzerinde her türlü iþlemi yapabiliyoruz.
-- # ile oluþturulan tablo, o an SQL Serverda oturum açmýþ kiþinin sunucu belleðinde oluþur.
-- Sadece oturumu açan þahýs kullanabilir.
-- Eðer oturum açan þahýs SQL Serverdan disconnect olursa bu tablo bellekten silinir.


-- #Bir Tabloyu ## ifadesi ile Belleðe Geçici Olarak Kopyalama
Select * Into ##GeciciPersoneller2 from Personeller

Select * from ##GeciciPersoneller2
Insert ##GeciciPersoneller2(Adi, SoyAdi) Values('zehra', 'paskoy')
Delete from ##GeciciPersoneller2 Where PersonelID = 3
Update ##GeciciPersoneller2 Set Adi = 'Hilmi', SoyAdi = 'Celayir' Where PersonelID = 5

-- ## ile oluþturulan tablo, o an SQL Servarda oturum açmýþ kiþinin sunucu belleðinde oluþur.
-- Bu tabloyu oturum açan þahýs ve onun SQL Servarýna dýþardan ulaþan 3. þahýslar kullanabilir.
-- Eðer oturum açan þahýs SQL Servardan disconnet olursa bu tablo bellekten silinir.
-- Diðer bütün özellikleri # ile oluþturulan tablo ile aynýdýr.


-- Uniqueidentifier Veri Tipi
--int, varchar vs. gibi bir veri tipidir.
-- Aldýðý deðer, rakamlar ve harflerden oluþan çok büyük bir sayýdýr.
--Bundan dolayý bu kolona ayný deðerin birden fazla gelmesi neredeyse imkansýzdýr.
-- O yüzden tekil bir veri oluþturmak için kullanýlýr.
CREATE TABLE OrnekTablo
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Kolon1 NVARCHAR(MAX),
    Kolon2 NVARCHAR(MAX),
    Kolon3 UNIQUEIDENTIFIER 
);
-- Newid
select NEWID()
Insert OrnekTablo values('X','y',NEWID())

