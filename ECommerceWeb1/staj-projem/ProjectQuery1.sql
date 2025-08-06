CREATE DATABASE ECommerceDb;
GO

USE ECommerceDb;
GO

CREATE TABLE Users (
    Id INT IDENTITY PRIMARY KEY,
    Email NVARCHAR(255) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    FullName NVARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Categories (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    ParentId INT NULL,
    CONSTRAINT FK_Categories_Parent FOREIGN KEY (ParentId) REFERENCES Categories(Id)
);

CREATE TABLE Products (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX),
    Price DECIMAL(18,2) NOT NULL,
    Stock INT NOT NULL,
    CategoryId INT NOT NULL,
    CONSTRAINT FK_Products_Category FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);

CREATE TABLE Favorites (
    Id INT IDENTITY PRIMARY KEY,
    UserId INT NOT NULL,
    ProductId INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Favorites_User FOREIGN KEY (UserId) REFERENCES Users(Id),
    CONSTRAINT FK_Favorites_Product FOREIGN KEY (ProductId) REFERENCES Products(Id)
);

CREATE TABLE CartItems (
    Id INT IDENTITY PRIMARY KEY,
    UserId INT NULL,
    SessionId NVARCHAR(100) NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_CartItems_Product FOREIGN KEY (ProductId) REFERENCES Products(Id)
);

CREATE TABLE Orders (
    Id INT IDENTITY PRIMARY KEY,
    UserId INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) NOT NULL,
    TotalAmount DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_Orders_User FOREIGN KEY (UserId) REFERENCES Users(Id)
);

CREATE TABLE OrderItems (
    Id INT IDENTITY PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_OrderItems_Order FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    CONSTRAINT FK_OrderItems_Product FOREIGN KEY (ProductId) REFERENCES Products(Id)
);



-- Ana kategoriler
INSERT INTO Categories (Name, ParentId) VALUES ('Erkek', NULL);
INSERT INTO Categories (Name, ParentId) VALUES ('Kad�n', NULL);
INSERT INTO Categories (Name, ParentId) VALUES ('Bebek', NULL);

INSERT INTO Categories (Name, ParentId)
VALUES ('Aksesuar', 178);

INSERT INTO Categories (Name, ParentId)
VALUES
('Parf�m', 181),
('�apka', 181);

INSERT INTO Categories (Name, ParentId)
VALUES ('Aksesuar', 179);

INSERT INTO Categories (Name, ParentId)
VALUES
('K�z Bebek', 180),
('Erkek Bebek', 180);

-- 2. Aksesuar'� Kad�n'�n alt kategorisi olarak ekle

INSERT INTO Categories (Name, ParentId)
VALUES 
('K�pe', 182),
('Kemer', 182),
('Kolye', 182);

INSERT INTO Categories (Name, ParentId) VALUES ('Giyim', 178);
INSERT INTO Categories (Name, ParentId) VALUES ('Ayakkab�', 178);
INSERT INTO Categories (Name, ParentId) VALUES ('�anta', 178);

-- Kad�n alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Giyim', 179);
INSERT INTO Categories (Name, ParentId) VALUES ('Ayakkab�', 179);
INSERT INTO Categories (Name, ParentId) VALUES ('�anta', 179);



-- Erkek Giyim alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('G�mlek',188);
INSERT INTO Categories (Name, ParentId) VALUES ('Pantolon', 188);

-- Erkek Ayakkab� alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Deri', 189);
INSERT INTO Categories (Name, ParentId) VALUES ('S�vet', 189);

-- Erkek �anta alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Deri', 190);
INSERT INTO Categories (Name, ParentId) VALUES ('S�vet', 190);

-- Kad�n Giyim alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('G�mlek', 191);
INSERT INTO Categories (Name, ParentId) VALUES ('Pantolon', 191);

-- Kad�n Ayakkab� alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Deri', 192);
INSERT INTO Categories (Name, ParentId) VALUES ('S�vet', 192);

-- Kad�n �anta alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Deri', 193);
INSERT INTO Categories (Name, ParentId) VALUES ('S�vet', 193);

-- Kad�n > Giyim kategorisinin Id'si 6 (�nceki tablodan)
INSERT INTO Categories (Name, ParentId)
VALUES 
('Ti��rt', 191),
('�ort', 191),
('Kazak', 191),
('Ceket', 191);

