<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Chi tiết hạng phòng - ${roomType.roomTypeName}</title>
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
        <main class="flex-1 p-6">
            <div class="max-w-7xl mx-auto">
                <h2 class="text-3xl font-semibold mb-2">Chi tiết hạng phòng: ${roomType.roomTypeName}</h2>
                <p class="text-gray-600 mb-6">Mã hạng phòng: ${roomType.roomTypeID}</p>

                <!-- Details and Images -->
                <div class="bg-white shadow rounded-lg p-6 mb-6">
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                        <div class="md:col-span-1">
                            <h3 class="text-xl font-semibold mb-4">Thông tin chung</h3>
                            <div class="space-y-3 text-gray-700">
                                <div class="flex justify-between">
                                    <span class="font-medium">Giá/Đêm:</span>
                                    <span class="font-bold text-indigo-600 price" data-price="${roomType.roomTypePrice}"></span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="font-medium">Diện tích:</span>
                                    <span>${roomType.roomArea} m²</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="font-medium">Số giường:</span>
                                    <span>${roomType.numBeds}</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="font-medium">Trạng thái:</span>
                                    <c:choose>
                                        <c:when test="${roomType.roomTypeStatus == 'Đang kinh doanh'}">
                                            <span class="bg-green-100 text-green-800 text-xs font-medium px-2.5 py-0.5 rounded-full">${roomType.roomTypeStatus}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="bg-red-100 text-red-800 text-xs font-medium px-2.5 py-0.5 rounded-full">${roomType.roomTypeStatus}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div>
                                    <span class="font-medium">Mô tả:</span>
                                    <p class="text-gray-600 mt-1">${roomType.roomDec}</p>
                                </div>
                            </div>
                        </div>
                        <div class="md:col-span-2">
                             <h3 class="text-xl font-semibold mb-4">Hình ảnh</h3>
                             <c:choose>
                                <c:when test="${not empty iList}">
                                    <div class="grid grid-cols-2 gap-4">
                                        <c:forEach items="${iList}" var="image">
                                            <img src="${image.roomImages}" alt="Room Image" class="w-full h-40 object-cover rounded-lg shadow"/>
                                        </c:forEach>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <p class="text-gray-500">Không có hình ảnh cho hạng phòng này.</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <!-- Room List -->
                <div class="bg-white shadow rounded-lg p-6">
                    <h3 class="text-xl font-semibold mb-4">Danh sách các phòng thuộc hạng này</h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full text-sm text-left whitespace-nowrap">
                            <thead class="bg-gray-100 border-b font-medium">
                                <tr>
                                    <th class="px-6 py-3">Số phòng</th>
                                    <th class="px-6 py-3">Trạng thái</th>
                                    <th class="px-6 py-3 text-right">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${rooms}" var="room">
                                    <tr class="border-b hover:bg-gray-50">
                                        <td class="px-6 py-4 font-medium">${room.roomNumber}</td>
                                        <td class="px-6 py-4">
                                            <c:choose>
                                                <c:when test="${room.roomStatus == 'Active'}">
                                                    <span class="bg-green-100 text-green-800 text-xs font-medium px-2.5 py-0.5 rounded-full">Hoạt động</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="bg-gray-200 text-gray-800 text-xs font-medium px-2.5 py-0.5 rounded-full">${room.roomStatus}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="px-6 py-4 text-right">
                                            <a href="admin-room-details?roomNumber=${room.roomNumber}" class="text-indigo-600 hover:text-indigo-900">Xem chi tiết</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty rooms}">
                                    <tr>
                                        <td colspan="3" class="text-center py-4 text-gray-500">Không có phòng nào thuộc hạng này.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        document.querySelectorAll('.price').forEach(el => {
            const price = Number(el.dataset.price);
            el.textContent = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
        });
    </script>
</body>
</html>
