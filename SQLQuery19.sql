-- ÝF YAPISI
-- =   : Eþitse       C# ==
-- <>  : Eþit deðilse C# !=
-- <   : Küçükse
-- >   : Büyükse
-- Tek satýrlýk çalýþma
DECLARE @Isim NVARCHAR(MAX)
SET @Isim = 'zehra'

IF @Isim = 'zehra'
    PRINT 'Evet'
ELSE
    PRINT 'Hayýr'

-- Begin end yapýsý (Scope)
DECLARE @Sayi1 INT = 3
DECLARE @Sayi2 INT = 5

IF @Sayi1 < @Sayi2
BEGIN
    PRINT 'Evet Sayi1 Sayi2''den küçüktür.'
    SELECT @Sayi1 AS [Sayý 1], @Sayi2 AS [Sayý 2]
END
ELSE
BEGIN
    PRINT 'Hayýr Sayi1 Sayi2''den küçük deðildir.'
    SELECT @Sayi1 AS [Sayý 1], @Sayi2 AS [Sayý 2]
END
-- Örnek 1
-- Müþteriler tablosunda Amerikalý (USA) müþteri var mý?
SELECT * FROM Musteriler
WHERE Ulke = 'ABD';

IF @@ROWCOUNT > 0
    PRINT 'Evet';
ELSE
    PRINT 'Hayýr';

--Örnek 2
-- Adý 'Gençay soyadý 'Yýldýz' olan Personel var mý? Varsa evet var desin. Yoksa kaydetsin.
DECLARE @Adi NVARCHAR(MAX) = 'zehra',
        @SoyAdi NVARCHAR(MAX) = 'paksoy';

SELECT * FROM Personeller 
WHERE Adi = @Adi AND SoyAdi = @SoyAdi;

IF @@ROWCOUNT > 0
BEGIN
    PRINT 'Evet, kayýt var.';
END
ELSE
BEGIN
    PRINT 'Hayýr, kayýt yok...';

    INSERT INTO Personeller (Adi, SoyAdi)
    VALUES (@Adi, @SoyAdi);
END

-- IF – ELSE IF – ELSE 
DECLARE @Adi NVARCHAR(MAX) = 'zehra';
DECLARE @Yas INT = 25;

IF @Adi = 'Mahmut'
    PRINT 'Evet Mahmut';
ELSE IF @Yas > 24
    PRINT 'Yaþý 24''ten büyük.';
ELSE IF 3 > 5
    PRINT '';
ELSE IF 1 > 1
    PRINT 'Eþit';
ELSE
    PRINT 'abc';

-- EXISTS Fonksiyonu
IF EXISTS (SELECT * FROM Personeller)
    PRINT 'Dolu';
ELSE
    PRINT 'Boþ';

-- While 
DECLARE @Sayac INT = 0;

WHILE @Sayac < 100
BEGIN
    PRINT @Sayac;
    SET @Sayac = @Sayac + 1;
END

-- While döngüsünde break  komutu

DECLARE @Sayac1 INT = 0;

WHILE @Sayac1 < 1000
 BEGIN
    PRINT @Sayac1;
    SET @Sayac1 = @Sayac1 + 1;
    if @Sayac1 % 5 = 0
       break
END

-- While döngüsünde continue komutu
DECLARE @Sayac2 INT = 0;

WHILE @Sayac2 < 1000
 BEGIN
  if @Sayac2 % 5 = 0
  BEGIN
      SET @Sayac2 = @Sayac2 + 1;
       continue
       END
    PRINT @Sayac2;
    SET @Sayac2 = @Sayac2 + 1;
 END