-- Erkek > Giyim kategorisinin Id'si 3
INSERT INTO Categories (Name, ParentId)
VALUES 
('Ti��rt', 188),
('�ort', 188),
('Kazak', 188),
('Ceket', 188);

-- 1. Kad�n kategorisinin Id'si 2
-- 2. Aksesuar'� Kad�n'�n alt kategorisi olarak ekle

INSERT INTO Categories (Name, ParentId)
VALUES 
('K�pe', 182),
('Kemer', 182),
('Kolye', 182);


INSERT INTO Categories (Name, ParentId)
VALUES
('Parf�m', 181),
('�apka', 181);



INSERT INTO Categories (Name, ParentId)
VALUES
('Toka', 194),
('Ti��rt', 194),
('�ort', 194),
('Elbise', 194);

INSERT INTO Categories (Name, ParentId)
VALUES
('�ort', 195),
('G�mlek', 195),
('Ti��rt', 195),
('�apka', 195);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Erkek Siyah �ort', '��k ve rahat erkek �ort', 178.00, 50, 222),
('Erkek Resmi Ceket ', '��k erkek ceket', 480.00, 25, 224),
('Erkek G�mlek Slim Fit', '��k ve rahat erkek g�mlek', 180.00, 50, 205),
('Erkek Pantolon Klasik', 'Konforlu ve dayan�kl� klasik pantolon', 210.00, 40, 206),
('Erkek Ti��rt Casual', 'G�nl�k kullan�m i�in ti��rt', 90.00, 70, 221),
('Erkek Kazak', 'S�cak tutan lacivert kazak', 220.00, 30, 223);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Erkek Deri �anta', 'Kaliteli siyah deri �anta', 320.00, 20, 209),
('Erkek S�vet �anta', 'Rahat s�et �anta', 250.00, 15, 210)
('Erkek Deri Ayakkab�', 'Kaliteli siyah deri ayakkab�', 320.00, 20, 207),
('Erkek S�vet Ayakkab�', 'Rahat s�et ayakkab�', 250.00, 15, 208);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Kad�n G�mlek �ifon', 'Hafif ve ��k g�mlek', 170.00, 40, 211),
('Kad�n Pantolon Dar Kesim', 'Modern tasar�m pantolon', 190.00, 30, 212),
('Kad�n Ti��rt Yazl�k', 'Rahat ve hafif ti��rt', 120.00, 60, 217),
('Kad�n �ort Keten', 'Yazl�k �ort', 140.00, 50, 218),
('Kad�n Kazak', 'K�� i�in s�cak kazak', 200.00, 35, 219),
('Kad�n Ceket', '��k ofis ceketi', 250.00, 20, 220);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Kad�n K�pe Alt�n Kaplama', 'Zarif alt�n kaplama k�pe', 80.00, 100, 185),
('Kad�n Kemer Deri', 'Kaliteli deri kemer', 90.00, 80, 186),
('Kad�n Kolye �nci', '��k inci kolye', 150.00, 60, 187);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('K�z Bebek Toka', 'Renkli ve yumu�ak toka', 25.00, 100, 230),
('K�z Bebek Ti��rt', 'Pamuklu rahat ti��rt', 30.00, 100, 231),
('K�z Bebek �ort', 'Yazl�k �ort', 35.00, 80, 232),
('K�z Bebek Elbise', '�irin elbise', 50.00, 60, 233);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Erkek Bebek �ort', 'Yumu�ak kuma� �ort', 30.00, 90, 234),
('Erkek Bebek G�mlek', 'K���k g�mlek', 40.00, 70, 235),
('Erkek Bebek Ti��rt', 'Rahat ti��rt', 30.00, 80, 236),
('Erkek Bebek �apka', 'Koruyucu �apka', 25.00, 75, 237);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Erkek Parf�m', 'Ferahlat�c� erkek parf�m�', 300.00, 40, 183),
('Erkek �apka', 'Modern erkek �apkas�', 100.00, 50, 184);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Kad�n Deri �anta', 'Kaliteli siyah deri �anta', 320.90, 20, 215),
('Kad�n S�vet �anta', 'Rahat s�et �anta', 250.99, 15, 216),
('Kad�n Deri Ayakkab�', 'Kaliteli siyah deri ayakkab�', 120.95, 20, 213),
('kad�n S�vet Ayakkab�', 'Rahat s�et ayakkab�', 250.00, 15, 214);




