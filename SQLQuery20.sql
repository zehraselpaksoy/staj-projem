-- Ge�ici Tablolar - Temporary Tables

-- Genellikle bir SQL Server �zerinde farkl� lokasyonlarda birden fazla ki�inin �al��t��� durumlarda ya da verilerin test ama�l� ge�ici
-- bir yerlerde tutulmas�, i�lenmesi amac�yla kullan�lan yap�lard�r.

-- Bilinen tablo yap�s�n�n ayn�s�n� sa�larlar. Tek farklar� fiziksel olarak olu�mazlar. Sadece bellekte ge�ici olarak olu�turulurlar.

-- Select, Insert, Update ve Delete i�lemleri yap�labilir. �li�ki kurulabilir.

-- Sunucu u kapat�ld���nda ya da oturum sahibi oturumu kapatt���nda bellekten silinirler.


-- #Bir Tabloyu Fiziksel Olarak Kopyalama
Select * Into GeciciPersoneller from Personeller
-- Bu �ekilde bir kullan�mda sadece primary key ve foreign key constraintler olu�turulmaz. Geri kalan her�ey birebir fiziksel olarak
-- olu�ur.


-- #Bir Tabloyu # ifadesi ile Belle�e Ge�ici Olarak Kopyalama
Select * Into #GeciciPersoneller from Personeller


Select * from #GeciciPersoneller
Insert #GeciciPersoneller(Adi, SoyAdi) Values('zehra', 'paskoy')
Delete from #GeciciPersoneller Where PersonelID = 12
Update #GeciciPersoneller Set Adi = 'Hilmi', SoyAdi = 'Celayir' Where PersonelID = 5


-- Ge�ici tablo �zerinde her t�rl� i�lemi yapabiliyoruz.
-- # ile olu�turulan tablo, o an SQL Serverda oturum a�m�� ki�inin sunucu belle�inde olu�ur.
-- Sadece oturumu a�an �ah�s kullanabilir.
-- E�er oturum a�an �ah�s SQL Serverdan disconnect olursa bu tablo bellekten silinir.


-- #Bir Tabloyu ## ifadesi ile Belle�e Ge�ici Olarak Kopyalama
Select * Into ##GeciciPersoneller2 from Personeller

Select * from ##GeciciPersoneller2
Insert ##GeciciPersoneller2(Adi, SoyAdi) Values('zehra', 'paskoy')
Delete from ##GeciciPersoneller2 Where PersonelID = 3
Update ##GeciciPersoneller2 Set Adi = 'Hilmi', SoyAdi = 'Celayir' Where PersonelID = 5

-- ## ile olu�turulan tablo, o an SQL Servarda oturum a�m�� ki�inin sunucu belle�inde olu�ur.
-- Bu tabloyu oturum a�an �ah�s ve onun SQL Servar�na d��ardan ula�an 3. �ah�slar kullanabilir.
-- E�er oturum a�an �ah�s SQL Servardan disconnet olursa bu tablo bellekten silinir.
-- Di�er b�t�n �zellikleri # ile olu�turulan tablo ile ayn�d�r.


-- Uniqueidentifier Veri Tipi
--int, varchar vs. gibi bir veri tipidir.
-- Ald��� de�er, rakamlar ve harflerden olu�an �ok b�y�k bir say�d�r.
--Bundan dolay� bu kolona ayn� de�erin birden fazla gelmesi neredeyse imkans�zd�r.
-- O y�zden tekil bir veri olu�turmak i�in kullan�l�r.
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

