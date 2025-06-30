<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <title>
            Mường Thanh Luxury Quảng Ninh
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

        <style>
            body {
                font-family: "Roboto", sans-serif;
            }
        </style>
    </head>
    <body class="bg-gray-200 text-gray-800">
        <!-- Header -->
        <jsp:include page="header.jsp" />
        <!-- Search bar -->
        <section class="max-w-7xl mx-auto px-4 mt-6">
            <form action="#" class="bg-white rounded-md shadow-md p-4 flex flex-col sm:flex-row sm:space-x-4 space-y-4 sm:space-y-0" id="searchForm" method="GET">
                <!--    <div class="flex-1 min-w-[180px]">
                     <label class="block text-xs font-normal text-gray-700 mb-1" for="location">
                      Bạn muốn nghỉ dưỡng ở đâu ?
                     </label>
                     <div class="flex items-center bg-gray-100 rounded px-3 py-2 text-xs text-gray-600">
                      <i class="fas fa-map-marker-alt mr-2">
                      </i>
                      <input class="bg-transparent w-full outline-none placeholder:text-gray-400" id="location" name="location" placeholder="Mường Thanh Luxury Quảng Ninh" type="text" value="Mường Thanh Luxury Quảng Ninh"/>
                     </div>
                    </div>-->
                <div class="flex-1 min-w-[180px]">
                    <label class="block text-xs font-normal text-gray-700 mb-1" for="date">
                        Ngày nhận 
                    </label>
                    <div class="flex items-center bg-gray-100 rounded px-3 py-2 text-xs text-gray-600">
                        <i class="far fa-calendar-alt mr-2">
                        </i>
                        <input class="bg-transparent w-full outline-none placeholder:text-gray-400" id="date" name="date" placeholder="10/07/2025 - 22/08/2025" type="date" value="10/07/2025 - 22/08/2025"/>
                    </div>
                </div>
                <div class="flex-1 min-w-[180px]">
                    <label class="block text-xs font-normal text-gray-700 mb-1" for="date">
                        Trả phòng
                    </label>
                    <div class="flex items-center bg-gray-100 rounded px-3 py-2 text-xs text-gray-600">
                        <i class="far fa-calendar-alt mr-2">
                        </i>
                        <input class="bg-transparent w-full outline-none placeholder:text-gray-400" id="date" name="date" placeholder="10/07/2025 - 22/08/2025" type="date" value="10/07/2025 - 22/08/2025"/>
                    </div>
                </div>
                <div class="flex-1 min-w-[140px]">
                    <label class="block text-xs font-normal text-gray-700 mb-1" for="roomCount">
                        Số phòng
                    </label>
                    <select class="bg-gray-100 rounded px-3 py-2 text-xs text-gray-600 w-full outline-none" id="roomCount" name="roomCount">
                        <option selected="" value="1">
                            1 Phòng
                        </option>
                        <option value="2">
                            2 Phòng
                        </option>
                        <option value="3">
                            3 Phòng
                        </option>
                        <option value="4">
                            4 Phòng
                        </option>
                        <option value="5">
                            5 Phòng
                        </option>
                    </select>
                </div>
                <div class="flex-1 min-w-[220px] flex space-x-2">
                    <div class="flex-1">
                        <label class="block text-xs font-normal text-gray-700 mb-1" for="voucher">
                            Mã khuyến mãi/Voucher
                        </label>
                        <div class="flex items-center bg-gray-100 rounded px-3 py-2 text-xs text-gray-400">
                            <i class="fas fa-ticket-alt mr-2">
                            </i>
                            <input class="bg-transparent w-full outline-none placeholder:text-gray-400" id="voucher" name="voucher" placeholder="Nhập mã khuyến mại/mã Vou" type="text"/>
                        </div>
                    </div>
                    <button class="bg-yellow-500 hover:bg-yellow-600 text-white font-semibold text-xs px-4 rounded flex items-center space-x-2 whitespace-nowrap" type="submit">
                        <i class="fas fa-search">
                        </i>
                        <span>
                            TÌM KIẾM
                        </span>
                    </button>
                </div>
            </form>
        </section>
        <!-- Hotel info -->
        <section class="max-w-7xl mx-auto px-4 mt-6">
            <div class="bg-white rounded-md shadow-md p-4 flex flex-col sm:flex-row sm:space-x-6">
                <div class="flex-shrink-0 w-full sm:w-[320px] relative">
                    <img alt="Hotel exterior at sunset with blue sky and modern tall buildings" class="rounded-md object-cover w-full h-44" height="180" src="https://storage.googleapis.com/a1aa/image/5f54440a-ff66-48d4-009b-f7f80074545e.jpg" width="320"/>
                    <div class="absolute bottom-2 left-2 bg-black bg-opacity-50 text-white text-xs rounded px-2 py-1 flex items-center space-x-1">
                        <i class="fas fa-image">
                        </i>
                        <span>
                            Xem thêm ảnh
                        </span>
                    </div>
                </div>
                <div class="mt-4 sm:mt-0 flex-1 text-sm text-gray-800">
                    <h2 class="font-semibold text-base mb-1">
                        Mường Thanh Luxury Quảng Ninh
                    </h2>
                    <p class="flex items-center text-xs text-gray-600 mb-1">
                        <i class="fas fa-map-marker-alt mr-1">
                        </i>
                        Tổ 1, khu 2, phường Bãi Cháy, thành phố Hạ Long, tỉnh Quảng Ninh,
                        Việt Nam
                    </p>
                    <p class="flex items-center text-xs text-gray-600 mb-2">
                        <i class="fas fa-phone-alt mr-1">
                        </i>
                        Điện thoại: +84 203 3646 618
                    </p>
                    <p class="text-xs text-gray-700 leading-tight">
                        Tọa lạc ngay trung tâm khu du lịch Bãi Cháy - Hạ Long, từ đây du khách
                        có thể quan sát và ngắm nhìn toàn cảnh non nước Hạ Long, khách sạn
                        <strong>
                            Mường Thanh Luxury Quảng Ninh
                        </strong>
                        là một nét vẽ trong bức
                        tranh thủy mặc khổng lồ của thiên nhiên, một tạo hình tuyệt m...
                        <a class="text-red-600 hover:underline text-xs flex items-center" href="#">
                            Xem chi tiết
                            <i class="fas fa-angle-right ml-1">
                            </i>
                        </a>
                    </p>
                </div>
            </div>
        </section>
        <!-- Room selection notice -->
        <section class="max-w-7xl mx-auto px-4 mt-6">
            <div class="bg-white rounded-md shadow-md p-4 text-xs text-gray-700 font-semibold">
                Vui lòng chọn phòng
                <span class="font-normal">
                    (Có 3 loại phòng theo tìm kiếm)
                </span>
            </div>
        </section>
        <!-- Room and booking info -->
        <section class="max-w-7xl mx-auto px-4 mt-6 flex flex-col lg:flex-row lg:space-x-6 space-y-6 lg:space-y-0">
            <!-- Room cards container -->
            <div class="flex-1 flex flex-col space-y-6">
                <c:forEach items="${tList}" var="t" varStatus="loop">
                    <article class="bg-white rounded-md shadow-md p-4 flex flex-col sm:flex-row sm:space-x-6">             

                        <c:set var="imageList" value="${iList[loop.index]}" />

                        <!-- Swiper Container -->
                        <div class="swiper mySwiper w-full sm:w-[320px]">
                            <div class="swiper-wrapper">
                                <c:forEach items="${imageList}" var="d">
                                    <div class="swiper-slide relative">
                                        <img class="rounded-md object-cover w-full h-44"
                                             src="${d.roomImages}" 
                                             height="180" 
                                             width="320"/>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- Navigation buttons -->
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        </div>

                        <!-- Thông tin loại phòng -->
                        <div class="flex-1 mt-4 sm:mt-0 text-xs text-gray-800">
                            <h3 class="font-semibold text-sm mb-2">${t.roomTypeName}</h3>
                            <div class="flex items-center space-x-4 mb-2 text-gray-600">
                                <div class="flex items-center space-x-1">
                                    <i class="fas fa-bed"></i>
                                    <span>${t.numBeds}</span>
                                </div>
                                <div class="flex items-center space-x-1">
                                    <i class="fas fa-vr-cardboard"></i>
                                    <span>${t.roomArea}<sup>2</sup></span>
                                </div>
                            </div>
                            <div class="flex items-center space-x-4 mb-3 text-gray-600">
                                <i class="fas fa-tv"></i>
                                <i class="fas fa-suitcase-rolling"></i>
                                <i class="fas fa-smoking-ban"></i>
                            </div>
                            <div class="text-xs text-gray-700 mb-2">Giá chỉ từ</div>
                            <div class="text-yellow-600 font-semibold text-lg mb-2">
                                ${t.roomTypePrice} VNĐ
                                <span class="text-gray-700 font-normal text-sm">/ đêm</span>
                            </div>
                            <a href="room-detail?roomTypeId=${t.roomTypeID}">
                                <button class="bg-yellow-500 hover:bg-yellow-600 text-white text-xs font-semibold px-4 py-2 rounded">
                                    Chọn phòng
                                </button>
                            </a>
                        </div>
                    </article>
                </c:forEach>

            </div>
            <!-- Booking info -->
            <
        </section>
        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script>
            const swiper = new Swiper('.mySwiper', {
                loop: true,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                spaceBetween: 10,
            });
        </script>

    </body>
</html>
