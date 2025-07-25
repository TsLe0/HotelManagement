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
                        <c:if test="${not empty iList}">
                            <img alt="Room Image" class="w-full h-full object-cover" src="${iList[0].roomImages}" />
                        </c:if>
                        <c:if test="${empty iList}">
                            <div class="w-full h-full bg-gray-200 flex items-center justify-center">
                                <span class="text-gray-500">No Image</span>
                            </div>
                        </c:if>
                    </div>

                    <!-- Details -->
                    <div class="md:w-1/2 p-6 flex flex-col justify-center space-y-4">
                        <h2 class="text-3xl font-semibold text-gray-900">Room Details</h2>
                        <div class="space-y-3 text-gray-700">
                            <a href="admin  room" class="text-blue-600 hover:underline">
                                <i class="fas fa-arrow-left mr-2"></i>Back to List
                            </a
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
                                <span>${room.roomStatus}</span>
                            </div>

                            <div class="flex justify-between border-b border-gray-200 pb-2">
                                <span class="font-medium text-gray-800">Room Description:</span>
                                <span class="max-w-xs text-right">${room.roomType.roomDec}</span>
                            </div>

                            <div class="flex justify-between border-b border-gray-200 pb-2">
                                <span class="font-medium text-gray-800">Room Price:</span>
                                <span class="text-indigo-600 font-semibold price" data-price="${room.roomType.roomTypePrice}">${room.roomType.roomTypePrice}</span>
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
