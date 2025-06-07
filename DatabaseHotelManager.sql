Create database HotelManagement 
Use HotelManagement

Create Table Roles(
 RoleID int Primary key ,
 RoleName NVarchar(255)  NOT NULL UNIQUE
 );

CREATE TABLE RoomType (
    TypeID INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50),
    Description NVARCHAR(255),
    PricePerNight DECIMAL(10,2),
    Capacity INT,
    ImagePath NVARCHAR(MAX)
);


CREATE TABLE Room (
    RoomID INT PRIMARY KEY IDENTITY,
    TypeID INT,
    Status NVARCHAR(20),
    FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID)
);

CREATE TABLE Users (
    UsersID INT PRIMARY KEY IDENTITY,
	RoleID int,
    FirstName Nvarchar(50),
    LastName Nvarchar(50),
    DateOfBirth DATE,
    Address Nvarchar(255),
    Phone Nvarchar(15),
    Email Nvarchar(255) UNIQUE,
	[Password] Nvarchar(255)
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

CREATE TABLE Staff (
    UsersID INT PRIMARY KEY,
    Salary DECIMAL(10,2),
    Position	VARCHAR(100),	
    HireDate	DATE,	
    [Shift]	    VARCHAR(50),	
    [Status]	VARCHAR(20),	
    FOREIGN KEY (UsersID) REFERENCES Users(UsersID)
 

);

CREATE TABLE [Admin] (
    UsersID INT PRIMARY KEY,
    
    FOREIGN KEY (UsersID) REFERENCES Users(UsersID)
);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY IDENTITY,
    UsersID INT,
    RoomID INT,
    CheckinDate DATE,
    CheckoutDate DATE,
    TotalPrice DECIMAL(10,2),
    FOREIGN KEY (UsersID) REFERENCES Users(UsersID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY IDENTITY ,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod Nvarchar(50),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);
INSERT INTO Roles (RoleID, RoleName) VALUES
(1, 'Admin'),
(2, 'Staff'),
(3, 'Customer');

INSERT INTO RoomType (Name, Description, PricePerNight, Capacity, ImagePath) VALUES
(N'Phòng Executive Suite', N'Luxuriously and perfectly designed with modern amenities, meet up all your relaxed stay in quite room with big city view window', 2820000, 2, N'https://booking.muongthanh.com/images/hotels/rooms/original/muong-thanh-grand-ha-noi-centre_executive-suite-1_1698374316.jpg'),
(N'Phòng Deluxe King', N'Phòng tiêu chuẩn cho 2 người', 2500000, 2, N'https://booking.muongthanh.com/images/hotels/rooms/original/deluxe-king_1711697283.jpg'),
(N'Phòng Deluxe Twin', N'Phòng dành cho gia đình 4 người', 3000000, 4, N'https://booking.muongthanh.com/images/rooms/2022/06/21/original/muong-thanh-grand-ha-noi-centre_superior-twin2_1655783544.jpg');


INSERT INTO Room (TypeID, Status) VALUES
(1, N'Vacant'),
(2, N'Occupied'),
(3, N'Dirty');

INSERT INTO Users (RoleID, FirstName, LastName, DateOfBirth, Address, Phone, Email, [Password]) VALUES
-- Admin
(1, N'Nguyễn', N'Minh', '1985-04-20', N'Hà Nội', '0901234567', 'minh.admin@example.com', 'admin123'),

-- Nhân viên
(2, N'Lê', N'Thảo', '1992-07-15', N'Đà Nẵng', '0912345678', 'le.thao@example.com', 'staff123'),
(2, N'Phạm', N'Hưng', '1996-11-30', N'Hồ Chí Minh', '0934567890', 'pham.hung@example.com', 'hung456'),

-- Khách hàng
(3, N'Trần', N'Tuấn', '2000-03-10', N'Nha Trang', '0987654321', 'tran.tuan@example.com', 'tuan789'),
(3, N'Hoàng', N'Lan', '1999-09-05', N'Hải Phòng', '0971122334', 'hoang.lan@example.com', 'lan456');

INSERT INTO Staff (UsersID, Salary, Position, HireDate, [Shift], [Status]) VALUES
-- Nhân viên lễ tân (UsersID = 2)
(2, 800.00, N'Lễ tân', '2023-01-15', N'Ca sáng', N'Đang làm việc'),

-- Nhân viên dọn phòng (UsersID = 3)
(3, 750.00, N'Dọn phòng', '2024-03-01', N'Ca chiều', N'Nghỉ phép');



