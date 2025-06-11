<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Cá Nhân</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-container {
            max-width: 800px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .profile-header img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
        }
        .booking-history table {
            width: 100%;
            margin-top: 20px;
        }
        .btn-edit {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <img src="https://via.placeholder.com/100" alt="Ảnh đại diện">
            <h2>${sessionScope.user.fullName}</h2>
            <p>Email: ${sessionScope.user.email}</p>
        </div>

        <div class="profile-info">
            <h4>Thông Tin Cá Nhân</h4>
            <p><strong>Họ và Tên:</strong> ${sessionScope.user.fullName}</p>
            <p><strong>Số Điện Thoại:</strong> ${sessionScope.user.phone}</p>
            <p><strong>Địa Chỉ:</strong> ${sessionScope.user.address}</p>
            <button class="btn btn-primary btn-edit" onclick="location.href='editProfile.jsp'">Chỉnh Sửa Thông Tin</button>
        </div>

        <div class="booking-history">
            <h4>Lịch Sử Đặt Phòng</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Mã Đặt Phòng</th>
                        <th>Ngày Đặt</th>
                        <th>Ngày Nhận</th>
                        <th>Ngày Trả</th>
                        <th>Tổng Tiền</th>
                        <th>Trạng Thái</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Giả lập dữ liệu lịch sử đặt phòng --%>
                    <c:forEach var="booking" items="${sessionScope.user.bookings}">
                        <tr>
                            <td>${booking.id}</td>
                            <td>${booking.bookingDate}</td>
                            <td>${booking.checkInDate}</td>
                            <td>${booking.checkOutDate}</td>
                            <td>${booking.totalPrice} VND</td>
                            <td>${booking.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="text-center">
            <a href="logout.jsp" class="btn btn-danger">Đăng Xuất</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>