use Northwind
-- Say�sal de�er i�lemleri
select 3+2
select 3-2
select 3*2
select 3/1
select PI()
select SIN(90)
-- Power : �s al�r
select POWER(2,3)
-- ABS : Mutlak de�er al�r
select ABS(-12)
-- RAND : 0-1 ARASI RASTGELE SAYI �RET�R
select RAND()
-- FLOOR : Yuvarlama yapar
select FLOOR(RAND()*100)

-- Tarih Fonksiyonlar�
-- GETDATE :Bug�n�n tarihini verir
select GETDATE();
-- DATEADD : Verilen tarihe verildi�ikadar g�n,ay,y�l ekler.
select DATEADD(Day,999,GETDATE());
select DATEADD(MONTH,999,GETDATE());
select DATEADD(YEAR,999,GETDATE());
-- DATEDIFF :�ki tarih aras�nda g�n�,ay� ve y�l� hesaplar
select DATEDIFF(Day,'05.09.1992',GETDATE());
select DATEDIFF(MONTH,'05.09.1992',GETDATE());
select DATEDIFF(YEAR,'05.09.1992',GETDATE());
-- DATEPART : Verilen tarihin haftan�n,ay�n yahut y�l�n ka��nc� g�n� oldu�unu hesaplar DW : Haftay� belirtir.
select DATEPART(DW,GETDATE());
select DATEPART(MONTH,GETDATE());
select DATEPART(DAY,GETDATE());

--Top Komutu: Belirtilen say�n�n ilk o kadar�n� getirir
select * from Personeller
select Top 3 * from Personeller

--Distinct Komutu : Bnezer olan verileri teke indirir
select Distinct Sehir from Personeller











