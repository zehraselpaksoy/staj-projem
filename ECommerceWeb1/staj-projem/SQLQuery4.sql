Use Northwind
-- String Fonskiyonlar�
-- Left: soldan belirtilen say�da karakteri getirir
select LEFT(Adi,2) from Personeller
-- Right: soldan belirtilen say�da karakteri getirir
select Right(Adi,2) from Personeller
-- Upper : b�y�k harfa �evirir
select Upper(Adi) from Personeller
-- lower : k���k harfe �evirir
select Lower(Adi) from Personeller
-- substring : belirtilen indeksten itibaren belirtilen say�da karakteri getirir
select Substring(Adi,3,2) from Personeller
-- Ltr�m: soldan bo�luklar� siler
select LTRIM('         Paksoy')
-- Rtr�m: soldan bo�luklar� siler
select LTRIM('Paksoy              ')
-- reverse : ters �evirir
select Reverse(Adi) from Personeller
-- replace : belirtilen ifadeyi belirtilen ifade ile de�i�tirir
select REPLACE('benim ad�m asel','asel','zehra')
-- char�ndex : belirtilen ifadenin veriler i�indeki s�ralamas�n� verir
select adi,CHARINDEX('r',Adi) from Personeller
select MusteriAdi ,CHARINDEX(' ',MusteriAdi)from Musteriler 
--Musteri tablosunda MusteriAdi kolonundan sadece soyadlar�n� �ekelim LEN : Karakter say�s�
select SUBSTRING(MusteriAdi,CHARINDEX(' ',MusteriAdi) ,LEN(MusteriAdi) -(CHARINDEX(' ',MusteriAdi) -1)) from Musteriler
