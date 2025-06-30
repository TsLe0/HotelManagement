<%-- 
    Document   : bookingSuccess
    Created on : Jun 29, 2025, 9:57:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <title>
            Đặt phòng thành công - Khách sạn
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
        <style>
            body {
                font-family: 'Roboto', sans-serif;
            }
        </style>
    </head>
    <body class="bg-gray-50 min-h-screen flex flex-col">
        <jsp:include page="header.jsp" />
        <main class="flex-grow container mx-auto px-4 py-12 flex flex-col items-center text-center">
            <img alt="Biểu tượng thành công màu xanh lá cây với dấu tích lớn bên trong vòng tròn" class="mx-auto mb-6 w-36 h-36" height="150" loading="lazy" src="https://storage.googleapis.com/a1aa/image/cc65464a-262e-45da-6d03-18c20dcece2c.jpg" width="150"/>
            <h2 class="text-4xl font-extrabold text-green-600 mb-4">
                Đặt phòng thành công!
            </h2>
            <p class="text-lg text-gray-700 max-w-xl mb-8">
                Cảm ơn bạn đã đặt phòng tại Khách sạn Mường Thanh. Chúng tôi đã nhận được yêu cầu của bạn và sẽ gửi xác nhận chi tiết qua email trong thời gian sớm nhất.
            </p>
            <section class="bg-white shadow-md rounded-lg p-6 max-w-xl w-full mb-10">
                <h3 class="text-2xl font-semibold text-gray-800 mb-4">
                    Chi tiết đặt phòng
                </h3>
                <div class="space-y-3 text-gray-700">
                    <div class="flex justify-between border-b border-gray-200 pb-2">
                        <span class="font-medium">
                            Tên khách hàng:
                        </span>
                        <span>
                            ${booking.customerName}
                        </span>
                    </div>
                    <div class="flex justify-between border-b border-gray-200 pb-2">
                        <span class="font-medium">
                            Số điện thoại:
                        </span>
                        <span>
                            ${booking.customerPhoneNumber}
                        </span>
                    </div>
                    <div class="flex justify-between border-b border-gray-200 pb-2">
                        <span class="font-medium">
                            Email:
                        </span>
                        <span>
                            ${userEmail}
                        </span>
                    </div>
                    <div class="flex justify-between border-b border-gray-200 pb-2">
                        <span class="font-medium">
                            Loại phòng:
                        </span>
                        <span>
                            ${roomType}
                        </span>
                    </div>
                    <div class="flex justify-between border-b border-gray-200 pb-2">
                        <span class="font-medium">
                            Ngày nhận phòng:
                        </span>
                        <span>
                            ${booking.checkinDate}
                        </span>
                    </div>
                    <div class="flex justify-between border-b border-gray-200 pb-2">
                        <span class="font-medium">
                            Ngày trả phòng:
                        </span>
                        <span>
                            ${booking.checkoutDate}
                        </span>
                    </div>
<!--                    <div class="flex justify-between border-b border-gray-200 pb-2">
                        <span class="font-medium">
                            Số lượng khách:
                        </span>
                        <span>
                            
                        </span>
                    </div>-->
                    <div class="flex justify-between pt-2">
                        <span class="font-bold text-lg">
                            Tổng tiền:
                        </span>
                        <span class="font-bold text-lg text-green-600">
                            ${booking.totalPrice} VND
                        </span>
                    </div>
                </div>
            </section>

            <a aria-label="Quay về trang chủ" class="mt-12 inline-block bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-8 rounded-lg shadow-lg transition" href="home.jsp">
                <i class="fas fa-home mr-2">
                </i>
                Quay về trang chủ
            </a>
        </main>
        <jsp:include page="footer.jsp" />
        <script>
            const menuBtn = document.getElementById('menu-btn');
            const mobileMenu = document.getElementById('mobile-menu');

            menuBtn.addEventListener('click', () => {
                mobileMenu.classList.toggle('hidden');
            });
        </script>
    </body>
</html>
