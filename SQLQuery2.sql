use Northwind
--Like Sorgular�
-- % :Gerisi �nemli olmayan
Select Adi,SoyAdi from Personeller WHERE Adi Like 'j%'
Select Adi,SoyAdi from Personeller WHERE Adi Like '%y'
Select Adi,SoyAdi from Personeller WHERE Adi Like '%ert'
Select * from Personeller where Adi Like 'r%t'
Select Adi from Personeller where Adi like '%an%'
Select Adi from Personeller where Adi like 'n%an%'

-- _ :fark etmez operat�r�
-- 2.harfi farketmez
Select * from Personeller where Adi like 'a_d%'
-- 5.harfi farketmez
Select * from Personeller where Adi like 'm___a%'

-- [] : ya da operat�r�
Select * from Personeller where Adi like '[nmr]%'
Select * from Personeller where Adi like '%[ai]%'

-- [*-*] : alabetik s�raya g�re iki y�ld�z aras�nda
Select * from Personeller where Adi like '[a-k]%'

-- [^*] : * de�il operat�r�
Select * from Personeller where Adi like '[^a]%'

-- Escape(KA�I�) Karakterleri
-- [] Operat�r� ile
-- Escape Operat�r� ile
Select * from Personeller where Adi like '[_]%'
Select * from Personeller where Adi like 'a_%' escape 'a'








