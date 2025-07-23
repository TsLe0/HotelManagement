<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Muong Thanh Booking - Đặt Phòng Khách Sạn</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <style>
            body {
                font-family: "Roboto", sans-serif;
            }
        </style>
    </head>
    <body class="bg-white text-gray-800">
        <!-- Header -->
        <jsp:include page="header.jsp" />

        <!-- Booking Success Message -->
        <c:if test="${not empty sessionScope.bookingSuccess}">
            <div id="success-alert" class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative max-w-7xl mx-auto my-4" role="alert">
                <strong class="font-bold">Thành công!</strong>
                <span class="block sm:inline">${sessionScope.bookingSuccess}</span>
                <span class="absolute top-0 bottom-0 right-0 px-4 py-3" onclick="document.getElementById('success-alert').style.display = 'none';">
                    <svg class="fill-current h-6 w-6 text-green-500" role="button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><title>Close</title><path d="M14.348 14.849a1.2 1.2 0 0 1-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 1 1-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 1 1 1.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 1 1 1.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 0 1 0 1.698z"/></svg>
                </span>
            </div>
            <c:remove var="bookingSuccess" scope="session" />
        </c:if>

        <!-- Hero & Booking Form -->
        <section class="relative bg-gradient-to-r from-blue-700 to-blue-900 text-white">
            <img alt="Khách sạn Mường Thanh sang trọng với kiến trúc hiện đại và ánh đèn lung linh buổi tối" class="absolute inset-0 w-full h-full object-cover opacity-30" height="600" src="https://storage.googleapis.com/a1aa/image/40bb647b-9c81-4b98-b0b3-d6bcfb664afa.jpg" width="1920"/>
            <div class="relative max-w-7xl mx-auto px-6 py-24 flex flex-col md:flex-row items-center md:items-start md:space-x-16">
                <div class="md:w-1/2 space-y-6">
                    <h1 class="text-4xl md:text-5xl font-extrabold leading-tight">
                        Đặt Phòng Khách Sạn Mường Thanh
                    </h1>
                    <p class="text-lg max-w-xl">
                        Trải nghiệm dịch vụ đẳng cấp và tiện nghi hiện đại tại hệ thống khách
                        sạn Mường Thanh trên toàn quốc. Đặt phòng nhanh chóng, giá tốt nhất.
                    </p>
                </div>
                <div class="md:w-1/2 mt-10 md:mt-0">
                    <form action="getallrooms" method="GET" class="bg-white p-8 rounded-lg shadow-2xl space-y-6">
                        <h2 class="text-2xl font-bold text-gray-800 text-center">Tìm Kiếm Phòng</h2>
                        <div>
                            <label for="checkin" class="block text-sm font-medium text-gray-700">Ngày nhận phòng</label>
                            <input type="date" id="checkin" name="checkin" 
                                   required 
                                   class="text-gray-900 mt-1 block w-full border border-gray-300 
                                   rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                        </div>
                        <div>
                            <label for="checkout" class="block text-sm font-medium text-gray-700">Ngày trả phòng</label>
                            <input type="date" id="checkout" name="checkout" 
                                   required 
                                   class="text-black mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                        </div>

                        <button type="submit" class="w-full bg-blue-700 text-white font-semibold rounded-md py-3 hover:bg-blue-800 transition">Tìm Kiếm</button>
                    </form>
                </div>
            </div>
        </section>
        <!-- Featured Rooms Section -->
        <section class="max-w-7xl mx-auto px-6 py-16 space-y-12" id="hotels">
            <h2 class="text-3xl font-extrabold text-center text-blue-700">
                Phòng Nổi Bật
            </h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                <c:forEach items="${featuredRoomTypes}" var="roomType" varStatus="loop">
                    <article class="rounded-lg shadow-lg overflow-hidden border border-gray-200 hover:shadow-xl transition">
                        <c:choose>
                            <c:when test="${not empty featuredRoomImages[loop.index]}">
                                <img alt="${roomType.roomTypeName}" class="w-full h-56 object-cover" height="250" src="${pageContext.request.contextPath}/uploads/room_images/${featuredRoomImages[loop.index][0].imagePath}" width="400"/>
                            </c:when>
                            <c:otherwise>
                                <img alt="Default Room Image" class="w-full h-56 object-cover" height="250" src="https://storage.googleapis.com/a1aa/image/d67f6d0c-1f19-48b2-18a9-7efdd5380939.jpg" width="400"/>
                            </c:otherwise>
                        </c:choose>
                        <div class="p-4">
                            <h3 class="text-xl font-semibold text-blue-700 mb-2">
                                ${roomType.roomTypeName}
                            </h3>
                            <p class="text-gray-600 text-sm leading-relaxed">
                                ${roomType.roomDec}
                            </p>
                            <div class="mt-4">
                                <a href="${pageContext.request.contextPath}/room-detail?roomTypeId=${roomType.roomTypeID}" class="text-blue-600 hover:text-blue-800 font-semibold">Xem Chi Tiết</a>
                            </div>
                        </div>
                    </article>
                </c:forEach>
            </div>
        </section>
        <!-- Promotion Section -->
        <section class="bg-blue-50 py-16 px-6" id="promotion">
            <div class="max-w-7xl mx-auto space-y-10">
                <h2 class="text-3xl font-extrabold text-center text-blue-700">Khuyến Mãi Nổi Bật</h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-5xl mx-auto">
                    <!-- 3 khuyến mãi -->
                    <div class="bg-white rounded-lg shadow-md overflow-hidden border border-gray-200 hover:shadow-lg transition">
                        <img class="w-full h-44 object-cover" src="https://storage.googleapis.com/a1aa/image/fbdf42d4-5860-4bc3-e6f1-83f5875405bb.jpg" alt="Ưu đãi đặt sớm"/>
                        <div class="p-4">
                            <h3 class="text-xl font-semibold text-blue-700 mb-2">Ưu Đãi Đặt Sớm</h3>
                            <p class="text-gray-700 text-sm leading-relaxed">Giảm giá lên đến 20% khi đặt phòng trước 30 ngày. Nhanh tay đặt để nhận ưu đãi hấp dẫn!</p>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow-md overflow-hidden border border-gray-200 hover:shadow-lg transition">
                        <img class="w-full h-44 object-cover" src="https://storage.googleapis.com/a1aa/image/2be28863-b582-46e6-21fa-24549609cd20.jpg" alt="Khuyến mãi cuối tuần"/>
                        <div class="p-4">
                            <h3 class="text-xl font-semibold text-blue-700 mb-2">Khuyến Mãi Cuối Tuần</h3>
                            <p class="text-gray-700 text-sm leading-relaxed">Giảm giá 15% cho các đặt phòng từ thứ 6 đến chủ nhật. Thư giãn cuối tuần tuyệt vời tại Mường Thanh.</p>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow-md overflow-hidden border border-gray-200 hover:shadow-lg transition">
                        <img class="w-full h-44 object-cover" src="https://storage.googleapis.com/a1aa/image/d25f7152-9775-4103-78c1-c267a2e8535f.jpg" alt="Combo nghỉ dưỡng"/>
                        <div class="p-4">
                            <h3 class="text-xl font-semibold text-blue-700 mb-2">Combo Nghỉ Dưỡng</h3>
                            <p class="text-gray-700 text-sm leading-relaxed">Combo trọn gói bao gồm phòng ở, buffet sáng và dịch vụ spa cao cấp dành cho cặp đôi hoặc gia đình.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section class="max-w-5xl mx-auto py-16 px-6" id="contact">
            <h2 class="text-3xl font-extrabold text-center text-blue-700 mb-10">Liên Hệ Với Chúng Tôi</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <form class="bg-white rounded-lg shadow-md p-6 space-y-4" action="#" method="POST">
                    <div>
                        <label for="name" class="block text-gray-700 font-semibold mb-1">Họ và Tên</label>
                        <input type="text" id="name" name="name" required class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600"/>
                    </div>
                    <div>
                        <label for="email" class="block text-gray-700 font-semibold mb-1">Email</label>
                        <input type="email" id="email" name="email" required class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600"/>
                    </div>
                    <div>
                        <label for="message" class="block text-gray-700 font-semibold mb-1">Nội dung</label>
                        <textarea id="message" name="message" rows="4" required class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600"></textarea>
                    </div>
                    <button type="submit" class="w-full bg-blue-700 text-white font-semibold rounded-md py-3 hover:bg-blue-800 transition">Gửi Liên Hệ</button>
                </form>
                <div class="space-y-4 text-gray-700">
                    <p><i class="fas fa-map-marker-alt mr-2 text-blue-700"></i>Địa chỉ: 123 Nguyễn Văn Cừ, Hà Nội</p>
                    <p><i class="fas fa-phone mr-2 text-blue-700"></i>Hotline: 1900 1234</p>
                    <p><i class="fas fa-envelope mr-2 text-blue-700"></i>Email: info@muongthanh.vn</p>
                    <p><i class="fas fa-globe mr-2 text-blue-700"></i>Website: www.muongthanh.com</p>
                </div>
            </div>
        </section>

        <!-- Footer -->
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
