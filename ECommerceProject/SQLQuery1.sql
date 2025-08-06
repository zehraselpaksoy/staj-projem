use Northwind
-- Select Komutu
Select 3
 --Tablo �ekilde olu�turarak yazar
Select 'Paksoy'
--Direkt yazar
print 'Paksoy' 

select 3,5,7,9
-- * burada b�t�n kolonlar� demek personeller tablosunun b�t�n kolonlar�n� getir demek o zaman
select * from Personeller 
--Kolona isim atar
select 3 as deger
--as kullanmadan da atayabiliyoruz
select 3 deger
select 'Zehra'  ad�, 'Pakosoy' soyad�
--Bo�luklu isim vereceksek e�er
select 1453 [�stanbulun Fethi]
--Bo�luk olan verileri sorgulamada
--Kolonlar� birle�tirme
select Adi+' '+SoyAdi [Personel Bilgileri] from Personeller
--Farkl� tipteki kolonlar� birle�tirme
select Adi+' '+CONVERT(nvarchar ,IseBaslamaTarihi) from Personeller
select Adi+' '+CAST(IseBaslamaTarihi as nvarchar ) from Personeller

--Where komutu
select * from Personeller where Sehir='London'
select * from Personeller where BagliCalistigiKisi<5
--And Operat�r�
select * from Personeller where Sehir='London' and Ulke= 'UK'
--Or Operat�r�
select * from Personeller where UnvanEki='Mr.' or Sehir= 'Seattle'

select * from Personeller where Adi='Robert' and SoyAdi= 'King'
select * from Personeller where PersonelID < 5
select * from Personeller where PersonelID >= 5
select * from Personeller where PersonelID <= 5
select * from Personeller where PersonelID = 5
--Fonksiyon sonu�lar�n� �art olarak kullanmak
select * from Personeller where YEAR(IseBaslamaTarihi) >1992
--De�ilse operat�r�
select * from Personeller where day(DogumTarihi) <>29
select * from Personeller where YEAR(IseBaslamaTarihi) >1950 and  YEAR(IseBaslamaTarihi) < 1965
select Adi from Personeller where Sehir='London' or Sehir ='Tacoma' or Sehir ='Kirkland'

--Between komutu
select * from Personeller where YEAR(DogumTarihi) Between 1950 and  1965
--In komutu
select Adi from Personeller where Sehir In('London' ,'Tacoma' ,'Kirkland' )








