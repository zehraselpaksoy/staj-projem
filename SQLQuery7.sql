use Northwind 
-- Tablolarrý yan yana birleþtirme
select * from Personeller
select * from Satislar

select * from  Personeller p , Satislar s where p.PersonelID =s.PersonelID