use OrnekVT
-- OUTER JO�N
-- Inner join sayesinde e�le�en kay�tlar� getirebiliyorduk.
-- �imdi ise e�le�meyen kay�tlar�da getirmek i�in outer joinleri kullanaca��z.
-- LEFT join : join ifadesinin solundaki tablodan t�m kay�tlar� getirir.
-- Sa��ndaki tablodan e�le�enleri yan yana e�le�meyenleri null olarak getirir.
Select  * from Oyuncular o Left outer join  filmler f on o.Film�D = f.FilmID
Select  * from filmler f Left outer join   Oyuncular o on o.Film�D = f.FilmID

Select  * from Oyuncular o Left  join  filmler f on o.Film�D = f.FilmID
Select  * from filmler f Left  join   Oyuncular o on o.Film�D = f.FilmID

-- Right join : joinin sa��ndaki tablonun tamam�n� getirecek, solundakinden 
-- e�le�enleri ayn� sat�rsda e�le�meyenleri de null olarak getirecek.
Select  * from Oyuncular o Right outer join  filmler f on o.Film�D = f.FilmID
Select  * from filmler f Right outer join   Oyuncular o on o.Film�D = f.FilmID

Select  * from Oyuncular o Right  join  filmler f on o.Film�D = f.FilmID
Select  * from filmler f Right  join   Oyuncular o on o.Film�D = f.FilmID

-- Full join : joinin 2 taraf�ndaki tablolardan e�le�en e�le�meyen hepsini getirir.
Select  * from Oyuncular o full outer join  filmler f on o.Film�D = f.FilmID
Select  * from filmler f full outer join   Oyuncular o on o.Film�D = f.FilmID

Select  * from Oyuncular o full  join  filmler f on o.Film�D = f.FilmID
Select  * from filmler f full  join   Oyuncular o on o.Film�D = f.FilmID

-- CROSS JOIN : Matematikteki kartezyen �arp�m i�lemini yapar.
-- Bir tablodaki t�m kay�tlar� di�er tablodaki t�m kay�tlarla teker teker e�le�tirir.
USE Northwind
select COUNT(*) FROM Personeller
select COUNT(*) FROM Bolge
select p.Adi ,b.BolgeID from Personeller p Cross join Bolge b



