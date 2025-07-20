<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lịch sử đặt phòng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>

    <div class="container mt-5">
        <h2>Lịch sử đặt phòng của bạn</h2>
        <hr>
        <c:if test="${empty bookingHistory}">
            <p>Bạn chưa có lịch sử đặt phòng nào.</p>
        </c:if>
        <c:if test="${not empty bookingHistory}">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Mã đặt phòng</th>
                        <th>Loại phòng</th>
                        <th>Số phòng</th>
                        <th>Ngày nhận phòng</th>
                        <th>Ngày trả phòng</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookingHistory}">
                        <tr>
                            <td>${booking.bookingId}</td>
                            <td>${booking.roomTypeId}</td>
                            <td>${booking.roomNumber}</td>
                            <td>${booking.checkinDate}</td>
                            <td>${booking.checkoutDate}</td>
                            <td>${booking.totalPrice}</td>
                            <td>${booking.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
