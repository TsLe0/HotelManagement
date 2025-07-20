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
        <!-- Search and Sort bar -->
        <section class="max-w-7xl mx-auto px-4 mt-6">
            <form action="getallrooms" class="bg-white rounded-md shadow-md p-4 flex items-center space-x-4" method="GET">
                <div class="flex-grow">
                    <input class="w-full rounded-md px-4 py-2 text-sm text-gray-700 border border-gray-300 focus:outline-none" 
                           name="search" 
                           placeholder="Nhập tên phòng để tìm kiếm..." 
                           type="text"
                           value="${searchQuery}"/>
                </div>
                <div>
                    <select name="sort" class="rounded-md px-4 py-2 text-sm text-gray-700 border border-gray-300 focus:outline-none" onchange="this.form.submit()">
                        <option value="default" ${sort == 'default' ? 'selected' : ''}>Sắp xếp mặc định</option>
                        <option value="price_asc" ${sort == 'price_asc' ? 'selected' : ''}>Giá: Thấp đến Cao</option>
                        <option value="price_desc" ${sort == 'price_desc' ? 'selected' : ''}>Giá: Cao đến Thấp</option>
                    </select>
                </div>
<!--                <button class="bg-yellow-500 hover:bg-yellow-600 text-white font-semibold text-sm px-6 py-2 rounded-md flex items-center" type="submit">
                    <i class="fas fa-search"></i>
                </button>-->
            </form>
        </section>
        <!-- Hotel info -->

        <!-- Room selection notice -->
        <section class="max-w-7xl mx-auto px-4 mt-6">
            <div class="bg-white rounded-md shadow-md p-4 text-xs text-gray-700 font-semibold">
                Vui lòng chọn phòng
                <span class="font-normal">                </span>
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
                                    <span>${t.roomArea}m<sup>2</sup></span>
                                </div>
                            </div>
                            <div class="flex items-center space-x-4 mb-3 text-gray-600">
                                <i class="fas fa-tv"></i>
                                <i class="fas fa-suitcase-rolling"></i>
                                <i class="fas fa-smoking-ban"></i>
                            </div>
                                 <div class="flex items-center space-x-1">
                                    <i class="fas fa-bed"></i>
                                    <span>${t.roomDec}</span>
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
                <!-- Pagination -->
                <div class="flex justify-center mt-6">
                    <nav class="flex items-center space-x-2">
                        <c:if test="${currentPage > 1}">
                            <a href="getallrooms?page=${currentPage - 1}&search=${searchQuery}&sort=${sort}" class="px-4 py-2 bg-white border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">
                                Previous
                            </a>
                        </c:if>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <a href="getallrooms?page=${i}&search=${searchQuery}&sort=${sort}" class="px-4 py-2 ${currentPage == i ? 'bg-yellow-500 text-white' : 'bg-white'} border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">
                                ${i}
                            </a>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <a href="getallrooms?page=${currentPage + 1}&search=${searchQuery}&sort=${sort}" class="px-4 py-2 bg-white border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50">
                                Next
                            </a>
                        </c:if>
                    </nav>
                </div>
            </div>
            <!-- Booking info -->
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
