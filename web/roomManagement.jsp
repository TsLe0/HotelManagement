

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Hotel Manager - Rooms</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <script src="https://cdn.tailwindcss.com"></script>

        <link rel="stylesheet" href="https://cdn.datatables.net/2.3.2/css/dataTables.bootstrap5.min.css" />

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

        <script src="https://cdn.datatables.net/2.3.2/js/dataTables.min.js"></script>

        <script src="https://cdn.datatables.net/2.3.2/js/dataTables.bootstrap5.min.js"></script>
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

            <!-- Main Content -->
            <main class="flex-1 p-6">
                <div class="flex justify-between">
                    <h2 class="text-3xl font-semibold mb-6">Rooms</h2>
                    <a href="add-room"
                       class="text-xl font-semibold mb-6 bg-[#007bff] cursor-pointer hover:bg-[#0069D9] py-2 px-4 rounded-lg text-white">
                        Create
                    </a>
                </div>

                <!-- Table -->
                <div class="bg-white shadow rounded-lg overflow-x-auto">
                    <table id="room-tbl" class="min-w-full text-sm text-left whitespace-nowrap mb-3">
                        <thead class="bg-gray-50 border-b font-medium">
                            <tr>
                                <th class="px-6 py-3">RoomNumber</th>
                                <th class="px-6 py-3">RoomName</th>
                                <th class="px-6 py-3">Status</th>
                                <th class="px-6 py-3">Price/Night</th>
                                <th class="px-6 py-3 text-right w-10">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${rList}" var="r">
                                <!-- Room 1 -->
                                <tr class="border-b hover:bg-gray-50">
                                    <td class="px-6 py-4" >
                                        <a href="admin-room-details?roomNumber=${r.roomNumber}"
                                           class="text-white bg-[#25e610] hover:bg-[#218838]
                                           rounded-lg py-1.5 px-4 mr-4"
                                           >
                                            ${r.roomNumber}
                                        </a>
                                    </td>
                                    <td class="px-6 py-4"> ${r.roomType.roomTypeName}</td>
                                    <td class="px-6 py-4">
                                        <c:choose>
                                            <c:when test="${r.roomStatus.roomStatusName == 'Trống'}">
                                                <span class="bg-green-100 text-green-800 text-xs px-2 py-1 rounded">${r.roomStatus.roomStatusName}</span>
                                            </c:when>
                                            <c:when test="${r.roomStatus.roomStatusName == 'Đang sử dụng'}">
                                                <span class="bg-yellow-100 text-yellow-800 text-xs px-2 py-1 rounded">${r.roomStatus.roomStatusName}</span>
                                            </c:when>
                                            <c:when test="${r.roomStatus.roomStatusName == 'Bảo trì'}">
                                                <span class="bg-red-100 text-red-800 text-xs px-2 py-1 rounded">${r.roomStatus.roomStatusName}</span>
                                            </c:when>
                                            <c:when test="${r.roomStatus.roomStatusName == 'Vô hiệu hóa'}">
                                                <span class="bg-gray-800 text-white text-xs px-2 py-1 rounded">${r.roomStatus.roomStatusName}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="bg-gray-200 text-gray-800 text-xs px-2 py-1 rounded">${r.roomStatus.roomStatusName}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4">
                                        <span class="price" data-price="${r.roomPrice}"></span>
                                    </td>
                                    <td class="px-6 py-4 text-left">
                                        <a href="update-room?roomNumber=${r.roomNumber}"
                                           class="text-white bg-[#007bff] hover:bg-[#0069D9]
                                           rounded-lg py-1.5 px-4 mr-4"
                                           >
                                            Edit
                                        </a>
                                        <a href="detele-room?roomNumber=${r.roomNumber}" 
                                           onclick="return confirm('Bạn có chắc muốn dừng hoạt động  phòng này?');"
                                           class="text-white bg-[#dc3545] hover:bg-[#c82333]
                                           rounded-lg py-1.5 px-4 mr-4"
                                           >
                                            Disable
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>

        </div>
    </body>
    <script>
        $('#room-tbl').DataTable({
            autoWidth: false
        });

    </script>

    <script>
        document.querySelectorAll('.price').forEach(el => {
            const price = Number(el.dataset.price);
            el.textContent = price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
        });
    </script>
</html>

