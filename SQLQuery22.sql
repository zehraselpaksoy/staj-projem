-- Fonksiyonlar (Functions)

-- SQL Server'da 2 temel fonksiyon tipi vardýr:

-- 1. Skaler Fonksiyon (Scalar Function)
--   - Geriye tek bir deðer döner.
--   - Örneðin: int, nvarchar, datetime vb.
--   - Kullanýmý: SELECT dbo.FonksiyonAdi(parametre) gibi.
-- SQL Server Management Studio (SSMS) içinde, fonksiyonlar Programmability -> Functions -> Scalar-valued Functions kýsmýnda oluþturulur ve yönetilir.
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
-- Fonksiyon Kullanýmý
SELECT dbo.Topla(2, 5);   -- 7 döner
SELECT dbo.Topla(10, 20); -- 30 döner
-- Northwind veritabanýnda, verilen bir ürünün birim fiyatý ve stok miktarýna göre %18 KDV dahil toplam maliyetini hesaplayan fonksiyon.
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


-- 2. Satýr Ýçi Fonksiyon (Inline Table-Valued Function)
--   - Geriye bir tablo döner.
--   - Ýçinde BEGIN...END yoktur, doðrudan RETURN SELECT yapýsý ile tanýmlanýr.
--   - Kullanýmý: FROM dbo.FonksiyonAdi(parametre) gibi.
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


-- Fonksiyonlar CREATE FUNCTION komutu ile oluþturulur.
-- Oluþturulan fonksiyonlara aþaðýdaki yoldan eriþilir:
-- Programmability -> Functions (SQL Server Management Studio içinden)
-- Her iki fonksiyon tipi de fiziksel olarak veritabanýnda tutulur.


-- == Fonksiyonlarda With Encryption Komutu ==
-- Eðer ki yazmýþ olduðumuz fonksiyonlarýn kodlarýna 2. 3. þahýslarýn eriþimini engellemek istiyorsak "With Encryption" komutunu kullanmalýyýz.
-- "With Encryption" iþleminden sonra fonksiyonu oluþturan kiþide dahil kimse komutlarý göremez. Geri dönüþ yoktur. Ancak fonksiyonu oluþturan þahsýn komutlarýn yedeðini bulundurmasý gerekmektedir. Ya da "With Encryption" olmaksýzýn fonksiyonu yeniden alterlamalýyýz.
-- "With Encryption" "As" keywordünden önce kullanýlmalýdýr.
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

