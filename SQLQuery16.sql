-- ALTER [NesneT�r�] [NesneAd�]
-- devam�nda yap�lacak de�i�iklik belirtilir
-- ALTER �LE VER�TABANI G�NCELLEME
ALTER DATABASE OrnekVeritabani
MODIFY FILE 
(
    NAME = 'GG',  -- Dosya ad�
    SIZE = 20MB   -- Yeni boyut
)

-- ALTER �LE TABLOYA YEN� KOLON EKLEME
ALTER TABLE OrnekTablo
ADD Kolon4 NVARCHAR(MAX)

--  ALTER �LE VAR OLAN B�R KOLONUN VER� T�P�N� DE���T�RME
ALTER TABLE OrnekTablo
ALTER COLUMN Kolon4 INT

-- ALTER �LE TABLODAN KOLON S�LME
ALTER TABLE OrnekTablo
DROP COLUMN Kolon4

--Alter �le Tabloya Constraint Ekleme
ALTER TABLE OrnekTablo
ADD CONSTRAINT OrnekConstraint DEFAULT 'Bo�' FOR Kolon2

---Alter �le Tablodaki Constrainti Silme
ALTER TABLE OrnekTablo
DROP CONSTRAINT OrnekConstraint

--  SP_RENAME �le Tablo Ad� G�ncelleme
EXEC SP_RENAME 'OrnekTablo', 'OrnekTabloYeni'

-- SP_RENAME �le Kolon G�ncelleme
EXEC sp_rename 'OrnekTabloYeni.Kolon1', 'Kolon1453', 'COLUMN'

-- Drop

--Create ile olu�turulan veritaban� nesnelerini silmemize yarar.

--Prototip

--Drop [Nesne] [Nesne Ad1]

Drop Table OrnekTabloYeni

Drop Database OrnekVeritabani



