<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cài đặt tài khoản</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f3f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .tabs {
            display: flex;
            border-bottom: 2px solid #ddd;
            margin-bottom: 20px;
        }

        .tab {
            padding: 10px 20px;
            cursor: pointer;
            color: #555;
        }

        .tab.active {
            font-weight: bold;
            color: #1877f2;
            border-bottom: 3px solid #1877f2;
        }

        .form-section {
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .row {
            display: flex;
            gap: 16px;
        }

        .row > div {
            flex: 1;
        }

        .form-actions {
            text-align: right;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #1877f2;
            color: white;
        }

        .btn-secondary {
            background-color: #ccc;
            color: black;
        }

        .section-box {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .section-box h4 {
            margin-bottom: 10px;
            color: #333;
        }

        .info-list {
            margin-top: 10px;
            font-size: 14px;
        }

        .info-list li {
            margin-bottom: 6px;
        }

        .btn-small {
            padding: 6px 12px;
            font-size: 13px;
        }

        .green {
            color: green;
            font-weight: bold;
            margin-left: 6px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Cài đặt</h2>
    <div class="tabs">
        <div class="tab active">Thông tin tài khoản</div>
        <div class="tab">Mật khẩu & Bảo mật</div>
    </div>

    <form action="UpdateProfileServlet" method="post">
        <div class="form-section">
            <h3>Dữ liệu cá nhân</h3>

            <label for="fullName">Tên đầy đủ</label>
            <input type="text" id="fullName" name="fullName" value="${user.fullName}" required>

            <small>Tên trong hồ sơ được rút ngắn từ họ tên của bạn.</small>

            <div class="row">
                <div>
                    <label for="gender">Giới tính</label>
                    <select name="gender" id="gender">
                        <option value="">--Chọn--</option>
                        <option value="Nam" ${user.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                        <option value="Nữ" ${user.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                        <option value="Khác" ${user.gender == 'Khác' ? 'selected' : ''}>Khác</option>
                    </select>
                </div>
                <div>
                    <label for="dob">Ngày sinh</label>
                    <div class="row">
                        <select name="dob_day">
                            <option>Ngày</option>
                            <% for (int i = 1; i <= 31; i++) { %>
                                <option value="<%=i%>"><%=i%></option>
                            <% } %>
                        </select>
                        <select name="dob_month">
                            <option>Tháng</option>
                            <% for (int i = 1; i <= 12; i++) { %>
                                <option value="<%=i%>"><%=i%></option>
                            <% } %>
                        </select>
                        <select name="dob_year">
                            <option>Năm</option>
                            <% for (int i = 2024; i >= 1900; i--) { %>
                                <option value="<%=i%>"><%=i%></option>
                            <% } %>
                        </select>
                    </div>
                </div>
            </div>

            <label for="city">Thành phố cư trú</label>
            <input type="text" id="city" name="city" value="${user.city}">
        </div>

        <div class="form-actions">
            <button type="submit" class="btn btn-primary">Lưu</button>
        </div>
    </form>

    <div class="section-box">
        <h4>Email</h4>
        <p>Chỉ có thể sử dụng tối đa 3 email</p>
        <ul class="info-list">
            <li>1. <strong>${user.email}</strong> <span class="green">Nơi nhận thông báo</span></li>
        </ul>
        <button class="btn btn-secondary btn-small">+ Thêm email</button>
    </div>

    <div class="section-box">
        <h4>Số di động</h4>
        <p>Chỉ có thể sử dụng tối đa 3 số di động</p>
        <ul class="info-list">
            <li>1. <strong>${user.phone}</strong></li>
        </ul>
        <button class="btn btn-secondary btn-small">+ Thêm số di động</button>
    </div>
</div>

</body>
</html>
