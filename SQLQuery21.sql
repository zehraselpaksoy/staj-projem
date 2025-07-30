-- View Yapısı

-- Kullanım Amacı ===

-- Genellikle karmaşık sorguların tek bir sorgu üzerinden çalıştırılabilmesidir.
-- Bu amaçla raporlama işlemlerinde kullanılabilirler.
-- Aynı zamanda güvenlik ihtiyacı olduğu durumlarda herhangi bir sorgunun 
-- 2. veya 3. şahıslardan gizlenmesi amacıyla da kullanılırlar.


-- Genel Özellikleri ===

-- Herhangi bir sorgunun sonucunu tablo olarak ele alıp, ondan sorgu çekilebilmesini sağlarlar.
-- INSERT, UPDATE ve DELETE işlemleri yapılabilir. Bu işlemler fiziksel tabloya yansır. ***Önemli
-- View yapıları fiziksel olarak oluşturulan yapılardır.
-- View yapıları normal sorgulardan daha yavaş çalışırlar.

-- Dikkat!!!
-- Database elemanlarını CREATE komutuyla oluşturuyorduk.
-- View yapısı da bir database nesnesi olduğu için CREATE komutu ile oluşturulur.


-- View Oluşturma Örneği:
CREATE VIEW vw_Gotur AS
SELECT 
    p.Adi + ' ' + p.SoyAdi AS [Adı Soyadı],
    k.KategoriAdi  [Kategori Adı],
    COUNT(s.SatisID)  [Toplam Satış]
FROM Personeller p
INNER JOIN Satislar s ON p.PersonelID = s.PersonelID
INNER JOIN [Satis Detaylari] sd ON s.SatisID = sd.SatisID
INNER JOIN Urunler u ON sd.UrunID = u.UrunID
INNER JOIN Kategoriler k ON k.KategoriID = u.KategoriID
GROUP BY p.Adi+ ' ' +  p.SoyAdi, k.KategoriAdi;

select * from vw_Gotur
select * from vw_Gotur where [Adı Soyadı] Like '%Robert%'

-- View Kullanımı Hakkında Ek Bilgiler
-- View oluşturulurken kolonlara verilen alias (takma adlar),
-- view'den veri çekilirken de kullanılır.
-- Aynı zamanda view içinde alias tanımlayarak,
-- kullanılan gerçek tablo kolon adları gizlenmiş olur.
-- View içinde doğrudan ORDER BY kullanılamaz.
-- Sıralama yapmak istiyorsan view'i kullanırken yapılmalıdır.
-- Örnek:
SELECT * FROM vw_Gotur
ORDER BY [Toplam Satış];
-- Eğer illa ki view içinde ORDER BY kullanmak istiyorsan
-- TOP ifadesiyle birlikte kullanman gerekir.
-- Ancak bu yöntem önerilmez çünkü view'in sıralı veri döndürmesi garantilenemez.
-- Örnek: ORDER BY içeren bir view oluşturma (TOP ile birlikte)
CREATE VIEW vw_Gotur AS
SELECT TOP 100
    p.Adi + ' ' + p.SoyAdi AS [Adı Soyadı],
    k.KategoriAdi AS [Kategori Adı],
    COUNT(s.SatisID) AS [Toplam Satış]
FROM Personeller p
INNER JOIN Satislar s ON p.PersonelID = s.PersonelID
INNER JOIN [Satis Detaylari] sd ON s.SatisID = sd.SatisID
INNER JOIN Urunler u ON sd.UrunID = u.UrunID
INNER JOIN Kategoriler k ON k.KategoriID = u.KategoriID
GROUP BY p.Adi, p.SoyAdi, k.KategoriAdi
ORDER BY [Toplam Satış]; 
-- View içinde kullanılabildi çünkü TOP kullanıldı
-- ❗ NOT:
-- Bu şekilde sıralama yapmak önerilmez. Çünkü view üzerinde yapılan sorgular 
-- planlama aşamasında sıralamayı göz ardı edebilir.
-- View Üzerinde Veri İşlemleri:
-- View'ler üzerinden INSERT, DELETE ve UPDATE yapılabilir.
-- Bu işlemler, arkasındaki fiziksel tablolara yansıtılır.

CREATE VIEW OrnekViewPersoneller AS
SELECT Adi, SoyAdi, Unvan
FROM Personeller;
INSERT  OrnekViewPersoneller (Adi, SoyAdi, Unvan) VALUES ('Gençay', 'Yıldız', 'Yzlm. Vrtbn. Uzmn')
UPDATE OrnekViewPersoneller SET Adi = 'gençay' WHERE Adi = 'Gençay'
DELETE FROM OrnekViewPersoneller WHERE Adi = 'Gençay';

