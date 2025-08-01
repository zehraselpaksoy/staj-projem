-- �F YAPISI
-- =   : E�itse       C# ==
-- <>  : E�it de�ilse C# !=
-- <   : K���kse
-- >   : B�y�kse
-- Tek sat�rl�k �al��ma
DECLARE @Isim NVARCHAR(MAX)
SET @Isim = 'zehra'

IF @Isim = 'zehra'
    PRINT 'Evet'
ELSE
    PRINT 'Hay�r'

-- Begin end yap�s� (Scope)
DECLARE @Sayi1 INT = 3
DECLARE @Sayi2 INT = 5

IF @Sayi1 < @Sayi2
BEGIN
    PRINT 'Evet Sayi1 Sayi2''den k���kt�r.'
    SELECT @Sayi1 AS [Say� 1], @Sayi2 AS [Say� 2]
END
ELSE
BEGIN
    PRINT 'Hay�r Sayi1 Sayi2''den k���k de�ildir.'
    SELECT @Sayi1 AS [Say� 1], @Sayi2 AS [Say� 2]
END
-- �rnek 1
-- M��teriler tablosunda Amerikal� (USA) m��teri var m�?
SELECT * FROM Musteriler
WHERE Ulke = 'ABD';

IF @@ROWCOUNT > 0
    PRINT 'Evet';
ELSE
    PRINT 'Hay�r';

--�rnek 2
-- Ad� 'Gen�ay soyad� 'Y�ld�z' olan Personel var m�? Varsa evet var desin. Yoksa kaydetsin.
DECLARE @Adi NVARCHAR(MAX) = 'zehra',
        @SoyAdi NVARCHAR(MAX) = 'paksoy';

SELECT * FROM Personeller 
WHERE Adi = @Adi AND SoyAdi = @SoyAdi;

IF @@ROWCOUNT > 0
BEGIN
    PRINT 'Evet, kay�t var.';
END
ELSE
BEGIN
    PRINT 'Hay�r, kay�t yok...';

    INSERT INTO Personeller (Adi, SoyAdi)
    VALUES (@Adi, @SoyAdi);
END

-- IF � ELSE IF � ELSE 
DECLARE @Adi NVARCHAR(MAX) = 'zehra';
DECLARE @Yas INT = 25;

IF @Adi = 'Mahmut'
    PRINT 'Evet Mahmut';
ELSE IF @Yas > 24
    PRINT 'Ya�� 24''ten b�y�k.';
ELSE IF 3 > 5
    PRINT '';
ELSE IF 1 > 1
    PRINT 'E�it';
ELSE
    PRINT 'abc';

-- EXISTS Fonksiyonu
IF EXISTS (SELECT * FROM Personeller)
    PRINT 'Dolu';
ELSE
    PRINT 'Bo�';

-- While 
DECLARE @Sayac INT = 0;

WHILE @Sayac < 100
BEGIN
    PRINT @Sayac;
    SET @Sayac = @Sayac + 1;
END

-- While d�ng�s�nde break  komutu

DECLARE @Sayac1 INT = 0;

WHILE @Sayac1 < 1000
 BEGIN
    PRINT @Sayac1;
    SET @Sayac1 = @Sayac1 + 1;
    if @Sayac1 % 5 = 0
       break
END

-- While d�ng�s�nde continue komutu
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
