<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Utils.StringUtils" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Hotel Manager - Rooms</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/2.3.2/css/dataTables.bootstrap5.min.css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/2.3.2/js/dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/2.3.2/js/dataTables.bootstrap5.min.js"></script>
    </head>

    <body class="bg-gray-50 min-h-screen flex flex-col">
        <jsp:include page="adminHeader.jsp" />

        <div class="flex flex-1 overflow-hidden">
            <aside class="hidden md:flex h-screen md:flex-col md:w-64 bg-white border-r border-gray-200 overflow-y-auto">
                <jsp:include page="adminSidebar.jsp" />
            </aside>

            <main class="flex-1 p-6">
                <div class="flex justify-between">
                    <h2 class="text-3xl font-semibold mb-6">Hạng phòng</h2>
                    <a href="add-room-type" class="text-xl font-semibold mb-6 bg-[#007bff] hover:bg-[#0069D9] py-2 px-4 rounded-lg text-white">Create</a>
                </div>

                <div class="bg-white shadow rounded-lg overflow-x-auto">
                    <c:if test="${not empty sessionScope.message}">
                    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                        <span class="block sm:inline">${sessionScope.message}</span>
                    </div>
                    <c:remove var="message" scope="session" />
                </c:if>
                <c:if test="${not empty sessionScope.errorMessage}">
                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                        <span class="block sm:inline">${sessionScope.errorMessage}</span>
                    </div>
                    <c:remove var="errorMessage" scope="session" />
                </c:if>
                    <table id="room-tbl" class="min-w-full text-sm text-left whitespace-nowrap mb-3">
                        <thead class="bg-gray-50 border-b font-medium">
                            <tr>
                                <th class="px-6 py-3">Mã hạng phòng </th>
                                <th class="px-6 py-3">Tên hạng phòng</th>
                                <th class="px-6 py-3">Giá/Đêm</th>
                                <th class="px-6 py-3">Trạng thái</th>
                                <th class="px-6 py-3">Mô tả</th>
                                <th class="px-6 py-3 text-right w-10">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${tList}" var="t">
                                <tr class="border-b hover:bg-gray-50">
                                    <td class="px-6 py-4">
                                        <a href="admin-room-type-details?roomTypeId=${t.roomTypeID}" class="text-white bg-[#25e610] hover:bg-[#218838] rounded-lg py-1.5 px-4 mr-4">
                                            ${t.roomTypeID}
                                        </a>
                                    </td>
                                    <td class="px-6 py-4">${t.roomTypeName}</td>
                                    <td class="px-6 py-4">
                                        <span class="price" data-price="${t.roomTypePrice}"></span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <c:choose>
                                            <c:when test="${t.roomTypeStatus == 'Đang kinh doanh'}">
                                                <span class="bg-green-100 text-green-800 text-xs px-2 py-1 rounded">${t.roomTypeStatus}</span>
                                            </c:when>
                                            <c:when test="${t.roomTypeStatus == 'Ngừng kinh doanh'}">
                                                <span class="bg-red-100 text-red-800 text-xs px-2 py-1 rounded">${t.roomTypeStatus}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="bg-gray-200 text-gray-800 text-xs px-2 py-1 rounded">${t.roomTypeStatus}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4">
                                        ${t.roomDec}
                                    </td>
                                    <td class="px-6 py-4 text-left">
                                        <a href="edit-roomtype?roomTypeId=${t.roomTypeID}" class="text-white bg-[#007bff] hover:bg-[#0069D9] rounded-lg py-1.5 px-4 mr-4">Edit</a>
                                        <a href="disable-room-type?roomTypeId=${t.roomTypeID}" onclick="return confirm('Bạn có chắc muốn dừng hoạt động loại phòng này?');" class="text-white bg-[#dc3545] hover:bg-[#c82333] rounded-lg py-1.5 px-4 mr-4">Disable</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>

         <script>
    $(document).ready(function () {
        const table = $('#room-tbl').DataTable({
            autoWidth: false
        });

        // Hàm format tiền
        function formatPrices() {
            document.querySelectorAll('.price').forEach(el => {
                const price = Number(el.dataset.price);
                el.textContent = price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
            });
        }

        // Gọi khi bảng vẽ lại (phân trang, search, sort...)
        table.on('draw', function () {
            formatPrices();
        });

        // Gọi ngay khi trang tải xong
        formatPrices();
    });
</script>
    </body>
</html>
