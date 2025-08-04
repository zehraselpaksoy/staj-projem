use Northwind
-- Sayýsal deðer iþlemleri
select 3+2
select 3-2
select 3*2
select 3/1
select PI()
select SIN(90)
-- Power : üs alýr
select POWER(2,3)
-- ABS : Mutlak deðer alýr
select ABS(-12)
-- RAND : 0-1 ARASI RASTGELE SAYI ÜRETÝR
select RAND()
-- FLOOR : Yuvarlama yapar
select FLOOR(RAND()*100)

-- Tarih Fonksiyonlarý
-- GETDATE :Bugünün tarihini verir
select GETDATE();
-- DATEADD : Verilen tarihe verildiðikadar gün,ay,yýl ekler.
select DATEADD(Day,999,GETDATE());
select DATEADD(MONTH,999,GETDATE());
select DATEADD(YEAR,999,GETDATE());
-- DATEDIFF :Ýki tarih arasýnda günü,ayý ve yýlý hesaplar
select DATEDIFF(Day,'05.09.1992',GETDATE());
select DATEDIFF(MONTH,'05.09.1992',GETDATE());
select DATEDIFF(YEAR,'05.09.1992',GETDATE());
-- DATEPART : Verilen tarihin haftanýn,ayýn yahut yýlýn kaçýncý günü olduðunu hesaplar DW : Haftayý belirtir.
select DATEPART(DW,GETDATE());
select DATEPART(MONTH,GETDATE());
select DATEPART(DAY,GETDATE());

--Top Komutu: Belirtilen sayýnýn ilk o kadarýný getirir
select * from Personeller
select Top 3 * from Personeller

--Distinct Komutu : Bnezer olan verileri teke indirir
select Distinct Sehir from Personeller











