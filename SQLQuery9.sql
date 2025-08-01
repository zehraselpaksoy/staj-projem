use OrnekVT
-- OUTER JOÝN
-- Inner join sayesinde eþleþen kayýtlarý getirebiliyorduk.
-- Þimdi ise eþleþmeyen kayýtlarýda getirmek için outer joinleri kullanacaðýz.
-- LEFT join : join ifadesinin solundaki tablodan tüm kayýtlarý getirir.
-- Saðýndaki tablodan eþleþenleri yan yana eþleþmeyenleri null olarak getirir.
Select  * from Oyuncular o Left outer join  filmler f on o.FilmýD = f.FilmID
Select  * from filmler f Left outer join   Oyuncular o on o.FilmýD = f.FilmID

Select  * from Oyuncular o Left  join  filmler f on o.FilmýD = f.FilmID
Select  * from filmler f Left  join   Oyuncular o on o.FilmýD = f.FilmID

-- Right join : joinin saðýndaki tablonun tamamýný getirecek, solundakinden 
-- eþleþenleri ayný satýrsda eþleþmeyenleri de null olarak getirecek.
Select  * from Oyuncular o Right outer join  filmler f on o.FilmýD = f.FilmID
Select  * from filmler f Right outer join   Oyuncular o on o.FilmýD = f.FilmID

Select  * from Oyuncular o Right  join  filmler f on o.FilmýD = f.FilmID
Select  * from filmler f Right  join   Oyuncular o on o.FilmýD = f.FilmID

-- Full join : joinin 2 tarafýndaki tablolardan eþleþen eþleþmeyen hepsini getirir.
Select  * from Oyuncular o full outer join  filmler f on o.FilmýD = f.FilmID
Select  * from filmler f full outer join   Oyuncular o on o.FilmýD = f.FilmID

Select  * from Oyuncular o full  join  filmler f on o.FilmýD = f.FilmID
Select  * from filmler f full  join   Oyuncular o on o.FilmýD = f.FilmID

-- CROSS JOIN : Matematikteki kartezyen çarpým iþlemini yapar.
-- Bir tablodaki tüm kayýtlarý diðer tablodaki tüm kayýtlarla teker teker eþleþtirir.
USE Northwind
select COUNT(*) FROM Personeller
select COUNT(*) FROM Bolge
select p.Adi ,b.BolgeID from Personeller p Cross join Bolge b



