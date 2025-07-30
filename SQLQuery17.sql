
-- Constraintler (Kýsýtlayýcýlar)

-- Constraintler sayesinde tablolar üzerinde istediðimiz þartlar ve durumlara göre kýsýtlamalar yapabiliyoruz.

-- 1. Default Constraintler

-- 2. Check Constraintler

-- 3. Primary Key Constraintler

-- 4. Unýque Constraintler

-- 5. Forýgn Key  Constraintler


-- 1. Default Constraintler
-- Default Constraint sayesinde kolona bir deðer girilmediði taktirde varsayýlan olarak ne girilmesi gerektiðini belirtebiliyoruz.

-- Genel Yapýsý;

-- Add Constraint [Constraint Adý] Default 'Varsayýlan Deðer' For [Kolon Adý]
CREATE TABLE OrnekTabloY
(
    Kimlik INT PRIMARY KEY IDENTITY(1,1),
    Kolon1 NVARCHAR(MAX),
    Kolon2 INT
)
ALTER TABLE OrnekTabloY
ADD CONSTRAINT kolon1Constraint DEFAULT 'Bos' FOR Kolon1

ALTER TABLE OrnekTabloY
ADD CONSTRAINT kolon2Constraint DEFAULT -1 FOR Kolon2

-- Sadece Kolon2'ye deðer ekle (Kolon1 NULL kalýr, varsayýlan varsa o atanýr)
INSERT  OrnekTabloY (Kolon2) VALUES (0);

-- Sadece Kolon1'e deðer ekle (Kolon2 NULL kalýr, eðer NULL kabul etmiyorsa hata verir)
INSERT  OrnekTabloY (Kolon1) VALUES ('Örnek bir deðer');

SELECT * FROM OrnekTabloY;

-- CHECK CONSTRAINT
-- bir kolona girilecek verilerin belirli bir koþulu saðlamasýný zorunlu tutar.
-- GENEL YAPISI : ADD CONSTRAINT CONSTRAINT CHECK (ÞART)
ALTER TABLE OrnekTabloY
ADD CONSTRAINT Kolon2Kontrol
CHECK (Kolon2 % 2 = 0)
-- DÝKKAT!!!
-- Check constraint oluþturulmadan önce ilgili tabloda þarta aykýrý deðerler varsa eðer constraint oluþturulmayacaktýr!!!
-- Ancak önceki kayýtlarý görmezden gelip genede Check Constrainti uygulamak istiyorsak "With Nocheck" komutu kullanýlmalýdýr.
-- With Nocheck Komutu ile
-- Þuana kadar olan kayýtlarý görmezden gelip, check constrainti uygulattýrýr.

ALTER TABLE OrnekTabloY
WITH NOCHECK
ADD CONSTRAINT Kolon2Kontrol
CHECK (Kolon2 % 2 = 0)

-- 3. Primary Key Constraintler
-- Primary Key Constraint ile; o kolona eklenen primary key ile, baþka tablolarda foreign key oluþturarak iliþki kurmamýz mümkün olur. 
-- Bunun yanýnda o kolonun taþýdýðý verinin tekil olacaðý da garanti edilmiþ olur. Primary key constraint ile ayrýca CLUSTERED index
-- oluþturulmuþ da olur.
-- Genel Yapýsý;
-- ADD CONSTRAINT KisitlamaAdi PRIMARY KEY (KolonAdi)
-- DÝKKAT!!!
-- Primary Key Constraint kullanýlan kolon primary key özelliðine sahip olmamalýdýr.

ALTER TABLE OrnekTabloY
ADD CONSTRAINT PrimaryId
PRIMARY KEY (Kimlik)


-- 4. Unýque Constraintler
-- Unique constraintin tek amacý, belirttiðimiz kolondaki deðerlerin tekil olmasýný saðlamaktýr.
-- Genel Yapýsý;
-- ADD CONSTRAINT  [Kýsýtlama Adý] Unýque (Kolon Adý)
ALTER TABLE OrnekTabloY
ADD CONSTRAINT OrnekTabloUnique
UNIQUE (Kolon2)

-- "Kolon2" kolonuna unique constraint verilerek tekil hale getirilmiþtir. Bundan sonra ikitane ayný veriden kayýt yapýlamamaktadýr.

-- 5. Forýgn Key  Constraintler
-- Tablolarýn kolonlarý arasýnda iliþki kurmamýzý saðlar. Bu iliþki neticesinde; foreign key olan kolondaki karþýlýðýnýn boþa düþmemesi
-- için primary key kolonu olan tablodan veri silinmesini, güncellenmesini engeller.
-- Genel Yapýsý;

-- Add Constraint [Constraint Adý] Foreign Key (Kolon Adý) References [2. Tablo Adý] (2. Tablodaki Kolon Adý)

CREATE TABLE Ogrenciler
(
    OgrenciId INT PRIMARY KEY IDENTITY(1,1),  -- Birincil anahtar, otomatik artan
    DersId INT,                               -- Ders referans kolon adý (dikkat: senin verdiðin örnekte DersID yazýyor, tabloyla uyumlu hale getirdim)
    Adi NVARCHAR(MAX),
    Soyadi NVARCHAR(MAX)
);
CREATE TABLE Dersler
(
    DersId INT PRIMARY KEY IDENTITY(1,1),    -- Birincil anahtar, otomatik artan
    DerAdi NVARCHAR(MAX)
);
ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers
FOREIGN KEY (DersId) REFERENCES Dersler(DersId);

-- Þu durumda, delete ve update iþlemlerinden iliþkili kolondaki veriler etkilenmez.
-- Davranýþý deðiþtirmek için aþaðýdaki komutlar kullanýlýr.
-- Cascade
-- Ana tablodaki kayýt silindiðinde ya da güncellendiðinde, iliþkili kolondaki karþýlýðýda otomatik olarak silinir ya da güncellenir.
ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers
FOREIGN KEY (DersId) REFERENCES Dersler(DersId)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Set Null
-- Ana tablodaki kayýt silindiðinde ya da güncellendiðinde, iliþkili kolondaki karþýlýðýna "Null" deðer basýlýr.
ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers
FOREIGN KEY (DersId) REFERENCES Dersler(DersId)
ON DELETE SET  NULL
ON UPDATE SET NULL 
-- Set Default
-- Ana tablodaki kayýt silindiðinde ya da güncellendiðinde, iliþkili kolondaki karþýlýðýna o kolonun default deðeri basýlýr. Bu default
-- deðer dediðimiz default tipte bir constrainttir. Bunu kendimiz oluþturabiliriz.
ALTER TABLE OrnekTabloY
ADD CONSTRAINT DefaultOgrenciler DEFAULT -1 FOR DersId

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers
FOREIGN KEY (DersId) REFERENCES Dersler(DersId)
ON DELETE SET  DEFAULT
ON UPDATE SET DEFAULT 
-- Bu ayarlar verilmediði taktirde "no action" özelliði geçerlidir.


