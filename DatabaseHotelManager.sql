Create database HotelManagement 
Use HotelManagement



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

CREATE TABLE users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    role VARCHAR(20) CHECK (role IN ('customer', 'admin', 'staff')) DEFAULT 'customer',
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Staff (
    user_id INT PRIMARY KEY,
    Salary DECIMAL(10,2),
    Position	VARCHAR(100),	
    HireDate	DATE,	
    [Shift]	    VARCHAR(50),	
    [Status]	VARCHAR(20),	
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
 

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


INSERT INTO users (username, password, email, phone, address, role)
VALUES 
('john_doe', 'password123', 'john@example.com', '1234567890', '123 Main St, City A', 'customer'),
('admin_user', 'adminpass456', 'admin@example.com', '0987654321', '456 Admin St, City B', 'admin'),
('staff_member', 'staffpass789', 'staff@example.com', '1122334455', '789 Staff Rd, City C', 'staff');


