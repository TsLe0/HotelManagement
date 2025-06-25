<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Room Details</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }
        </style>
    </head>

    <body class="bg-gray-50 min-h-screen flex flex-col">

        <!-- Header -->
        <jsp:include page="adminHeader.jsp" />

        <!-- Content -->
        <div class="flex flex-1 overflow-hidden">

            <!-- Sidebar -->
            <aside class="hidden md:flex h-screen md:flex-col md:w-64 bg-white border-r border-gray-200 overflow-y-auto">
                <jsp:include page="adminSidebar.jsp" />
            </aside>

            <!-- Main content -->
            <main class="flex-1 flex items-center justify-center p-6">
                <div id="contentBox" class="max-w-4xl w-full bg-white rounded-lg shadow-lg overflow-hidden md:flex">

                    <!-- Image -->
                    <div class="md:w-1/2">
                        <img alt="Room Image" class="w-full h-full object-cover" src="${room.roomType.imagePath}" />
                    </div>

                    <!-- Details -->
                    <div class="md:w-1/2 p-6 flex flex-col justify-center space-y-4">
                        <h2 class="text-3xl font-semibold text-gray-900">Room Details</h2>
                        <div class="space-y-3 text-gray-700">

                            <!-- Room Number -->
                            <div class="flex justify-between border-b border-gray-200 pb-2">
                                <span class="font-medium text-gray-800">Room Number:</span>
                                <span>${room.roomNumber}</span>
                            </div>

                            <!-- Room Type -->
                            <div class="flex justify-between border-b border-gray-200 pb-2">
                                <span class="font-medium text-gray-800">Room Type:</span>
                                <span>${room.roomType.roomTypeName}</span>
                            </div>

                            <!-- Room Status -->
                            <div class="flex justify-between border-b border-gray-200 pb-2">
                                <span class="font-medium text-gray-800">Room Status:</span>
                                <c:choose>
                                    <c:when test="${room.roomStatus.roomStatusName == 'Trống'}">
                                        <span class="bg-green-100 text-green-800 text-xs px-2 py-1 rounded">${room.roomStatus.roomStatusName}</span>
                                    </c:when>
                                    <c:when test="${room.roomStatus.roomStatusName == 'Đang sử dụng'}">
                                        <span class="bg-yellow-100 text-yellow-800 text-xs px-2 py-1 rounded">${room.roomStatus.roomStatusName}</span>
                                    </c:when>
                                    <c:when test="${room.roomStatus.roomStatusName == 'Bảo trì'}">
                                        <span class="bg-red-100 text-red-800 text-xs px-2 py-1 rounded">${room.roomStatus.roomStatusName}</span>
                                    </c:when>
                                    <c:when test="${room.roomStatus.roomStatusName == 'Vô hiệu hóa'}">
                                        <span class="bg-gray-800 text-white text-xs px-2 py-1 rounded">${room.roomStatus.roomStatusName}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="bg-gray-200 text-gray-800 text-xs px-2 py-1 rounded">${room.roomStatus.roomStatusName}</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>


                            <div class="flex justify-between border-b border-gray-200 pb-2">
                                <span class="font-medium text-gray-800">Room Description:</span>
                                <span class="max-w-xs text-right">${room.roomDesc}</span>
                            </div>


                            <div class="flex justify-between border-b border-gray-200 pb-2">
                                <span class="font-medium text-gray-800">Room Price:</span>
                                <span class="text-indigo-600 font-semibold price" data-price="${room.roomPrice}">${room.roomPrice}</span>
                            </div>

                            <!-- Number of Beds -->
                            <div class="flex justify-between border-b border-gray-200 pb-2">
                                <span class="font-medium text-gray-800">Number of Beds:</span>
                                <span>${room.roomType.numBeds}</span>
                            </div>

                        </div>
                    </div>

                </div>
            </main>

        </div>

        <!-- JS -->
        <script>
            document.querySelectorAll('.price').forEach(el => {
                const price = Number(el.dataset.price);
                el.textContent = price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
            });

            // Click ra ngoài box để quay về list
            document.body.addEventListener('click', function (e) {
                const box = document.getElementById('contentBox');
                if (!box.contains(e.target)) {
                    window.location.href = 'adminroom';
                }
            });
        </script>

    </body>
</html>
