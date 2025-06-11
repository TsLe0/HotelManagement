<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Thông Tin</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Chỉnh Sửa Thông Tin Cá Nhân</h2>
        <form action="UpdateProfileServlet" method="post">
            <div class="form-group">
                <label>Họ và Tên</label>
                <input type="text" class="form-control" name="fullName" value="${sessionScope.user.fullName}">
            </div>
            <div class="form-group">
                <label>Số Điện Thoại</label>
                <input type="text" class="form-control" name="phone" value="${sessionScope.user.phone}">
            </div>
            <div class="form-group">
                <label>Địa Chỉ</label>
                <input type="text" class="form-control" name="address" value="${sessionScope.user.address}">
            </div>
            <button type="submit" class="btn btn-primary">Lưu</button>
            <a href="profile.jsp" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
</body>
</html>