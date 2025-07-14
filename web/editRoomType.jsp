<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <title>Hotel Manager - Edit Room Type</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter&amp;display=swap" rel="stylesheet"/>
</head>
<body class="bg-white text-gray-900">
<div class="flex flex-col ">
    <!-- Header -->
    <jsp:include page="adminHeader.jsp" />
    <div class="flex flex-1 overflow-hidden">
        <!-- Sidebar -->
        <aside class="hidden md:flex h-screen md:flex-col md:w-64 bg-white border-r border-gray-200 overflow-y-auto">
            <jsp:include page="adminSidebar.jsp" />
        </aside>
        <!-- Main content -->
        <main class="flex-1 overflow-auto p-6 bg-slate-50">
            <h2 class="text-2xl font-semibold mb-6 select-none">
                Sửa thông tin hạng phòng
            </h2>
            <form class="bg-white rounded-md shadow-sm border border-gray-200 p-6 max-w-lg"
                  action="edit-roomtype" method="POST">

                <!-- RoomTypeID -->
                <div class="mb-4">
                    <label class="block text-gray-700 font-semibold mb-2" for="roomTypeID">
                        Mã hạng phòng
                    </label>
                    <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500 bg-gray-100"
                           id="roomTypeID" name="roomTypeId" required type="text" value="${roomType.roomTypeID}" readonly/>
                </div>

                <!-- RoomTypeName -->
                <div class="mb-4">
                    <label class="block text-gray-700 font-semibold mb-2" for="roomTypeName">
                        Tên hạng phòng
                    </label>
                    <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                           id="roomTypeName" name="roomTypeName" required type="text" value="${roomType.roomTypeName}"/>
                </div>

                <!-- Price -->
                <div class="mb-4">
                    <label class="block text-gray-700 font-semibold mb-2" for="roomTypePrice">
                        Giá / đêm (₫)
                    </label>
                    <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                           id="roomTypePrice" name="roomTypePrice" type="number" min="0" step="1000" required value="${roomType.roomTypePrice}"/>
                </div>

                <!-- Area -->
                <div class="mb-4">
                    <label class="block text-gray-700 font-semibold mb-2" for="roomArea">
                        Diện tích (m²)
                    </label>
                    <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                           id="roomArea" name="roomArea" type="number" step="0.1" min="0" required value="${roomType.roomArea}"/>
                </div>

                <!-- Number of Beds -->
                <div class="mb-4">
                    <label class="block text-gray-700 font-semibold mb-2" for="numBeds">
                        Số giường
                    </label>
                    <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                           id="numBeds" name="numBeds" type="number" min="1" required value="${roomType.numBeds}"/>
                </div>

                <!-- Description -->
                <div class="mb-4">
                    <label class="block text-gray-700 font-semibold mb-2" for="roomDec">
                        Mô tả
                    </label>
                    <textarea class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                              id="roomDec" name="roomDec" rows="3">${roomType.roomDec}</textarea>
                </div>

                <!-- Status -->
                <div class="mb-4">
                    <label class="block text-gray-700 font-semibold mb-2" for="roomTypeStatus">
                        Trạng thái
                    </label>
                    <select class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                            id="roomTypeStatus" name="roomTypeStatus" required>
                        <option value="Đang kinh doanh" ${roomType.roomTypeStatus == 'Đang kinh doanh' ? 'selected' : ''}>Đang kinh doanh</option>
                        <option value="Ngừng kinh doanh" ${roomType.roomTypeStatus == 'Ngừng kinh doanh' ? 'selected' : ''}>Ngừng kinh doanh</option>
                    </select>
                </div>

                <!-- Error message -->
                <c:if test="${not empty error}">
                    <div class="mb-4">
                        <p class="text-red-600 font-medium">${error}</p>
                    </div>
                </c:if>

                <!-- Buttons -->
                <div class="flex justify-end space-x-3">
                    <a href='admin-room-type'
                       class="bg-gray-200 text-gray-800 hover:bg-gray-300 font-semibold px-5 py-2 rounded-md">
                        Hủy
                    </a>
                    <button class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-5 py-2 rounded-md" type="submit">
                        Lưu thay đổi
                    </button>
                </div>
            </form>
        </main>
    </div>
</div>
</body>
</html>
