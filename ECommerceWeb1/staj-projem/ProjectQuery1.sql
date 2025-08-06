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
INSERT INTO Categories (Name, ParentId) VALUES ('Kadýn', NULL);
INSERT INTO Categories (Name, ParentId) VALUES ('Bebek', NULL);

INSERT INTO Categories (Name, ParentId)
VALUES ('Aksesuar', 178);

INSERT INTO Categories (Name, ParentId)
VALUES
('Parfüm', 181),
('Þapka', 181);

INSERT INTO Categories (Name, ParentId)
VALUES ('Aksesuar', 179);

INSERT INTO Categories (Name, ParentId)
VALUES
('Kýz Bebek', 180),
('Erkek Bebek', 180);

-- 2. Aksesuar'ý Kadýn'ýn alt kategorisi olarak ekle

INSERT INTO Categories (Name, ParentId)
VALUES 
('Küpe', 182),
('Kemer', 182),
('Kolye', 182);

INSERT INTO Categories (Name, ParentId) VALUES ('Giyim', 178);
INSERT INTO Categories (Name, ParentId) VALUES ('Ayakkabý', 178);
INSERT INTO Categories (Name, ParentId) VALUES ('Çanta', 178);

-- Kadýn alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Giyim', 179);
INSERT INTO Categories (Name, ParentId) VALUES ('Ayakkabý', 179);
INSERT INTO Categories (Name, ParentId) VALUES ('Çanta', 179);



-- Erkek Giyim alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Gömlek',188);
INSERT INTO Categories (Name, ParentId) VALUES ('Pantolon', 188);

-- Erkek Ayakkabý alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Deri', 189);
INSERT INTO Categories (Name, ParentId) VALUES ('Süvet', 189);

-- Erkek Çanta alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Deri', 190);
INSERT INTO Categories (Name, ParentId) VALUES ('Süvet', 190);

-- Kadýn Giyim alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Gömlek', 191);
INSERT INTO Categories (Name, ParentId) VALUES ('Pantolon', 191);

-- Kadýn Ayakkabý alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Deri', 192);
INSERT INTO Categories (Name, ParentId) VALUES ('Süvet', 192);

-- Kadýn Çanta alt kategorileri
INSERT INTO Categories (Name, ParentId) VALUES ('Deri', 193);
INSERT INTO Categories (Name, ParentId) VALUES ('Süvet', 193);

-- Kadýn > Giyim kategorisinin Id'si 6 (önceki tablodan)
INSERT INTO Categories (Name, ParentId)
VALUES 
('Tiþört', 191),
('Þort', 191),
('Kazak', 191),
('Ceket', 191);

-- Erkek > Giyim kategorisinin Id'si 3
INSERT INTO Categories (Name, ParentId)
VALUES 
('Tiþört', 188),
('Þort', 188),
('Kazak', 188),
('Ceket', 188);

-- 1. Kadýn kategorisinin Id'si 2
-- 2. Aksesuar'ý Kadýn'ýn alt kategorisi olarak ekle

INSERT INTO Categories (Name, ParentId)
VALUES 
('Küpe', 182),
('Kemer', 182),
('Kolye', 182);


INSERT INTO Categories (Name, ParentId)
VALUES
('Parfüm', 181),
('Þapka', 181);



INSERT INTO Categories (Name, ParentId)
VALUES
('Toka', 194),
('Tiþört', 194),
('Þort', 194),
('Elbise', 194);

INSERT INTO Categories (Name, ParentId)
VALUES
('Þort', 195),
('Gömlek', 195),
('Tiþört', 195),
('Þapka', 195);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Erkek Siyah Þort', 'Þýk ve rahat erkek þort', 178.00, 50, 222),
('Erkek Resmi Ceket ', 'Þýk erkek ceket', 480.00, 25, 224),
('Erkek Gömlek Slim Fit', 'Þýk ve rahat erkek gömlek', 180.00, 50, 205),
('Erkek Pantolon Klasik', 'Konforlu ve dayanýklý klasik pantolon', 210.00, 40, 206),
('Erkek Tiþört Casual', 'Günlük kullaným için tiþört', 90.00, 70, 221),
('Erkek Kazak', 'Sýcak tutan lacivert kazak', 220.00, 30, 223);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Erkek Deri Çanta', 'Kaliteli siyah deri çanta', 320.00, 20, 209),
('Erkek Süvet Çanta', 'Rahat süet çanta', 250.00, 15, 210)
('Erkek Deri Ayakkabý', 'Kaliteli siyah deri ayakkabý', 320.00, 20, 207),
('Erkek Süvet Ayakkabý', 'Rahat süet ayakkabý', 250.00, 15, 208);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Kadýn Gömlek Þifon', 'Hafif ve þýk gömlek', 170.00, 40, 211),
('Kadýn Pantolon Dar Kesim', 'Modern tasarým pantolon', 190.00, 30, 212),
('Kadýn Tiþört Yazlýk', 'Rahat ve hafif tiþört', 120.00, 60, 217),
('Kadýn Þort Keten', 'Yazlýk þort', 140.00, 50, 218),
('Kadýn Kazak', 'Kýþ için sýcak kazak', 200.00, 35, 219),
('Kadýn Ceket', 'Þýk ofis ceketi', 250.00, 20, 220);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Kadýn Küpe Altýn Kaplama', 'Zarif altýn kaplama küpe', 80.00, 100, 185),
('Kadýn Kemer Deri', 'Kaliteli deri kemer', 90.00, 80, 186),
('Kadýn Kolye Ýnci', 'Þýk inci kolye', 150.00, 60, 187);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Kýz Bebek Toka', 'Renkli ve yumuþak toka', 25.00, 100, 230),
('Kýz Bebek Tiþört', 'Pamuklu rahat tiþört', 30.00, 100, 231),
('Kýz Bebek Þort', 'Yazlýk þort', 35.00, 80, 232),
('Kýz Bebek Elbise', 'Þirin elbise', 50.00, 60, 233);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Erkek Bebek Þort', 'Yumuþak kumaþ þort', 30.00, 90, 234),
('Erkek Bebek Gömlek', 'Küçük gömlek', 40.00, 70, 235),
('Erkek Bebek Tiþört', 'Rahat tiþört', 30.00, 80, 236),
('Erkek Bebek Þapka', 'Koruyucu þapka', 25.00, 75, 237);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Erkek Parfüm', 'Ferahlatýcý erkek parfümü', 300.00, 40, 183),
('Erkek Þapka', 'Modern erkek þapkasý', 100.00, 50, 184);

INSERT INTO Products (Name, Description, Price, Stock, CategoryId) VALUES
('Kadýn Deri Çanta', 'Kaliteli siyah deri çanta', 320.90, 20, 215),
('Kadýn Süvet Çanta', 'Rahat süet çanta', 250.99, 15, 216),
('Kadýn Deri Ayakkabý', 'Kaliteli siyah deri ayakkabý', 120.95, 20, 213),
('kadýn Süvet Ayakkabý', 'Rahat süet ayakkabý', 250.00, 15, 214);




