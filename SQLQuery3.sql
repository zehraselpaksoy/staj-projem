use Northwind
-- Aggregate fonksiyonlar�
-- AVG:Ortalamay� al�r
select AVG(PersonelID) from Personeller

-- max:en b�y�k de�eri
select Max(PersonelID) from Personeller

-- min:en k���k de�eri
select Min(PersonelID) from Personeller

-- count:toplam say�s�n� verir
select Count(*) from Personeller
select AVG(Adi) from Personeller


-- sum :Topm� verir
select sum(NakliyeUcreti) from Satislar

