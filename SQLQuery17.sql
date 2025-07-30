
-- Constraintler (K�s�tlay�c�lar)

-- Constraintler sayesinde tablolar �zerinde istedi�imiz �artlar ve durumlara g�re k�s�tlamalar yapabiliyoruz.

-- 1. Default Constraintler

-- 2. Check Constraintler

-- 3. Primary Key Constraintler

-- 4. Un�que Constraintler

-- 5. For�gn Key  Constraintler


-- 1. Default Constraintler
-- Default Constraint sayesinde kolona bir de�er girilmedi�i taktirde varsay�lan olarak ne girilmesi gerekti�ini belirtebiliyoruz.

-- Genel Yap�s�;

-- Add Constraint [Constraint Ad�] Default 'Varsay�lan De�er' For [Kolon Ad�]
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

-- Sadece Kolon2'ye de�er ekle (Kolon1 NULL kal�r, varsay�lan varsa o atan�r)
INSERT  OrnekTabloY (Kolon2) VALUES (0);

-- Sadece Kolon1'e de�er ekle (Kolon2 NULL kal�r, e�er NULL kabul etmiyorsa hata verir)
INSERT  OrnekTabloY (Kolon1) VALUES ('�rnek bir de�er');

SELECT * FROM OrnekTabloY;

-- CHECK CONSTRAINT
-- bir kolona girilecek verilerin belirli bir ko�ulu sa�lamas�n� zorunlu tutar.
-- GENEL YAPISI : ADD CONSTRAINT CONSTRAINT CHECK (�ART)
ALTER TABLE OrnekTabloY
ADD CONSTRAINT Kolon2Kontrol
CHECK (Kolon2 % 2 = 0)
-- D�KKAT!!!
-- Check constraint olu�turulmadan �nce ilgili tabloda �arta ayk�r� de�erler varsa e�er constraint olu�turulmayacakt�r!!!
-- Ancak �nceki kay�tlar� g�rmezden gelip genede Check Constrainti uygulamak istiyorsak "With Nocheck" komutu kullan�lmal�d�r.
-- With Nocheck Komutu ile
-- �uana kadar olan kay�tlar� g�rmezden gelip, check constrainti uygulatt�r�r.

ALTER TABLE OrnekTabloY
WITH NOCHECK
ADD CONSTRAINT Kolon2Kontrol
CHECK (Kolon2 % 2 = 0)

-- 3. Primary Key Constraintler
-- Primary Key Constraint ile; o kolona eklenen primary key ile, ba�ka tablolarda foreign key olu�turarak ili�ki kurmam�z m�mk�n olur. 
-- Bunun yan�nda o kolonun ta��d��� verinin tekil olaca�� da garanti edilmi� olur. Primary key constraint ile ayr�ca CLUSTERED index
-- olu�turulmu� da olur.
-- Genel Yap�s�;
-- ADD CONSTRAINT KisitlamaAdi PRIMARY KEY (KolonAdi)
-- D�KKAT!!!
-- Primary Key Constraint kullan�lan kolon primary key �zelli�ine sahip olmamal�d�r.

ALTER TABLE OrnekTabloY
ADD CONSTRAINT PrimaryId
PRIMARY KEY (Kimlik)


-- 4. Un�que Constraintler
-- Unique constraintin tek amac�, belirtti�imiz kolondaki de�erlerin tekil olmas�n� sa�lamakt�r.
-- Genel Yap�s�;
-- ADD CONSTRAINT  [K�s�tlama Ad�] Un�que (Kolon Ad�)
ALTER TABLE OrnekTabloY
ADD CONSTRAINT OrnekTabloUnique
UNIQUE (Kolon2)

-- "Kolon2" kolonuna unique constraint verilerek tekil hale getirilmi�tir. Bundan sonra ikitane ayn� veriden kay�t yap�lamamaktad�r.

-- 5. For�gn Key  Constraintler
-- Tablolar�n kolonlar� aras�nda ili�ki kurmam�z� sa�lar. Bu ili�ki neticesinde; foreign key olan kolondaki kar��l���n�n bo�a d��memesi
-- i�in primary key kolonu olan tablodan veri silinmesini, g�ncellenmesini engeller.
-- Genel Yap�s�;

-- Add Constraint [Constraint Ad�] Foreign Key (Kolon Ad�) References [2. Tablo Ad�] (2. Tablodaki Kolon Ad�)

CREATE TABLE Ogrenciler
(
    OgrenciId INT PRIMARY KEY IDENTITY(1,1),  -- Birincil anahtar, otomatik artan
    DersId INT,                               -- Ders referans kolon ad� (dikkat: senin verdi�in �rnekte DersID yaz�yor, tabloyla uyumlu hale getirdim)
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

-- �u durumda, delete ve update i�lemlerinden ili�kili kolondaki veriler etkilenmez.
-- Davran��� de�i�tirmek i�in a�a��daki komutlar kullan�l�r.
-- Cascade
-- Ana tablodaki kay�t silindi�inde ya da g�ncellendi�inde, ili�kili kolondaki kar��l���da otomatik olarak silinir ya da g�ncellenir.
ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers
FOREIGN KEY (DersId) REFERENCES Dersler(DersId)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Set Null
-- Ana tablodaki kay�t silindi�inde ya da g�ncellendi�inde, ili�kili kolondaki kar��l���na "Null" de�er bas�l�r.
ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers
FOREIGN KEY (DersId) REFERENCES Dersler(DersId)
ON DELETE SET  NULL
ON UPDATE SET NULL 
-- Set Default
-- Ana tablodaki kay�t silindi�inde ya da g�ncellendi�inde, ili�kili kolondaki kar��l���na o kolonun default de�eri bas�l�r. Bu default
-- de�er dedi�imiz default tipte bir constrainttir. Bunu kendimiz olu�turabiliriz.
ALTER TABLE OrnekTabloY
ADD CONSTRAINT DefaultOgrenciler DEFAULT -1 FOR DersId

ALTER TABLE Ogrenciler
ADD CONSTRAINT ForeignKeyOgrenciDers
FOREIGN KEY (DersId) REFERENCES Dersler(DersId)
ON DELETE SET  DEFAULT
ON UPDATE SET DEFAULT 
-- Bu ayarlar verilmedi�i taktirde "no action" �zelli�i ge�erlidir.


