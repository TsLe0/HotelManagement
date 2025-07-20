<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử đặt phòng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7f6;
        }
        .booking-card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.08);
            margin-bottom: 2rem;
            padding: 1.5rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-left: 5px solid;
        }
        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.12);
        }
        .status-pending { border-color: #f59e0b; } /* Amber 500 */
        .status-confirmed { border-color: #10b981; } /* Emerald 500 */
        .status-completed { border-color: #3b82f6; } /* Blue 500 */
        .status-cancelled { border-color: #ef4444; } /* Red 500 */

        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            color: #fff;
        }
        .badge-pending { background-color: #f59e0b; }
        .badge-confirmed { background-color: #10b981; }
        .badge-completed { background-color: #3b82f6; }
        .badge-cancelled { background-color: #ef4444; }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e5e7eb;
            padding-bottom: 1rem;
            margin-bottom: 1rem;
        }
        .card-body .info-item {
            display: flex;
            align-items: center;
            margin-bottom: 0.75rem;
            color: #4b5563;
        }
        .card-body .info-item i {
            width: 20px;
            margin-right: 10px;
            color: #6b7280;
        }
        .card-footer {
            border-top: 1px solid #e5e7eb;
            padding-top: 1rem;
            margin-top: 1rem;
            text-align: right;
            font-size: 1.25rem;
            font-weight: 700;
            color: #1f2937;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>

    <div class="container mx-auto mt-8 px-4">
        <h1 class="text-3xl font-bold text-gray-800 mb-6">Lịch sử đặt phòng</h1>

        <c:if test="${empty bookingHistory}">
            <div class="text-center bg-white p-10 rounded-lg shadow-md">
                <i class="fas fa-box-open fa-3x text-gray-400 mb-4"></i>
                <p class="text-gray-600 text-lg">Bạn chưa có lịch sử đặt phòng nào.</p>
                <a href="home.jsp" class="mt-4 inline-block bg-blue-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-600 transition-colors">
                    Bắt đầu đặt phòng
                </a>
            </div>
        </c:if>

        <c:if test="${not empty bookingHistory}">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <c:forEach var="booking" items="${bookingHistory}">
                    <c:set var="statusClass" value="pending"/>
                    <c:if test="${booking.status == 'Confirmed'}"><c:set var="statusClass" value="confirmed"/></c:if>
                    <c:if test="${booking.status == 'Completed'}"><c:set var="statusClass" value="completed"/></c:if>
                    <c:if test="${booking.status == 'Cancelled'}"><c:set var="statusClass" value="cancelled"/></c:if>

                    <div class="booking-card status-${statusClass}">
                        <div class="card-header">
                            <h3 class="text-lg font-bold text-gray-700">Mã: #${booking.bookingId}</h3>
                            <span class="status-badge badge-${statusClass}">${booking.status}</span>
                        </div>
                        <div class="card-body">
                            <div class="info-item">
                                <i class="fas fa-door-open"></i>
                                <span>Loại phòng: <strong>${booking.roomTypeId}</strong></span>
                            </div>
                            <div class="info-item">
                                <i class="fas fa-hashtag"></i>
                                <span>Số phòng: <strong>${booking.roomNumber != null ? booking.roomNumber : 'Chưa gán'}</strong></span>
                            </div>
                            <div class="info-item">
                                <i class="fas fa-calendar-check"></i>
                                <span>Nhận phòng: <strong><fmt:formatDate value="${booking.checkinDate}" pattern="dd/MM/yyyy"/></strong></span>
                            </div>
                            <div class="info-item">
                                <i class="fas fa-calendar-times"></i>
                                <span>Trả phòng: <strong><fmt:formatDate value="${booking.checkoutDate}" pattern="dd/MM/yyyy"/></strong></span>
                            </div>
                        </div>
                        <div class="card-footer">
                            <span>Tổng cộng: </span>
                            <span class="text-blue-600">
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${booking.totalPrice}" type="currency" currencySymbol="VNĐ"/>
                            </span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
