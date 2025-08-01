Use Northwind
-- String Fonskiyonlarý
-- Left: soldan belirtilen sayýda karakteri getirir
select LEFT(Adi,2) from Personeller
-- Right: soldan belirtilen sayýda karakteri getirir
select Right(Adi,2) from Personeller
-- Upper : büyük harfa çevirir
select Upper(Adi) from Personeller
-- lower : küçük harfe çevirir
select Lower(Adi) from Personeller
-- substring : belirtilen indeksten itibaren belirtilen sayýda karakteri getirir
select Substring(Adi,3,2) from Personeller
-- Ltrým: soldan boþluklarý siler
select LTRIM('         Paksoy')
-- Rtrým: soldan boþluklarý siler
select LTRIM('Paksoy              ')
-- reverse : ters çevirir
select Reverse(Adi) from Personeller
-- replace : belirtilen ifadeyi belirtilen ifade ile deðiþtirir
select REPLACE('benim adým asel','asel','zehra')
-- charýndex : belirtilen ifadenin veriler içindeki sýralamasýný verir
select adi,CHARINDEX('r',Adi) from Personeller
select MusteriAdi ,CHARINDEX(' ',MusteriAdi)from Musteriler 
--Musteri tablosunda MusteriAdi kolonundan sadece soyadlarýný çekelim LEN : Karakter sayýsý
select SUBSTRING(MusteriAdi,CHARINDEX(' ',MusteriAdi) ,LEN(MusteriAdi) -(CHARINDEX(' ',MusteriAdi) -1)) from Musteriler
