-- De�i�kenler
-- Declare keyword� ile de�i�ken tan�mlan�r
-- Prototip;
-- Declare @DegiskenAdi DegiskenTipi
DECLARE @x INT;               -- Tam say� de�i�keni
DECLARE @y NVARCHAR;      -- Karakter dizisi de�i�keni, 50 karakter uzunlu�unda
DECLARE @z MONEY;             -- Para tipi de�i�keni
DECLARE @b BIT;               -- Boolean (0 veya 1) tipi de�i�ken
DECLARE @x INT, @z NVARCHAR(100), @y BIT;
-- Tan�mlanm�� de�erlere de�er atama
-- SET 
Declare @yas int=3 

Declare @x int
SET @x=125

declare @tarih datetime 
set @tarih =GETDATE()

--De�i�kenin De�eri Okuma
Declare @x int
SET @x=125
select @x
print @x
-- Sorgu sonucu gelen verileri De�i�kenle elde etme
declare @adi nvarchar(max),@soyadi nvarchar(max) -- mav b�t�n hepsini yazd�r�r max olmasa sadece ba� harfleri yaz�lacakt�r
select @adi=Adi,@soyadi=SoyAdi from Personeller where PersonelID=1
-- 1.Sorgu sonucu gelen sat�r 1 adet olmal�d�r
-- 2.Kolondaki verilerin tipleri ne ise onu temsil edecek kolanlar�n da tipleri o olmal�d�r
select @adi,@soyadi

-- Batch kavram� - Go
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

