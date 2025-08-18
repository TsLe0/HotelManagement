<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                background-color: #f4f7f6;
            }
            .swiper-button-next, .swiper-button-prev {
                color: #fff;
                background-color: rgba(0, 0, 0, 0.3);
                border-radius: 50%;
                width: 40px;
                height: 40px;
                transition: background-color 0.3s ease;
            }
            .swiper-button-next:hover, .swiper-button-prev:hover {
                background-color: rgba(0, 0, 0, 0.5);
            }
            .swiper-button-next::after, .swiper-button-prev::after {
                font-size: 18px;
                font-weight: bold;
            }
            .room-card {
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            .room-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            }
        </style>
    </head>
    <body class="text-gray-800">
        <!-- Header -->
        <jsp:include page="header.jsp" />

        <main class="max-w-7xl mx-auto px-4 mt-8">
            <!-- Filter and Sort Bar -->
            <section class="bg-white rounded-lg shadow-md p-4 mb-8">
                <form action="getallrooms" method="GET" class="grid grid-cols-1 md:grid-cols-3 gap-4 items-center">
                    <!-- Search Input -->
                    <div class="relative">
                        <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                            <i class="fas fa-search text-gray-400"></i>
                        </span>
                        <input class="w-full rounded-md pl-10 pr-4 py-2 text-sm text-gray-700 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500" 
                               name="search" 
                               placeholder="Tìm theo tên phòng..." 
                               type="text"
                               value="${searchQuery}"/>
                    </div>

                    <!-- Room Type Filter -->
                    <div>
                        <select name="roomType" class="w-full rounded-md px-4 py-2 text-sm text-gray-700 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500" onchange="this.form.submit()">
                            <option value="all">Tất cả loại phòng</option>
                            <c:forEach items="${allRoomTypes}" var="type">
                                <option value="${type.roomTypeID}" ${type.roomTypeID == selectedRoomType ? 'selected' : ''}>
                                    ${type.roomTypeName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Sort Dropdown -->
                    <div>
                        <select name="sort" class="w-full rounded-md px-4 py-2 text-sm text-gray-700 border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500" onchange="this.form.submit()">
                            <option value="default" ${sort == 'default' ? 'selected' : ''}>Sắp xếp mặc định</option>
                            <option value="price_asc" ${sort == 'price_asc' ? 'selected' : ''}>Giá: Thấp đến Cao</option>
                            <option value="price_desc" ${sort == 'price_desc' ? 'selected' : ''}>Giá: Cao đến Thấp</option>
                        </select>
                    </div>
                </form>
            </section>

            <!-- Room Grid -->
            <section>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <c:forEach items="${tList}" var="t" varStatus="loop">
                        <article class="bg-white rounded-lg shadow-md overflow-hidden room-card">
                            <c:set var="imageList" value="${iList[loop.index]}" />
                            <!-- Swiper Container -->
                            <div class="swiper mySwiper w-full h-56">
                                <div class="swiper-wrapper">
                                    <c:if test="${empty imageList}">
                                        <div class="swiper-slide">
                                            <img class="object-cover w-full h-full" src="https://via.placeholder.com/400x300.png?text=No+Image" alt="No Image Available"/>
                                        </div>
                                    </c:if>
                                    <c:forEach items="${imageList}" var="d">
                                        <div class="swiper-slide">
                                            <img class="object-cover w-full h-full" src="${d.roomImages}" alt="${t.roomTypeName}"/>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
                            </div>

                            <!-- Room Info -->
                            <div class="p-5 flex flex-col flex-grow">
                                <h3 class="font-bold text-xl mb-2 text-gray-900">${t.roomTypeName}</h3>
                                <p class="text-gray-600 text-sm mb-4 flex-grow">${t.roomDec}</p>
                                
                                <div class="flex items-center justify-between text-sm text-gray-600 mb-4">
                                    <div class="flex items-center space-x-2">
                                        <i class="fas fa-users text-blue-500"></i>
                                        <span>${t.numBeds} người</span>
                                    </div>
                                    <div class="flex items-center space-x-2">
                                        <i class="fas fa-ruler-combined text-blue-500"></i>
                                        <span>${t.roomArea} m<sup>2</sup></span>
                                    </div>
                                </div>

                                <div class="border-t border-gray-200 pt-4 mt-auto">
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <span class="text-gray-500 text-xs">Giá mỗi đêm từ</span>
                                            <div class="text-blue-600 font-bold text-xl">
                                                <fmt:formatNumber value="${t.roomTypePrice}" type="currency" currencyCode="VND" minFractionDigits="0"/>
                                            </div>
                                        </div>
                                        <a href="room-detail?roomTypeId=${t.roomTypeID}&checkin=${checkin}&checkout=${checkout}" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-lg transition-colors">
                                           Đặt Phòng 
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </c:forEach>
                </div>
                
                <c:if test="${empty tList}">
                    <div class="text-center col-span-full bg-white p-10 rounded-lg shadow-md">
                        <i class="fas fa-search-minus fa-3x text-gray-400 mb-4"></i>
                        <p class="text-gray-600 text-lg">Không tìm thấy loại phòng phù hợp.</p>
                        <a href="getallrooms" class="mt-4 inline-block text-blue-500 hover:underline">Xóa bộ lọc và thử lại</a>
                    </div>
                </c:if>
            </section>

            <!-- Pagination -->
            <section class="mt-12 mb-8">
                <c:if test="${totalPages > 1}">
                    <nav class="flex justify-center items-center space-x-2">
                        <c:if test="${currentPage > 1}">
                            <a href="getallrooms?page=${currentPage - 1}&search=${searchQuery}&sort=${sort}&roomType=${selectedRoomType}" class="px-4 py-2 bg-white border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-100">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </c:if>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <a href="getallrooms?page=${i}&search=${searchQuery}&sort=${sort}&roomType=${selectedRoomType}" class="px-4 py-2 ${currentPage == i ? 'bg-blue-500 text-white border-blue-500' : 'bg-white'} border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-100">
                                ${i}
                            </a>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <a href="getallrooms?page=${currentPage + 1}&search=${searchQuery}&sort=${sort}&roomType=${selectedRoomType}" class="px-4 py-2 bg-white border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-100">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </c:if>
                    </nav>
                </c:if>
            </section>
        </main>
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

            let searchTimeout;
            const searchInput = document.querySelector('input[name="search"]');
            const searchForm = searchInput.form;

            searchInput.addEventListener('input', () => {
                clearTimeout(searchTimeout);
                searchTimeout = setTimeout(() => {
                    searchForm.submit();
                }, 1000); // Wait for 500ms after the user stops typing
            });
        </script>

    </body>
</html>
