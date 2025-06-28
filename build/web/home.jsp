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
    <body class="bg-white text-gray-800">
        <!-- Header -->
        <jsp:include page="header.jsp" />
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
                <!-- Hiển thị lựa chọn của người dùng -->
                <div class="mt-8 bg-gray-100 rounded-lg p-4 text-gray-700 shadow-inner">
                    <h2 class="text-lg font-bold mb-2">Thông tin bạn vừa chọn:</h2>
                    <p id="show-checkin">Ngày đến: Chưa chọn</p>
                    <p id="show-checkout">Ngày đi: Chưa chọn</p>
                    <p id="show-hotel">Khách sạn: Chưa chọn</p>
                    <p id="show-room-type">Loại phòng: Chưa chọn</p>
                    <p id="show-guests">Số khách: 1</p>
                </div>


            </div>
        </section>
        <!-- Hotels Section -->
        <section class="max-w-7xl mx-auto px-6 py-16 space-y-12" id="hotels">
            <h2 class="text-3xl font-extrabold text-center text-blue-700">
                Hệ Thống Khách Sạn Mường Thanh
            </h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                <article class="rounded-lg shadow-lg overflow-hidden border border-gray-200 hover:shadow-xl transition">
                    <img alt="Khách sạn Mường Thanh Grand Hà Nội với kiến trúc hiện đại và ánh sáng ban ngày" class="w-full h-56 object-cover" height="250" src="https://storage.googleapis.com/a1aa/image/d67f6d0c-1f19-48b2-18a9-7efdd5380939.jpg" width="400"/>
                    <div class="p-4">
                        <h3 class="text-xl font-semibold text-blue-700 mb-2">
                            Mường Thanh Grand Hà Nội
                        </h3>
                        <p class="text-gray-600 text-sm leading-relaxed">
                            Khách sạn 5 sao sang trọng tọa lạc tại trung tâm thủ đô Hà Nội,
                            tiện nghi hiện đại, dịch vụ đẳng cấp.
                        </p>
                    </div>
                </article>
                <article class="rounded-lg shadow-lg overflow-hidden border border-gray-200 hover:shadow-xl transition">
                    <img alt="Khách sạn Mường Thanh Premier Đà Nẵng nhìn ra biển với bãi cát trắng và bầu trời xanh" class="w-full h-56 object-cover" height="250" src="https://storage.googleapis.com/a1aa/image/738f10e3-9298-4a24-ae28-3c31227a9c41.jpg" width="400"/>
                    <div class="p-4">
                        <h3 class="text-xl font-semibold text-blue-700 mb-2">
                            Mường Thanh Premier Đà Nẵng
                        </h3>
                        <p class="text-gray-600 text-sm leading-relaxed">
                            Khách sạn 4 sao cao cấp bên bờ biển Mỹ Khê, Đà Nẵng, với phòng nghỉ
                            hướng biển tuyệt đẹp.
                        </p>
                    </div>
                </article>
                <article class="rounded-lg shadow-lg overflow-hidden border border-gray-200 hover:shadow-xl transition">
                    <img alt="Khách sạn Mường Thanh Standard Hạ Long với view vịnh Hạ Long và núi non" class="w-full h-56 object-cover" height="250" src="https://storage.googleapis.com/a1aa/image/e9bc38d5-d58a-4c85-8690-42b305823c8c.jpg" width="400"/>
                    <div class="p-4">
                        <h3 class="text-xl font-semibold text-blue-700 mb-2">
                            Mường Thanh Standard Hạ Long
                        </h3>
                        <p class="text-gray-600 text-sm leading-relaxed">
                            Khách sạn tiêu chuẩn với vị trí thuận lợi gần vịnh Hạ Long, tiện
                            nghi đầy đủ cho kỳ nghỉ gia đình.
                        </p>
                    </div>
                </article>
                <article class="rounded-lg shadow-lg overflow-hidden border border-gray-200 hover:shadow-xl transition">
                    <img alt="Khu resort Mường Thanh Phú Quốc với hồ bơi ngoài trời và cây xanh nhiệt đới" class="w-full h-56 object-cover" height="250" src="https://storage.googleapis.com/a1aa/image/69c2e0f9-d010-4647-0655-d768ba6fbf15.jpg" width="400"/>
                    <div class="p-4">
                        <h3 class="text-xl font-semibold text-blue-700 mb-2">
                            Mường Thanh Resort Phú Quốc
                        </h3>
                        <p class="text-gray-600 text-sm leading-relaxed">
                            Khu nghỉ dưỡng cao cấp tại đảo Phú Quốc với hồ bơi, spa và bãi biển
                            riêng.
                        </p>
                    </div>
                </article>
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
        <footer class="bg-blue-900 text-white py-6">
            <div class="max-w-7xl mx-auto text-center text-sm">
                &copy; 2025 Mường Thanh Hospitality. Đã đăng ký bản quyền.
            </div>
        </footer>

        <script>
            document.getElementById('menu-btn').addEventListener('click', function () {
                const menu = document.getElementById('mobile-menu');
                menu.classList.toggle('hidden');
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const checkin = document.getElementById("checkin");
                const checkout = document.getElementById("checkout");
                const hotel = document.getElementById("hotel");
                const roomType = document.getElementById("room-type");
                const guests = document.getElementById("guests");

                function updateInfo() {
                    document.getElementById("show-checkin").innerText = "Ngày đến: " + (checkin.value || "Chưa chọn");
                    document.getElementById("show-checkout").innerText = "Ngày đi: " + (checkout.value || "Chưa chọn");

                    let hotelText = hotel.options[hotel.selectedIndex]?.text || "Chưa chọn";
                    document.getElementById("show-hotel").innerText = "Khách sạn: " + hotelText;

                    let roomTypeText = roomType.options[roomType.selectedIndex]?.text || "Chưa chọn";
                    document.getElementById("show-room-type").innerText = "Loại phòng: " + roomTypeText;

                    document.getElementById("show-guests").innerText = "Số khách: " + guests.value;
                }

                checkin.addEventListener("change", updateInfo);
                checkout.addEventListener("change", updateInfo);
                hotel.addEventListener("change", updateInfo);
                roomType.addEventListener("change", updateInfo);
                guests.addEventListener("input", updateInfo);

                updateInfo(); // Gọi lần đầu để hiển thị mặc định
            });
        </script>

    </body>
</html>