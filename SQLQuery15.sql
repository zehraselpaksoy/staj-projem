--DDL

-- T-SQL de veritabaný nesneleri yaratmamýzý saðlayan ve bu nesneler üzerinde deðiþiklikler yapmamýzý 
-- ve silmemizi saðlayan yapýlar bu baþlýk altýnda simgilenmektedir.

-- Create,Alter,Drop

-- Create

-- Veritabaný nesnesi yaratmamýzý saðlar. (database, table, view, storedproc, trigger v.s)

-- Prototipi
-- Create [Nesne] [Nesnenin Adý]
-- =Create Ýle Database Oluþturma

Create DataBase OrnekVeritabani

-- Bu þekilde bir kullaným varsayýlan ayarlarda veritabaný oluþturacaktýr.

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
-- Create Ýle Tablo Oluþturma

USE OrnekVeritabani

Create table OrnekTablo 

(

Kolon1 int,

Kolon2 nvarchar(MAX),

Kolon3 money

-- Eðer kolon adlarýnda boþluk varsa köþeli parantez ile belirtilmelidir.

Create table OrnekTablo2 
(

[Kolon 1] int,

[Kolon 2] nvarchar(MAX),

[Kolon 3] money
 
-- =Kolona Primary Key ve Identity Özelliði Kazandýrmak

Create table OrnekTablo3 

(

Id int Primary key identity(1,1),

[Kolon 2] nvarchar(MAX),

[Kolon 3] money