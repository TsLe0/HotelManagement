
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <title>
            Hotel Manager - Create Room
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
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
                        Create New Room
                    </h2>
                    <form class="bg-white rounded-md shadow-sm border border-gray-200 p-6 max-w-lg" action="add-room" method="POST">
                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2 select-none" for="roomNumber">
                                Room Number
                            </label>
                            <input 
                                class="w-full border border-gray-300 rounded-md px-3 py-2 text-gray-900 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500" 
                                id="roomNumber" 
                                name="roomNumber" 
                                placeholder="Enter room number"
                                required="" 
                                type="text"/>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2 select-none" for="roomType">
                                Room Type
                            </label>
                            <select class="w-full border border-gray-300 rounded-md px-3 py-2 text-gray-900 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500" id="roomType" name="roomTypeId" required="">
                                <option value="" disabled selected>Select room type</option>
                                <c:forEach items="${roomTypeList}" var="s">
                                    <option value="${s.roomTypeID}" data-price="${s.roomTypePrice}">
                                        ${s.roomTypeName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-6">
                            <label class="block text-gray-700 font-semibold mb-2 select-none" for="price">
                                Price/Night (VNĐ)
                            </label>
                            <input class="w-full border border-gray-300 rounded-md px-3 py-2 bg-gray-100 text-gray-900 text-sm" id="price" name="price" readonly type="text"/>
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2 select-none" for="status">
                                Trạng thái
                            </label>
                            <select class="w-full border border-gray-300 rounded-md px-3 py-2 text-gray-900 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500" 
                                    id="status" name="roomStatus" required>
                                <option value="Trống">Trống</option>
                                <option value="Đang sử dụng">Đang sử dụng</option>
                                <option value="Bảo trì">Bảo trì</option>
                            </select>
                        </div>


                        <c:if test="${not empty addRoomError}">
                            <div class="mb-4">
                                <p class="text-red-600 font-medium">${addRoomError}</p>
                            </div>
                        </c:if>

                        <div class="flex justify-end space-x-3">
                            <a
                                href='adminroom'
                                class="bg-red-600 text-white hover:bg-red-800 text-gray-800 font-semibold px-5 py-2 rounded-md" type="reset">
                                Cancel
                            </a>
                            <button class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold px-5 py-2 rounded-md" type="reset">
                                Reset
                            </button>
                            <button class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-5 py-2 rounded-md" type="submit">
                                Create
                            </button>
                        </div>
                    </form>
                </main>
            </div>
        </div>
        <script>
            document.getElementById('roomType').addEventListener('change', function () {
                const selectedOption = this.options[this.selectedIndex];
                const price = selectedOption.dataset.price;
                const priceField = document.getElementById('price');

                if (price) {
                    priceField.value = parseFloat(price).toLocaleString('vi-VN');
                } else {
                    priceField.value = '';
                }
            });
        </script>
    </body>
</html>
