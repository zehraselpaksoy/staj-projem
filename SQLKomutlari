use Northwind 
-- GroupBy Komutu
select KategoriID,COUNT(*) from  Urunler Group By KategoriID
select PersonelID,COUNT(*) from  Satislar Group By PersonelID
select PersonelID,SUM(NakliyeUcreti) from  Satislar Group By PersonelID

-- GroupBy Komutunda where þartý : where group bydan önce yazýlýr Normal kolonlar üszerinde þartý yazýlýr
select KategoriID,COUNT(*) from  Urunler where KategoriID >5 Group By KategoriID
select PersonelID,COUNT(*) from  Satislar where PersonelID <4 Group By PersonelID
select PersonelID,SUM(NakliyeUcreti) from  Satislar Group By PersonelID

-- GroupBy iþleminde having komutunu kullanarak þart oluþturma   : having ise aggregate fonksiyonlarýnda oluþturulan þart broup bydan sonra yazýlýr
select KategoriID,COUNT(*) from  Urunler where KategoriID >5 Group By KategoriID Having COUNT(*) >6
select PersonelID,COUNT(*) from  Satislar where PersonelID <4 Group By PersonelID
select PersonelID,SUM(NakliyeUcreti) from  Satislar Group By PersonelID

 