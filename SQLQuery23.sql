-- == Otomatik Hesaplanabilir Kolonlar -Computed Column ==
-- Herhangi bir kolonda fonksiyon kullan�larak otomatik hesaplanabilir kolonlar (Computed Column) olu�turmak m�mk�nd�r.
Create Function Topla(@sayi1 int,@sayi2 int)returns int 
as
begin
return @sayi1 + @sayi2
end
select UrunAdi ,dbo.Topla(BirimFiyati,HedefStokD�zeyi) HesaplanmisKolon from Urunler
-- �rnek
-- ��kt� olarak kategorisindeki �eklinde bir ��kt� veren fonksiyonu yazal�m.
-- �r�n�n�n toplam fiyat�: __'d�r."
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
        @UrunAdi + ' �r�n�n�n toplam fiyat�: ' + 
        CAST(@BirimFiyati * @Stok AS NVARCHAR(MAX)) + ' d�r.'
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

-- Stored Procedures (Sakl� Yordamlar)
-- == Stored Procedure Kullan�m� ==
--Stored Procedure yap�lar�n� "Exec" komutu e�li�inde �al��t�rabilmekteyiz.
EXEC sp_Ornek  3;
EXEC sp_Ornek2 3, 4, 'asd';

-- Stored Procedures (Sakl� Yordamlar)
-- == Geriye De�er D�nd�ren Stored Procedure Yap�s� ==
CREATE PROC UrunGetir
(
    @Fiyat MONEY
)
AS
    SELECT * 
    FROM Urunler 
    WHERE BirimFiyati > @Fiyat;
    RETURN @@ROWCOUNT;
-- == Kullan�m� ==
EXEC UrunGetir 40;
-- Bu �ekilde sadece sorgunun sonucu (�r�nler) ekrana yazd�r�l�r, RETURN de�eri kullan�lmaz.
DECLARE @Sonuc INT;

EXEC @Sonuc = UrunGetir 40;

PRINT CAST(@Sonuc AS NVARCHAR(MAX)) + ' adet �r�n bu i�lemden etkilenmi�tir.';

-- Stored Procedures (Sakl� Yordamlar)
-- == Output �le De�er D�nd�rme ==
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

-- Kullan�m�
DECLARE @Adi NVARCHAR(MAX), @SoyAdi NVARCHAR(MAX);
EXEC sp_Ornek3 3, @Adi OUTPUT, @SoyAdi OUTPUT;
SELECT @Adi + ' ' + @SoyAdi 

-- == Parametrelere Varsay�lan De�er  ==
CREATE PROC sp_PersonelEkle2
(
    @Ad VARCHAR(50) = '�simsiz',
    @SoyAd VARCHAR(50) = 'Soyads�z',
    @Sehir VARCHAR(50) = '�ehir girilmemi�'
)
AS
    INSERT  Personeller (Adi, SoyAdi, Sehir)
    VALUES (@Ad, @SoyAd, @Sehir);
-- Kullan�m
EXEC sp_PersonelEkle2 'G�khan', 'A�ker', 'Hatay';
T�m de�erler elle verildi�i i�in varsay�lanlar kullan�lmaz.
SELECT * FROM Personeller;
EXEC sp_PersonelEkle2 '�brahim';
-- Normalde bu �ekilde parametrelere de�er g�ndermeksizin �al��mamas� laz�m ama
-- varsay�lan de�erler tan�mda belirtildi�i i�in devreye girmektedirler.
EXEC sp_PersonelEkle2 '�brahim';
-- @Adi parametresi "�brahim" de�erini alacakt�r. Di�er parametreler varsay�lan

-- Exec komutu 
Exec('Select * from Personeller')
Select * from Personeller

-- Yanl�� kullan�m�
Exec('Declare @Sayac int = 0')
Exec(' print @Sayac ')

-- Do�ru Kullan�m�
Exec('Declare @Sayac int = 0 print @Sayac')

-- == Stored Procedure ��erisinde Nesne Olu�turma  ==
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