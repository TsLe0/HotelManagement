<%-- 
    Document   : roomdetails
    Created on : Jun 7, 2025, 9:23:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <title>
            Chi tiết ${roomType.roomTypeName}
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&amp;display=swap" rel="stylesheet"/>
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }
        </style>
    </head>
    <body class="bg-gray-50 text-gray-800">
        <!-- header-->
        <jsp:include page="header.jsp" />
        <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
            <section class="mb-8">
                <h1 class="text-3xl font-extrabold text-gray-900 mb-2">
                    ${roomType.roomTypeName}
                </h1>
                <div class="flex flex-wrap items-center text-sm text-gray-600 space-x-4 mb-4">
                    <div class="flex items-center space-x-1">
                        <i class="fas fa-map-marker-alt text-blue-600">
                        </i>
                        <span>
                            Mường Thanh Luxury Quảng Ninh
                        </span>
                    </div>
                    <div class="flex items-center space-x-1">
                        <i class="fas fa-star text-yellow-400">
                        </i>
                        <span>
                            5.0 (1,234 đánh giá)
                        </span>
                    </div>
                    <div class="flex items-center space-x-1">
                        <i class="fas fa-bed text-blue-600">
                        </i>
                        <span>
                            Phòng: ${roomType.roomTypeName}
                        </span>
                    </div>
                </div>
            </section>
            <section class="mb-10">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div class="md:col-span-2 rounded-lg overflow-hidden">
                        <img alt="${roomType.roomTypeName}" class="w-full h-auto object-cover rounded-lg" height="450" src="${iList[0].roomImages}" width="800"/>
                    </div>
                    <div class="space-y-4">
                        <c:forEach items="${iList}" var="i" begin="1">
                            <img alt="${i.roomImages}" class="w-full h-auto object-cover rounded-lg" height="100" src="${i.roomImages}" width="400"/>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <section class="mb-10 grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="md:col-span-2 bg-white rounded-lg shadow p-6">
                    <h2 class="text-2xl font-semibold mb-4">
                        Thông tin phòng
                    </h2>
                    <ul class="space-y-3 text-gray-700">
                        <li class="flex items-center">
                            <i class="fas fa-bed text-blue-600 w-6">
                            </i>
                            <span>
                                ${roomType.numBeds} giường
                            </span>
                        </li>
                        <li class="flex items-center">
                            <i class="fas fa-user-friends text-blue-600 w-6">
                            </i>
                            <span>
                                Phù hợp cho 2 người lớn và 1 trẻ em
                            </span>
                        </li>
                        <li class="flex items-center">
                            <i class="fas fa-ruler-combined text-blue-600 w-6">
                            </i>
                            <span>
                                Diện tích phòng: ${roomType.roomArea} m²
                            </span>
                        </li>
                        <li class="flex items-center">
                            <i class="fas fa-wifi text-blue-600 w-6">
                            </i>
                            <span>
                                Wi-Fi miễn phí tốc độ cao
                            </span>
                        </li>
                        <li class="flex items-center">
                            <i class="fas fa-tv text-blue-600 w-6">
                            </i>
                            <span>
                                TV màn hình phẳng với các kênh quốc tế
                            </span>
                        </li>

                        <li class="flex items-center">
                            <i class="fas fa-snowflake text-blue-600 w-6">
                            </i>
                            <span>
                                Điều hòa nhiệt độ
                            </span>
                        </li>

                        <li class="flex items-center">
                            <i class="fas fa-coffee text-blue-600 w-6"></i>
                            <span>Minibar và ấm đun nước điện</span>
                        </li>

                        <li class="flex items-center">
                            <i class="fas fa-shower text-blue-600 w-6"></i>
                            <span>
                                Phòng tắm riêng với bồn tắm và vòi sen
                            </span>
                        </li>
                    </ul>
                </div>
                <aside class="bg-white rounded-lg shadow p-6 flex flex-col justify-between">
                    <div>
                        <h2 class="text-2xl font-semibold mb-4">
                            Chọn ngày & đặt phòng
                        </h2>   
                        <form action="roombooking" method="POST" class="space-y-4" onsubmit="return validateBookingForm()">
                            <input type="hidden" name="roomTypeId" value="${roomType.roomTypeID}"/>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1" for="checkin">
                                    Ngày nhận phòng
                                </label>
                                <input class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-500" id="checkin" min="2025-06-29" name="checkin" type="date" value="2025-06-29"/>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1" for="checkout">
                                    Ngày trả phòng
                                </label>
                                <input class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-500" id="checkout" min="2025-06-30" name="checkout" type="date" value="2025-06-30"/>
                            </div>
