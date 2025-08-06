use Northwind
--Like Sorgularý
-- % :Gerisi önemli olmayan
Select Adi,SoyAdi from Personeller WHERE Adi Like 'j%'
Select Adi,SoyAdi from Personeller WHERE Adi Like '%y'
Select Adi,SoyAdi from Personeller WHERE Adi Like '%ert'
Select * from Personeller where Adi Like 'r%t'
Select Adi from Personeller where Adi like '%an%'
Select Adi from Personeller where Adi like 'n%an%'

-- _ :fark etmez operatörü
-- 2.harfi farketmez
Select * from Personeller where Adi like 'a_d%'
-- 5.harfi farketmez
Select * from Personeller where Adi like 'm___a%'

-- [] : ya da operatörü
Select * from Personeller where Adi like '[nmr]%'
Select * from Personeller where Adi like '%[ai]%'

-- [*-*] : alabetik sýraya göre iki yýldýz arasýnda
Select * from Personeller where Adi like '[a-k]%'

-- [^*] : * deðil operatörü
Select * from Personeller where Adi like '[^a]%'

-- Escape(KAÇIÞ) Karakterleri
-- [] Operatörü ile
-- Escape Operatörü ile
Select * from Personeller where Adi like '[_]%'
Select * from Personeller where Adi like 'a_%' escape 'a'








