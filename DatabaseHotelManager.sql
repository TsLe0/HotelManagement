CREATE DATABASE HotelManagement;
GO

USE HotelManagement;
GO

-- Tạo bảng RoomType
CREATE TABLE RoomType (
    RoomTypeID  VARCHAR(5) PRIMARY KEY,
    RoomTypeName NVARCHAR(100) NOT NULL UNIQUE,
	RoomTypePrice  DECIMAL(10,2) NOT NULL,
	RoomDec NVARCHAR(100),
	RoomArea DECIMAL(10,2),
    NumBeds  INT NOT NULL,
	RoomTypeStatus NVARCHAR(20) NOT NULL DEFAULT N'Đang kinh doanh' CHECK (RoomTypeStatus IN (N'Đang kinh doanh', N'Ngừng kinh doanh'))
);

-- Tạo bảng Room
CREATE TABLE Room (
    RoomNumber  VARCHAR(5) PRIMARY KEY,
    RoomTypeID VARCHAR(5),
    RoomStatus NVARCHAR(20) NOT NULL DEFAULT N'Trống' CHECK (RoomStatus IN (N'Trống', N'Đang sử dụng', N'Bảo trì', N'Vô hiệu hóa')),
	FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID)
);
GO

-- Tạo bảng RoomImage
CREATE TABLE RoomImage (
    ImageID INT IDENTITY(1,1) PRIMARY KEY,     
    RoomTypeID  VARCHAR(5) ,                           
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
    address Nvarchar(50),
    role VARCHAR(20) CHECK (role IN ('customer', 'admin', 'staff')) DEFAULT 'customer',
    created_at DATETIME DEFAULT GETDATE()
);
GO

-- Tạo bảng Staff
CREATE TABLE Staff (
    user_id INT PRIMARY KEY,
    Salary DECIMAL(10,2),
    Position NVARCHAR(100),	
    HireDate DATE,	
    [Shift] NVARCHAR(50),	
    [Status] NVARCHAR(20),	
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
    RoomTypeID VARCHAR(5) NOT NULL,
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
INSERT INTO RoomType (RoomTypeID,RoomTypeName, RoomTypePrice, RoomDec, RoomArea, NumBeds,RoomTypeStatus) VALUES
('D01',N'Phòng đơn', 500000.00, N'Phòng cho 1 người', 18.00, 1, N'Đang kinh doanh'),
('D02',N'Phòng đôi', 800000.00, N'Phòng cho 2 người', 25.00, 2, N'Đang kinh doanh'),
('P01',N'Phòng gia đình', 1200000.00, N'Phòng cho gia đình 3 người', 35.00, 3, N'Đang kinh doanh'),
('V01',N'Phòng VIP', 2000000.00, N'Phòng sang trọng cho 2 người', 45.00, 2, N'Đang kinh doanh');

go
INSERT INTO Room (RoomNumber, RoomTypeID, RoomStatus) VALUES
('A101','D01', N'Trống'),
('D102','D02', N'Đang sử dụng'),
('D201', 'P01', N'Bảo trì'),
('VIP1','V01', N'Trống');
go 
-- Phòng đơn
INSERT INTO RoomImage (RoomTypeID, RoomImages) VALUES
('D01', 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1020,q_auto,w_2000/partner-images/bf/b5/b56283782b0111d5937634a299aa5a927d766b2b249e2e4f7760773125de.jpeg'),
('D01', 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1020,q_auto,w_2000/partner-images/cc/dc/e4e32cd1e4a516d3a071b750db111fc05875576ec06d56d596888557a320.jpeg'),
('D01', 'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1020,q_auto,w_2000/partner-images/99/70/eabf124fa80d4da93f089292dc3e5d5cf8304c802cb4ab42ac638939590e.jpeg');

-- Phòng đôi
INSERT INTO RoomImage (RoomTypeID, RoomImages) VALUES
('D02', N'https://booking.muongthanh.com/images/hotels/rooms/original/z4171312768965_ff546c284fbcf05aa6e0331ee4723aab_1678438739.jpg'),
('D02', N'https://eholiday.vn/wp-content/uploads/2023/08/Khach-san-Muong-Thanh-Luxury-Quang-Ninh-Phong-Family-Suite.jpg'),
('D02', N'https://www.vn.kayak.com/rimg/himg/79/53/c9/expedia_group-806047-336585-505783.jpg?width=1366&height=768&crop=true'),
('D02', N'https://ik.imagekit.io/tvlk/generic-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10025383-1000x626-FIT_AND_TRIM-fd0c564ed05ab55c0075981979ad5770.jpeg');

-- Phòng gia đình
INSERT INTO RoomImage (RoomTypeID, RoomImages) VALUES
('P01', N'https://d3tosvr3yotk6r.cloudfront.net/Content/UserUploads/Images/Hotels/5/1801/Rooms/5775/medium_Picture13.png'),
('P01', N'https://travelmart.vn/uploads/2017/08/23/20_i599db08c3efe5.jpg'),
('P01', N'https://ticotravel.com.vn/wp-content/uploads/2022/07/Muong-Thanh-Luxury-Khanh-Hoa-8.png');

-- Phòng VIP
INSERT INTO RoomImage (RoomTypeID, RoomImages) VALUES
('V01', 'https://travelmart.vn/uploads/2018/05/10/20_i5af3c6487bbb2.jpg'),
('V01', 'https://travelmart.vn/uploads/2018/06/04/20_i5b14a081535b5.jpg'),
('V01', 'https://d3tosvr3yotk6r.cloudfront.net/Content/UserUploads/Images/Hotels/5/2/Rooms/2068/medium_590-%20(1).jpg'),
('V01', 'https://eholiday.vn/wp-content/uploads/2024/05/Muong-Thanh-Luxury-Da-Nang-Grand-Suite.jpg');
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