<!--                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1" for="guests">
                                    Số khách
                                </label>
                                <select class="w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-500" id="guests" name="guests">
                                    <option value="1">
                                        1 người lớn
                                    </option>
                                    <option selected="" value="2">
                                        2 người lớn
                                    </option>
                                    <option value="3">
                                        3 người lớn
                                    </option>
                                    <option value="4">
                                        4 người lớn
                                    </option>
                                </select>
                            </div>-->
                            <button class="w-full bg-blue-600 text-white font-semibold py-3 rounded-md hover:bg-blue-700 transition" type="submit">
                                Đặt phòng ngay
                            </button>
                        </form>
                    </div>
                    <div class="mt-6 border-t border-gray-200 pt-4">
                        <p class="text-gray-600 text-sm">
                            Giá mỗi đêm
                        </p>
                        <p class="text-3xl font-extrabold text-blue-600">
                            ${roomType.roomTypePrice} VNĐ
                        </p>
                        <p class="text-gray-500 text-xs mt-1">
                            Đã bao gồm thuế và phí
                        </p>
                    </div>
                </aside>
            </section>
            <section class="mb-10 bg-white rounded-lg shadow p-6">
                <h2 class="text-2xl font-semibold mb-4">
                    Mô tả phòng
                </h2>
                <p class="text-gray-700 leading-relaxed">
                    ${roomType.roomDec}
                </p>
            </section>
            <section class="mb-10 bg-white rounded-lg shadow p-6">
                <h2 class="text-2xl font-semibold mb-6">
                    Tiện ích phòng
                </h2>
                <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4 text-gray-700">
                    <div class="flex items-center space-x-2">
                        <i class="fas fa-wifi text-blue-600 text-lg">
                        </i>
                        <span>
                            Wi-Fi miễn phí
                        </span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <i class="fas fa-tv text-blue-600 text-lg">
                        </i>
                        <span>
                            TV màn hình phẳng
                        </span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <i class="fas fa-snowflake text-blue-600 text-lg">
                        </i>
                        <span>
                            Điều hòa nhiệt độ
                        </span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <i class="fas fa-coffee text-blue-600 text-lg">
                        </i>
                        <span>
                            Minibar
                        </span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <i class="fas fa-shower text-blue-600 text-lg">
                        </i>
                        <span>
                            Phòng tắm riêng
                        </span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <i class="fas fa-bath text-blue-600 text-lg">
                        </i>
                        <span>
                            Bồn tắm
                        </span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <i class="fas fa-utensils text-blue-600 text-lg">
                        </i>
                        <span>
                            Dịch vụ phòng 24/7
                        </span>
                    </div>
                    <div class="flex items-center space-x-2">
                        <i class="fas fa-parking text-blue-600 text-lg">
                        </i>
                        <span>
                            Bãi đỗ xe miễn phí
                        </span>
                    </div>
                </div>
            </section>

            
        </main>
        <jsp:include page="footer.jsp" />
        <script>
            const menuBtn = document.getElementById('menu-btn');
            const mobileMenu = document.getElementById('mobile-menu');
            menuBtn.addEventListener('click', () => {
                mobileMenu.classList.toggle('hidden');
            });

            function validateBookingForm() {
                const checkinDate = new Date(document.getElementById('checkin').value);
                const checkoutDate = new Date(document.getElementById('checkout').value);
                const today = new Date();
                today.setHours(0, 0, 0, 0); // So sánh chỉ ngày, không tính giờ

                if (checkinDate < today) {
                    alert('Ngày nhận phòng không được là ngày trong quá khứ.');
                    return false;
                }

                if (checkoutDate <= checkinDate) {
                    alert('Ngày trả phòng phải sau ngày nhận phòng.');
                    return false;
                }
                return true;
            }

            // Set min date for checkin and checkout
            document.addEventListener("DOMContentLoaded", function () {
                var today = new Date().toISOString().split('T')[0];
                var checkinInput = document.getElementById('checkin');
                var checkoutInput = document.getElementById('checkout');

                checkinInput.setAttribute('min', today);

                checkinInput.addEventListener('change', function () {
                    var checkinDate = new Date(this.value);
                    checkinDate.setDate(checkinDate.getDate() + 1);
                    var nextDay = checkinDate.toISOString().split('T')[0];
                    checkoutInput.setAttribute('min', nextDay);
                    if (checkoutInput.value < nextDay) {
                        checkoutInput.value = nextDay;
                    }
                });

                // Initial setup for checkout min date
                var checkinDate = new Date(checkinInput.value);
                checkinDate.setDate(checkinDate.getDate() + 1);
                var nextDay = checkinDate.toISOString().split('T')[0];
                checkoutInput.setAttribute('min', nextDay);
            });
        </script>
    </body>
</html>