-- View Yapısı: WITH ENCRYPTION Komutu

-- == WITH ENCRYPTION Nedir? ==

-- Eğer oluşturduğumuz bir view’in kaynak kodlarının (SQL sorgusunun)
-- başkaları tarafından görülmesini istemiyorsak,
-- view’i **WITH ENCRYPTION** ifadesiyle oluşturmalıyız.

-- Bu işlem yapıldığında:
-- - Object Explorer'dan "Design" ile açmak mümkün olmaz.
-- - Komut içeriği SELECT OBJECT_DEFINITION(OBJECT_ID('ViewAdi')) ile dahi okunamaz.
-- - Oluşturan kişi dahil kimse view'in içeriğini göremez.
-- - Geri dönüş yoktur. Mutlaka **orijinal sorgunun yedeği** alınmalıdır!

-- Dikkat: WITH ENCRYPTION ifadesi, AS anahtar kelimesinden önce yazılmalıdır!

CREATE VIEW OrnekViewPersoneller
WITH ENCRYPTION
AS
SELECT Adi, SoyAdi, Unvan
FROM Personeller;
-- Bu işlemi yaptıktan sonra Design Modu kapatılmıştır.

-- == WITH SCHEMABINDING Komutu ile ===

-- Bir view’in bağlı olduğu fiziksel tablolarda yapılan değişiklikler (örneğin kolon silme, isim değiştirme),
-- view'in bozulmasına ve çalışmamasına neden olabilir.

-- Bu gibi riskleri önlemek için view, kullandığı tablolarla birlikte kilitlenebilir.
-- Bu koruma, **WITH SCHEMABINDING** komutu ile sağlanır.

-- Bu sayede view, bağlı olduğu tabloların yapısı değiştirilmeden önce engel koyar.
-- Yani view silinmeden tablo kolonlarını silemez veya değiştiremezsiniz.

-- ❗ ÖNEMLİ:
-- - SCHEMABINDING ile view oluştururken, view içinde kullanılan tüm tablo adları **şema adıyla birlikte** (örneğin: dbo.Personeller) yazılmalıdır.
-- - **WITH SCHEMABINDING**, `AS` anahtar kelimesinden **önce** yazılmalıdır.
CREATE TABLE OrnekTablo
(
    Id INT PRIMARY KEY,           -- Birincil anahtar
    Kolon1 NVARCHAR(MAX)          -- Başlangıçta nvarchar tipinde
);
CREATE VIEW OrnekView
WITH SCHEMABINDING
AS
SELECT Id, Kolon1
FROM dbo.OrnekTablo;
-- Bu işlem aşağıdaki gibi yapılmak istenirse hata verecektir:

ALTER TABLE OrnekTablo
ALTER COLUMN Kolon1 INT;

-- == WITH CHECK OPTION Komutu ile ===
-- Amaç:
-- View içinde tanımlanan WHERE şartına uygun olmayan kayıtların INSERT veya UPDATE ile eklenmesini engeller.
-- Sadece view’in filtreleme şartına uyan kayıtların eklenmesine izin verir.
-- 📌 Kullanım Notu:
-- "WITH ENCRYPTION" ve "WITH SCHEMABINDING" → `AS` anahtar kelimesinden önce yazılır.
-- "WITH CHECK OPTION" → view sorgusunun en sonuna (WHERE'den sonra) yazılır.
-------------------------------------------------------
-- Örnek 1: WITH CHECK OPTION Olmadan View Oluşturma
-------------------------------------------------------
CREATE VIEW OrnekView2
AS
SELECT Adi, SoyAdi
FROM Personeller
WHERE Adi LIKE 'a%';
-- Bu durumda, view'e şarta uymayan veri de INSERT edilebilir.
-- Geçerli INSERT (uyuyor):
INSERT  OrnekView2 (Adi, SoyAdi) VALUES ('Ahmet', 'Bilmemneoğlu');
-- Geçersiz ama kabul edilir (uymaz ama engel yok çünkü CHECK yok):
INSERT  OrnekView2 (Adi, SoyAdi) VALUES ('Gençay', 'Yıldız');
-- View'den veri çek:
SELECT * FROM OrnekView2;
-- "Gençay" view'de görünmez çünkü WHERE şartına uymuyor.
-------------------------------------------------------
-- Örnek 2: WITH CHECK OPTION ile View Oluşturma
-------------------------------------------------------
CREATE VIEW OrnekView2
AS
SELECT Adi, SoyAdi
FROM Personeller
WHERE Adi LIKE 'a%'
WITH CHECK OPTION;
-- Bu durumda, sadece şarta uyan kayıtlar view'e eklenebilir.


