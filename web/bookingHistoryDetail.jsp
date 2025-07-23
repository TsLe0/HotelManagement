<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đặt phòng - #${booking.bookingId}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
        }
        .detail-container {
            max-width: 800px;
            margin: 2rem auto;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .detail-header {
            background-color: #343a40;
            color: #fff;
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .detail-body {
            padding: 2rem;
        }
        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }
        .info-group {
            margin-bottom: 1.5rem;
        }
        .info-group h3 {
            font-size: 1.1rem;
            font-weight: 700;
            color: #495057;
            border-bottom: 2px solid #dee2e6;
            padding-bottom: 0.5rem;
            margin-bottom: 1rem;
        }
        .info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 0.75rem;
            color: #6c757d;
        }
        .info-item i {
            width: 20px;
            margin-top: 3px;
            margin-right: 12px;
            color: #868e96;
        }
        .info-item span {
            flex: 1;
        }
        .info-item strong {
            color: #343a40;
        }
        .total-price {
            text-align: right;
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff;
            margin-top: 2rem;
            border-top: 1px solid #eee;
            padding-top: 1.5rem;
        }
        .back-link {
            display: inline-block;
            margin-top: 2rem;
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>

    <div class="detail-container">
        <div class="detail-header">
            <h1 class="text-2xl font-bold">Chi tiết đặt phòng</h1>
            <span class="text-lg font-semibold">Mã: #${booking.bookingId}</span>
        </div>

        <c:if test="${not empty booking}">
            <div class="detail-body">
                <div class="info-grid">
                    <div class="info-group">
                        <h3>Thông tin khách hàng</h3>
                        <div class="info-item">
                            <i class="fas fa-user"></i>
                            <span>Họ và tên: <strong>${booking.customerName}</strong></span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-phone"></i>
                            <span>Số điện thoại: <strong>${booking.customerPhoneNumber}</strong></span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-envelope"></i>
                            <span>Email: <strong>${booking.user.email}</strong></span>
                        </div>
                    </div>
                    <div class="info-group">
                        <h3>Thông tin phòng</h3>
                        <div class="info-item">
                            <i class="fas fa-door-closed"></i>
                            <span>Loại phòng: <strong>${booking.roomType.roomTypeName}</strong></span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-hashtag"></i>
                            <span>Số phòng: <strong>${booking.roomNumber != null ? booking.roomNumber : 'Chưa được gán'}</strong></span>
                        </div>
                         <div class="info-item">
                            <i class="fas fa-info-circle"></i>
                            <span>Trạng thái: <strong>${booking.status}</strong></span>
                        </div>
                    </div>
                </div>

                <div class="info-group">
                    <h3>Chi tiết lưu trú</h3>
                    <div class="info-grid">
                        <div class="info-item">
                            <i class="fas fa-calendar-check"></i>
                            <span>Ngày nhận phòng: <strong><fmt:formatDate value="${booking.checkinDate}" pattern="dd/MM/yyyy"/></strong></span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-calendar-times"></i>
                            <span>Ngày trả phòng: <strong><fmt:formatDate value="${booking.checkoutDate}" pattern="dd/MM/yyyy"/></strong></span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-calendar-day"></i>
                            <span>Ngày đặt: <strong><fmt:formatDate value="${booking.bookingDate}" pattern="dd/MM/yyyy"/></strong></span>
                        </div>
                    </div>
                </div>

                <c:if test="${not empty booking.specialRequests}">
                    <div class="info-group">
                        <h3>Yêu cầu đặc biệt</h3>
                        <div class="info-item">
                            <i class="fas fa-star"></i>
                            <span class="p-3 bg-gray-100 rounded-md w-full"><em>${booking.specialRequests}</em></span>
                        </div>
                    </div>
                </c:if>

                <div class="total-price">
                    <span>Tổng cộng: </span>
                    <fmt:setLocale value="vi_VN"/>
                    <fmt:formatNumber value="${booking.totalPrice}" type="currency" currencySymbol="VNĐ"/>
                </div>

                <div class="flex justify-between items-center mt-8">
                    <a href="booking-history" class="back-link mt-0">
                        <i class="fas fa-arrow-left"></i> Quay lại lịch sử
                    </a>

                    <c:if test="${booking.status == 'Pending'}">
                        <form action="cancel-booking" method="POST" onsubmit="return confirm('Bạn có chắc chắn muốn hủy đặt phòng này không?');">
                            <input type="hidden" name="bookingId" value="${booking.bookingId}">
                            <button type="submit" class="bg-red-500 text-white font-bold py-2 px-4 rounded hover:bg-red-600 transition-colors">
                                <i class="fas fa-times-circle"></i> Hủy đặt phòng
                            </button>
                        </form>
                    </c:if>
                </div>
            </div>
        </c:if>
        <c:if test="${empty booking}">
             <div class="p-8 text-center">
                <p class="text-red-500">Không tìm thấy thông tin đặt phòng.</p>
                 <a href="booking-history" class="back-link">
                    <i class="fas fa-arrow-left"></i> Quay lại lịch sử
                </a>
            </div>
        </c:if>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
