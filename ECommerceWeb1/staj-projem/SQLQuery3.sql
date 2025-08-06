use Northwind
-- Aggregate fonksiyonlarý
-- AVG:Ortalamayý alýr
select AVG(PersonelID) from Personeller

-- max:en büyük deðeri
select Max(PersonelID) from Personeller

-- min:en küçük deðeri
select Min(PersonelID) from Personeller

-- count:toplam sayýsýný verir
select Count(*) from Personeller
select AVG(Adi) from Personeller


-- sum :Topmý verir
select sum(NakliyeUcreti) from Satislar

