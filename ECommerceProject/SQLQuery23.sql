-- == Otomatik Hesaplanabilir Kolonlar -Computed Column ==
-- Herhangi bir kolonda fonksiyon kullanýlarak otomatik hesaplanabilir kolonlar (Computed Column) oluþturmak mümkündür.
Create Function Topla(@sayi1 int,@sayi2 int)returns int 
as
begin
return @sayi1 + @sayi2
end
select UrunAdi ,dbo.Topla(BirimFiyati,HedefStokDüzeyi) HesaplanmisKolon from Urunler
-- Örnek
-- Çýktý olarak kategorisindeki þeklinde bir çýktý veren fonksiyonu yazalým.
-- ürününün toplam fiyatý: __'dýr."
CREATE FUNCTION Rapor
(
    @Kategori NVARCHAR(MAX),
    @UrunAdi NVARCHAR(MAX),
    @BirimFiyati INT,
    @Stok INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Cikti NVARCHAR(MAX) = 
        @Kategori + ' kategorisindeki ' + 
        @UrunAdi + ' ürününün toplam fiyatý: ' + 
        CAST(@BirimFiyati * @Stok AS NVARCHAR(MAX)) + ' dýr.'
    RETURN @Cikti
END
SELECT 
    dbo.Rapor(k.KategoriAdi, u.UrunAdi, u.BirimFiyati, u.HedefStokDuzeyi) 
FROM 
    Urunler u
INNER JOIN 
    Kategoriler k ON u.KategoriID = k.KategoriID;

-- Stored Procedures
CREATE PROC sp_Ornek
(
    @Id INT
)
AS
SELECT * FROM Personeller  WHERE PersonelID = @Id;

CREATE PROC sp_Ornek2
(
    Id INT,
    @Parametre2 INT,
    @Parametre3 NVARCHAR(MAX)
)
AS
SELECT * FROM Personeller WHERE PersonelID = @Id;

-- Stored Procedures (Saklý Yordamlar)
-- == Stored Procedure Kullanýmý ==
--Stored Procedure yapýlarýný "Exec" komutu eþliðinde çalýþtýrabilmekteyiz.
EXEC sp_Ornek  3;
EXEC sp_Ornek2 3, 4, 'asd';

-- Stored Procedures (Saklý Yordamlar)
-- == Geriye Deðer Döndüren Stored Procedure Yapýsý ==
CREATE PROC UrunGetir
(
    @Fiyat MONEY
)
AS
    SELECT * 
    FROM Urunler 
    WHERE BirimFiyati > @Fiyat;
    RETURN @@ROWCOUNT;
-- == Kullanýmý ==
EXEC UrunGetir 40;
-- Bu þekilde sadece sorgunun sonucu (ürünler) ekrana yazdýrýlýr, RETURN deðeri kullanýlmaz.
DECLARE @Sonuc INT;

EXEC @Sonuc = UrunGetir 40;

PRINT CAST(@Sonuc AS NVARCHAR(MAX)) + ' adet ürün bu iþlemden etkilenmiþtir.';

-- Stored Procedures (Saklý Yordamlar)
-- == Output Ýle Deðer Döndürme ==
CREATE PROC sp_Ornek3
(
    @Id INT,
    @Adi NVARCHAR(MAX) OUTPUT,
    @SoyAdi NVARCHAR(MAX) OUTPUT
)
AS
    SELECT 
        @Adi = Adi,
        @SoyAdi = SoyAdi
    FROM Personeller
    WHERE PersonelID = @Id;

-- Kullanýmý
DECLARE @Adi NVARCHAR(MAX), @SoyAdi NVARCHAR(MAX);
EXEC sp_Ornek3 3, @Adi OUTPUT, @SoyAdi OUTPUT;
SELECT @Adi + ' ' + @SoyAdi 

-- == Parametrelere Varsayýlan Deðer  ==
CREATE PROC sp_PersonelEkle2
(
    @Ad VARCHAR(50) = 'Ýsimsiz',
    @SoyAd VARCHAR(50) = 'Soyadsýz',
    @Sehir VARCHAR(50) = 'Þehir girilmemiþ'
)
AS
    INSERT  Personeller (Adi, SoyAdi, Sehir)
    VALUES (@Ad, @SoyAd, @Sehir);
-- Kullaným
EXEC sp_PersonelEkle2 'Gökhan', 'Aþker', 'Hatay';
Tüm deðerler elle verildiði için varsayýlanlar kullanýlmaz.
SELECT * FROM Personeller;
EXEC sp_PersonelEkle2 'Ýbrahim';
-- Normalde bu þekilde parametrelere deðer göndermeksizin çalýþmamasý lazým ama
-- varsayýlan deðerler tanýmda belirtildiði için devreye girmektedirler.
EXEC sp_PersonelEkle2 'Ýbrahim';
-- @Adi parametresi "Ýbrahim" deðerini alacaktýr. Diðer parametreler varsayýlan

-- Exec komutu 
Exec('Select * from Personeller')
Select * from Personeller

-- Yanlýþ kullanýmý
Exec('Declare @Sayac int = 0')
Exec(' print @Sayac ')

-- Doðru Kullanýmý
Exec('Declare @Sayac int = 0 print @Sayac')

-- == Stored Procedure Ýçerisinde Nesne Oluþturma  ==
CREATE PROC sp_TableOlustur
(
    @TabloAdi NVARCHAR(MAX),
    @Kolon1Adi NVARCHAR(MAX),
    @Kolon1Ozellikleri NVARCHAR(MAX),
    @Kolon2Adi NVARCHAR(MAX),
    @Kolon2Ozellikleri NVARCHAR(MAX)
)
AS
 EXEC( 'CREATE TABLE ' + @TabloAdi + ' (' +
        @Kolon1Adi + ' ' + @Kolon1Ozellikleri + ', ' +
        @Kolon2Adi + ' ' + @Kolon2Ozellikleri + ')')

exec sp_TableOlustur 'OrnekTablo','Id','int primary key identity(1,1)','Kolon2','NVARCHAR(MAX)'