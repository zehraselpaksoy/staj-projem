-- ALTER [NesneTürü] [NesneAdý]
-- devamýnda yapýlacak deðiþiklik belirtilir
-- ALTER ÝLE VERÝTABANI GÜNCELLEME
ALTER DATABASE OrnekVeritabani
MODIFY FILE 
(
    NAME = 'GG',  -- Dosya adý
    SIZE = 20MB   -- Yeni boyut
)

-- ALTER ÝLE TABLOYA YENÝ KOLON EKLEME
ALTER TABLE OrnekTablo
ADD Kolon4 NVARCHAR(MAX)

--  ALTER ÝLE VAR OLAN BÝR KOLONUN VERÝ TÝPÝNÝ DEÐÝÞTÝRME
ALTER TABLE OrnekTablo
ALTER COLUMN Kolon4 INT

-- ALTER ÝLE TABLODAN KOLON SÝLME
ALTER TABLE OrnekTablo
DROP COLUMN Kolon4

--Alter Ýle Tabloya Constraint Ekleme
ALTER TABLE OrnekTablo
ADD CONSTRAINT OrnekConstraint DEFAULT 'Boþ' FOR Kolon2

---Alter Ýle Tablodaki Constrainti Silme
ALTER TABLE OrnekTablo
DROP CONSTRAINT OrnekConstraint

--  SP_RENAME Ýle Tablo Adý Güncelleme
EXEC SP_RENAME 'OrnekTablo', 'OrnekTabloYeni'

-- SP_RENAME Ýle Kolon Güncelleme
EXEC sp_rename 'OrnekTabloYeni.Kolon1', 'Kolon1453', 'COLUMN'

-- Drop

--Create ile oluþturulan veritabaný nesnelerini silmemize yarar.

--Prototip

--Drop [Nesne] [Nesne Ad1]

Drop Table OrnekTabloYeni

Drop Database OrnekVeritabani



