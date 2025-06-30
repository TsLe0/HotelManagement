CREATE DATABASE HotelManagement;
GO

USE HotelManagement;
GO

-- Tạo bảng RoomType
CREATE TABLE RoomType (
    RoomTypeID  INT IDENTITY(1,1) PRIMARY KEY,
    RoomTypeName NVARCHAR(100) NOT NULL UNIQUE,
	RoomTypePrice  DECIMAL(10,2) NOT NULL,
	RoomDec NVARCHAR(100),
	RoomArea DECIMAL(10,2),
    NumBeds  INT NOT NULL
);
GO

-- Tạo bảng Room
CREATE TABLE Room (
    RoomNumber  VARCHAR(5) PRIMARY KEY,
    RoomTypeID INT,
    RoomStatus NVARCHAR(20) NOT NULL DEFAULT N'Trống' CHECK (RoomStatus IN (N'Trống', N'Đang sử dụng', N'Bảo trì', N'Vô hiệu hóa')),
	FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID)
);
GO

-- Tạo bảng RoomImage
CREATE TABLE RoomImage (
    ImageID INT IDENTITY(1,1) PRIMARY KEY,     
    RoomTypeID  INT ,                           
    RoomImages NVARCHAR(255) NOT NULL,                   
    FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID)
);
GO

-- Tạo bảng Users
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
GO

-- Tạo bảng Staff
CREATE TABLE Staff (
    user_id INT PRIMARY KEY,
    Salary DECIMAL(10,2),
    Position VARCHAR(100),	
    HireDate DATE,	
    [Shift] VARCHAR(50),	
    [Status] VARCHAR(20),	
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
GO

-- Tạo bảng Admin
CREATE TABLE [Admin] (
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
GO

-- Tạo bảng Bookings
DROP TABLE IF EXISTS Booking;
GO

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    RoomTypeID INT NOT NULL,
	CustomerName NVARCHAR(50) NULL,
	CustomerPhoneNumber NVARCHAR(20) NULL,
	RoomNumber  VARCHAR(5),
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    NumberOfGuests INT NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(50) NOT NULL, -- e.g., 'Confirmed', 'Pending', 'Cancelled'
    BookingDate DATETIME NOT NULL DEFAULT GETDATE(),
    SpecialRequests NVARCHAR(MAX),
    FOREIGN KEY (UserID) REFERENCES Users(user_id),
	FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber),
    FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID)
);
GO

-- Tạo bảng Payment
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY IDENTITY,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod NVARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
GO
INSERT INTO RoomType (RoomTypeName, RoomTypePrice, RoomDec, RoomArea, NumBeds) VALUES
(N'Phòng đơn', 500000.00, N'Phòng cho 1 người', 18.00, 1),
(N'Phòng đôi', 800000.00, N'Phòng cho 2 người', 25.00, 2),
(N'Phòng gia đình', 1200000.00, N'Phòng cho gia đình 3 người', 35.00, 3),
(N'Phòng VIP', 2000000.00, N'Phòng sang trọng cho 2 người', 45.00, 2);

go
INSERT INTO Room (RoomNumber, RoomTypeID, RoomStatus) VALUES
('101', 1, N'Trống'),
('102', 2, N'Đang sử dụng'),
('201', 3, N'Bảo trì'),
('VIP1', 4, N'Trống');
go 
-- Phòng đơn
INSERT INTO RoomImage (RoomTypeID, RoomImages) VALUES
(1, N'phong_don_1.jpg'),
(1, N'phong_don_2.jpg'),
(1, N'phong_don_3.jpg');

-- Phòng đôi
INSERT INTO RoomImage (RoomTypeID, RoomImages) VALUES
(2, N'phong_doi_1.jpg'),
(2, N'phong_doi_2.jpg'),
(2, N'phong_doi_3.jpg'),
(2, N'phong_doi_4.jpg');

-- Phòng gia đình
INSERT INTO RoomImage (RoomTypeID, RoomImages) VALUES
(3, N'phong_gia_dinh_1.jpg'),
(3, N'phong_gia_dinh_2.jpg'),
(3, N'phong_gia_dinh_3.jpg');

-- Phòng VIP
INSERT INTO RoomImage (RoomTypeID, RoomImages) VALUES
(4, N'phong_vip_1.jpg'),
(4, N'phong_vip_2.jpg'),
(4, N'phong_vip_3.jpg'),
(4, N'phong_vip_4.jpg');
go
INSERT INTO users (username, password, email, phone, address, role) VALUES
('khach1', 'pass123', 'khach1@example.com', '0901234567', N'Hà Nội', 'customer'),
('admin1', 'adminpass', 'admin1@example.com', '0902345678', N'Sài Gòn', 'admin'),
('nhanvien1', 'staffpass1', 'staff1@example.com', '0903456789', N'Đà Nẵng', 'staff'),
('nhanvien2', 'staffpass2', 'staff2@example.com', '0904567890', N'Cần Thơ', 'staff');

go
-- Giả định user_id của nhân viên là 3 và 4
INSERT INTO Staff (user_id, Salary, Position, HireDate, [Shift], [Status]) VALUES
(3, 8000000.00, N'Lễ tân', '2023-01-10', N'Ca sáng', N'Đang làm'),
(4, 8500000.00, N'Quản lý', '2022-11-05', N'Ca chiều', N'Đang làm');
go
-- Ví dụ chèn dữ liệu vào bảng Bookings mới
-- INSERT INTO Bookings (UserID, RoomTypeID, CheckInDate, CheckOutDate, NumberOfGuests, TotalPrice, Status, SpecialRequests) 
-- VALUES (1, 2, '2025-08-01', '2025-08-05', 2, 3200000.00, 'Confirmed', N'Yêu cầu phòng có view đẹp');
-- GO
-- Giả sử BookingID = 1
INSERT INTO Payment (BookingID, Amount, PaymentDate, PaymentMethod)
VALUES (1, 1000000.00, '2025-06-30', N'Thẻ tín dụng');
