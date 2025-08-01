--DDL

-- T-SQL de veritaban� nesneleri yaratmam�z� sa�layan ve bu nesneler �zerinde de�i�iklikler yapmam�z� 
-- ve silmemizi sa�layan yap�lar bu ba�l�k alt�nda simgilenmektedir.

-- Create,Alter,Drop

-- Create

-- Veritaban� nesnesi yaratmam�z� sa�lar. (database, table, view, storedproc, trigger v.s)

-- Prototipi
-- Create [Nesne] [Nesnenin Ad�]
-- =Create �le Database Olu�turma

Create DataBase OrnekVeritabani

-- Bu �ekilde bir kullan�m varsay�lan ayarlarda veritaban� olu�turacakt�r.

Create Database OrnekVeritabani

On
(

Name = 'GG',

FileName = 'D:\GG.mdf',

Size = 5,

FileGrowth = 3

)
Log
On
(

Name = 'GG',

FileName = 'D:\GG.mdf',

Size = 5,

FileGrowth = 3

)
-- Create �le Tablo Olu�turma

USE OrnekVeritabani

Create table OrnekTablo 

(

Kolon1 int,

Kolon2 nvarchar(MAX),

Kolon3 money

-- E�er kolon adlar�nda bo�luk varsa k��eli parantez ile belirtilmelidir.

Create table OrnekTablo2 
(

[Kolon 1] int,

[Kolon 2] nvarchar(MAX),

[Kolon 3] money
 
-- =Kolona Primary Key ve Identity �zelli�i Kazand�rmak

Create table OrnekTablo3 

(

Id int Primary key identity(1,1),

[Kolon 2] nvarchar(MAX),

[Kolon 3] money