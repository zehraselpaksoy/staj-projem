use Northwind 
-- Tablolarrı yan yana birleştirme
select * from Personeller
select * from Satislar

select * from  Personeller p , Satislar s where p.PersonelID =s.PersonelID