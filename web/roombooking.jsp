<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xác nhận đặt phòng</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }
        </style>
    </head>
    <body class="bg-gray-100">

        <jsp:include page="header.jsp" />

        <main class="max-w-6xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
            <h1 class="text-3xl font-extrabold text-gray-900 mb-8">Xác nhận và thanh toán</h1>
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

                <!-- Left Column: Booking Form -->
                <div class="lg:col-span-2 bg-white p-8 rounded-lg shadow-lg">
                    <h2 class="text-2xl font-bold text-gray-800 mb-6">Thông tin khách hàng</h2>
                    <form action="confirmBooking" method="POST" id="bookingForm">
                        <!-- Hidden fields for booking data -->
                        <input type="hidden" name="roomTypeId" value="${roomType.roomTypeID}" />
                        <input type="hidden" name="checkin" value="${checkin}" />
                        <input type="hidden" name="checkout" value="${checkout}" />
                        <input type="hidden" name="guests" value="${guests}" />

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label for="fullName" class="block text-sm font-medium text-gray-700">Họ và tên</label>
                                <input type="text" id="fullName" name="fullName" value="${sessionScope.user.fullName}" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"  />
                            </div>
                            <div>
                                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                                <input type="email" id="email" name="email" value="${sessionScope.account.email}" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm" readonly />
                            </div>
                            <div class="md:col-span-2">
                                <label for="phone" class="block text-sm font-medium text-gray-700">Số điện thoại</label>
                                <input type="tel" id="phone" name="phone" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"  />
                            </div>
                            <div class="md:col-span-2">
                                <label for="specialRequests" class="block text-sm font-medium text-gray-700">Yêu cầu đặc biệt (tùy chọn)</label>
                                <textarea id="specialRequests" name="specialRequests" rows="4" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm" placeholder="Ví dụ: phòng tầng cao, không hút thuốc..."></textarea>
                            </div>

                        </div>

                        <div class="mt-8">
                            <h3 class="text-xl font-bold text-gray-800 mb-4">Phương thức thanh toán</h3>
                            <div class="space-y-4">
                                <div class="flex items-center p-4 border border-gray-300 rounded-md">
                                    <input id="pay-later" name="paymentMethod" type="radio" value="pay_later" class="focus:ring-blue-500 h-4 w-4 text-blue-600 border-gray-300" checked>
                                    <label for="pay-later" class="ml-3 block text-sm font-medium text-gray-700">
                                        Thanh toán tại khách sạn
                                    </label>
                                </div>
                                <div class="flex items-center p-4 border border-gray-200 bg-gray-50 rounded-md">
                                    <input id="vnpay" name="paymentMethod" type="radio" value="vnpay" class="focus:ring-blue-500 h-4 w-4 text-blue-600 border-gray-300" disabled>
                                    <label for="vnpay" class="ml-3 block text-sm font-medium text-gray-400">
                                        Thanh toán qua VNPAY (Sắp có)
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="mt-8 border-t pt-6">
                            <button type="submit" class="w-full bg-blue-600 text-white font-bold py-3 px-4 rounded-md hover:bg-blue-700 transition duration-300">
                                Hoàn tất đặt phòng
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Right Column: Booking Summary -->
                <div class="lg:col-span-1">
                    <div class="bg-white p-6 rounded-lg shadow-lg sticky top-24">
                        <h3 class="text-xl font-bold text-gray-800 mb-4 border-b pb-4">Tóm tắt đặt phòng</h3>
                        <div class="flex items-center space-x-4">
                            <img src="${roomImages[0].roomImages}" alt="${roomType.roomTypeName}" class="w-24 h-24 rounded-md object-cover">
                            <div>
                                <h4 class="font-bold text-lg">${roomType.roomTypeName}</h4>
                                <p class="text-sm text-gray-600">${roomType.numBeds} giường · ${roomType.roomArea} m²</p>
                            </div>
                        </div>
                        <div class="mt-6 space-y-4">
                            <div class="flex justify-between">
                                <span class="font-medium text-gray-600">Ngày nhận phòng:</span>
                                <span class="font-semibold text-gray-900">${checkin}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="font-medium text-gray-600">Ngày trả phòng:</span>
                                <span class="font-semibold text-gray-900">${checkout}</span>
                            </div>
<!--                            <div class="flex justify-between">
                                <span class="font-medium text-gray-600">Số khách:</span>
                                <span class="font-semibold text-gray-900">${guests} người</span>
                            </div>-->
                            <div class="flex justify-between">
                                <span class="font-medium text-gray-600">Số đêm:</span>
                                <span class="font-semibold text-gray-900">${nights} đêm</span>
                            </div>
                        </div>
                        <div class="mt-6 border-t pt-4">
                            <div class="flex justify-between items-center">
                                <span class="text-lg font-bold text-gray-800">Tổng cộng:</span>
                                <span class="text-2xl font-extrabold text-blue-600">
                                    <fmt:formatNumber value="${total}" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                                </span>
                            </div>
                            <p class="text-xs text-gray-500 mt-1">Đã bao gồm tất cả các loại thuế và phí</p>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="footer.jsp" />
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const form = document.querySelector("#bookingForm");

                form.addEventListener("submit", function (e) {
                    let isValid = true;
                    let messages = [];

                    // Validate full name
                    const fullName = document.getElementById("fullName").value.trim();
                    if (fullName === "") {
                        isValid = false;
                        messages.push("Họ và tên không được để trống.");
                    }

                    // Validate phone number
                    const phone = document.getElementById("phone").value.trim();
                    const phoneRegex = /^[0-9]{9,11}$/;
                    if (phone === "") {
                        isValid = false;
                        messages.push("Số điện thoại không được để trống.");
                    } else if (!phoneRegex.test(phone)) {
                        isValid = false;
                        messages.push("Số điện thoại không hợp lệ (chỉ gồm 9-11 chữ số).");
                    }

                    // Nếu không hợp lệ, ngăn gửi form và báo lỗi
                    if (!isValid) {
                        e.preventDefault();
                        alert(messages.join("\n"));
                        return; // Dừng xử lý
                    }

                    // Nếu hợp lệ, hỏi xác nhận
                    const confirmed = confirm("Bạn có chắc chắn muốn hoàn tất đặt phòng?");
                    if (!confirmed) {
                        e.preventDefault(); // Hủy nếu người dùng bấm Cancel
                    }
                });
            });
        </script>


    </body>
</html>
