-- Fonksiyonlar (Functions)

-- SQL Server'da 2 temel fonksiyon tipi vard�r:

-- 1. Skaler Fonksiyon (Scalar Function)
--   - Geriye tek bir de�er d�ner.
--   - �rne�in: int, nvarchar, datetime vb.
--   - Kullan�m�: SELECT dbo.FonksiyonAdi(parametre) gibi.
-- SQL Server Management Studio (SSMS) i�inde, fonksiyonlar Programmability -> Functions -> Scalar-valued Functions k�sm�nda olu�turulur ve y�netilir.
CREATE FUNCTION Topla
(
    @Sayi1 INT,
    @Sayi2 INT
)
RETURNS INT
AS
BEGIN
    RETURN (@Sayi1 + @Sayi2)
END
-- Fonksiyon Kullan�m�
SELECT dbo.Topla(2, 5);   -- 7 d�ner
SELECT dbo.Topla(10, 20); -- 30 d�ner
-- Northwind veritaban�nda, verilen bir �r�n�n birim fiyat� ve stok miktar�na g�re %18 KDV dahil toplam maliyetini hesaplayan fonksiyon.
CREATE FUNCTION Maliyet
(
    @BirimFiyati INT,
    @StokMiktari INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
      DECLARE @Sonuc int = @BirimFiyati * @StokMiktari * 1.18;
     RETURN @Sonuc 
END
select dbo.Maliyet(10,20)


-- 2. Sat�r ��i Fonksiyon (Inline Table-Valued Function)
--   - Geriye bir tablo d�ner.
--   - ��inde BEGIN...END yoktur, do�rudan RETURN SELECT yap�s� ile tan�mlan�r.
--   - Kullan�m�: FROM dbo.FonksiyonAdi(parametre) gibi.
CREATE FUNCTION fc_Gonder
(
    @Ad NVARCHAR(20),
    @Soyad NVARCHAR(20)
)
RETURNS TABLE
AS
RETURN
    SELECT Adi, Soyadi
    FROM Personeller
    WHERE Adi = @Ad AND Soyadi = @Soyad

SELECT * FROM dbo.fc_Gonder('Nancy', 'Davolio');


-- Fonksiyonlar CREATE FUNCTION komutu ile olu�turulur.
-- Olu�turulan fonksiyonlara a�a��daki yoldan eri�ilir:
-- Programmability -> Functions (SQL Server Management Studio i�inden)
-- Her iki fonksiyon tipi de fiziksel olarak veritaban�nda tutulur.


-- == Fonksiyonlarda With Encryption Komutu ==
-- E�er ki yazm�� oldu�umuz fonksiyonlar�n kodlar�na 2. 3. �ah�slar�n eri�imini engellemek istiyorsak "With Encryption" komutunu kullanmal�y�z.
-- "With Encryption" i�leminden sonra fonksiyonu olu�turan ki�ide dahil kimse komutlar� g�remez. Geri d�n�� yoktur. Ancak fonksiyonu olu�turan �ahs�n komutlar�n yede�ini bulundurmas� gerekmektedir. Ya da "With Encryption" olmaks�z�n fonksiyonu yeniden alterlamal�y�z.
-- "With Encryption" "As" keyword�nden �nce kullan�lmal�d�r.
CREATE FUNCTION OrnekFonksiyon()
RETURNS INT
WITH ENCRYPTION
AS
BEGIN
    RETURN 3;
END

CREATE FUNCTION OrnekFonksiyon2()
RETURNS TABLE
WITH ENCRYPTION
AS
RETURN SELECT * FROM Personeller

