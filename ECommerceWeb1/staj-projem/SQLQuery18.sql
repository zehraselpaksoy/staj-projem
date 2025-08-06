-- Deðiþkenler
-- Declare keywordü ile deðiþken tanýmlanýr
-- Prototip;
-- Declare @DegiskenAdi DegiskenTipi
DECLARE @x INT;               -- Tam sayý deðiþkeni
DECLARE @y NVARCHAR;      -- Karakter dizisi deðiþkeni, 50 karakter uzunluðunda
DECLARE @z MONEY;             -- Para tipi deðiþkeni
DECLARE @b BIT;               -- Boolean (0 veya 1) tipi deðiþken
DECLARE @x INT, @z NVARCHAR(100), @y BIT;
-- Tanýmlanmýþ deðerlere deðer atama
-- SET 
Declare @yas int=3 

Declare @x int
SET @x=125

declare @tarih datetime 
set @tarih =GETDATE()

--Deðiþkenin Deðeri Okuma
Declare @x int
SET @x=125
select @x
print @x
-- Sorgu sonucu gelen verileri Deðiþkenle elde etme
declare @adi nvarchar(max),@soyadi nvarchar(max) -- mav bütün hepsini yazdýrýr max olmasa sadece baþ harfleri yazýlacaktýr
select @adi=Adi,@soyadi=SoyAdi from Personeller where PersonelID=1
-- 1.Sorgu sonucu gelen satýr 1 adet olmalýdýr
-- 2.Kolondaki verilerin tipleri ne ise onu temsil edecek kolanlarýn da tipleri o olmalýdýr
select @adi,@soyadi

-- Batch kavramý - Go
CREATE DATABASE OrnekDatabase
Go
USE OrnekDatabase 
Go
CREATE TABLE OrnekTablo
(
    Kimlik INT PRIMARY KEY IDENTITY(1,1),
    Kolon1 NVARCHAR(MAX),
    Kolon2 NVARCHAR(MAX)
)

