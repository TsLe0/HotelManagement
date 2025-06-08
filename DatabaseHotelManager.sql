Create database HotelManagement 
Use HotelManagement

Create Table Roles(
 RoleID int Primary key ,
 RoleName NVarchar(255)  NOT NULL UNIQUE
 );

CREATE TABLE RoomType (
    RoomTypeID  INT IDENTITY(1,1) PRIMARY KEY,
    RoomTypeName NVARCHAR(100) NOT NULL UNIQUE,
    NumBeds  INT NOT NULL ,
    ImagePath NVARCHAR(255)
);

CREATE TABLE RoomStatus (
    RoomStatusID INT PRIMARY KEY,
    RoomStatusName NVARCHAR(20) NOT NULL DEFAULT N'Trống' CHECK (RoomStatusName IN (N'Trống', N'Đang sử dụng', N'Bảo trì')),
    
);
CREATE TABLE Room (
    RoomNumber  VARCHAR(10) PRIMARY KEY,
    RoomTypeID INT,
	RoomStatusID INT,
	RoomDesc NVARCHAR(255),
	RoomPrice  DECIMAL(10,2) NOT NULL, 
	FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID),
    FOREIGN KEY (RoomStatusID) REFERENCES RoomStatus(RoomStatusID)
);
CREATE TABLE RoomImage (
    ImageID INT IDENTITY(1,1) PRIMARY KEY,     
    RoomNumber VARCHAR(10),                           
    RoomImages NVARCHAR(255) not null,                   
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber)
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
    RoomNumber VARCHAR(10),
    CheckinDate DATE,
    CheckoutDate DATE,
    TotalPrice DECIMAL(10,2),
    FOREIGN KEY (UsersID) REFERENCES Users(UsersID),
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber)
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

INSERT INTO RoomType (RoomTypeName, NumBeds, ImagePath)
 VALUES
(N'Phòng đơn', 1, N'https://booking.muongthanh.com/images/hotels/rooms/original/muong-thanh-grand-ha-noi-centre_executive-suite-1_1698374316.jpg'),
(N'Phòng đôi', 2, N'https://booking.muongthanh.com/images/hotels/rooms/original/deluxe-twin_1698811341.jpg'),
(N'Phòng VIP', 2, N'https://booking.muongthanh.com/images/hotels/rooms/original/deluxe-king_1698306159.jpg');

INSERT INTO RoomStatus (RoomStatusID, RoomStatusName)
VALUES
(1, N'Trống'),
(2, N'Đang sử dụng'),
(3, N'Bảo trì');

INSERT INTO Room (RoomNumber, RoomTypeID, RoomStatusID,RoomDesc, RoomPrice)
VALUES
('A101', 1, 1, N'Phòng đơn gần cửa sổ, tầng 1',2820000),
('A102', 1, 2, N'Phòng đơn yên tĩnh, tầng 1',2500000),
('B201', 2, 1, N'Phòng đôi có ban công, tầng 2',2300000),
('B202', 2, 3, N'Phòng đôi đang sửa chữa, tầng 2',3300000),
('C301', 3, 1, N'Phòng VIP view thành phố, tầng 3',34000000),
('C302', 3, 2, N'Phòng VIP đã đặt, tầng 3',35000000);

INSERT INTO RoomImage(RoomNumber, RoomImages)
VALUES
('A101', 'https://booking.muongthanh.com/images/rooms/2022/06/20/original/executive-suite8_1655719878.jpg'),
('A101', 'https://booking.muongthanh.com/images/rooms/2022/06/20/original/executive-suite_1655719878.jpg'),
('A102', 'https://booking.muongthanh.com/images/rooms/2023/03/07/original/201181441_1678157079.jpg'),
('B201', 'https://booking.muongthanh.com/images/rooms/2022/06/20/original/executive-suite4_1655719880.jpgssss'),
('C301', 'https://booking.muongthanh.com/images/rooms/2022/06/20/original/deluxe-king6_1655719470.jpg'),
('C301', 'https://booking.muongthanh.com/images/rooms/2022/06/20/original/deluxe-king2_1655719469.jpg');


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



