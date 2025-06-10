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

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY IDENTITY,
    UsersID INT,
    RoomNumber VARCHAR(10),
    CheckinDate DATE,
    CheckoutDate DATE,
    TotalPrice DECIMAL(10,2),
    FOREIGN KEY (UsersID) REFERENCES Users(user),
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




