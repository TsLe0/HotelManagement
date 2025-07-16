<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Hotel Manager - Booking Management</title>

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
                    <h2 class="text-3xl font-semibold mb-6">Booking Management</h2>
                </div>

                <!-- Table -->
                <div class="bg-white shadow rounded-lg overflow-x-auto">
                    <table id="booking-tbl" class="min-w-full text-sm text-left whitespace-nowrap mb-3">
                        <thead class="bg-gray-50 border-b font-medium">
                            <tr>
                                <th class="px-6 py-3">ID</th>
                                <th class="px-6 py-3">Customer Name</th>
                                <th class="px-6 py-3">Room Type</th>
                                <th class="px-6 py-3">Room Number</th>
                                <th class="px-6 py-3">Check-in</th>
                                <th class="px-6 py-3">Check-out</th>
                                <th class="px-6 py-3">Total Price</th>
                                <th class="px-6 py-3">Status</th>
                                <th class="px-6 py-3">Booking Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${bookingList}" var="b">
                                <tr class="border-b hover:bg-gray-50">
                                    <td class="px-6 py-4">${b.bookingId}</td>
                                    <td class="px-6 py-4">${b.customerName}</td>
                                    <td class="px-6 py-4">
                                        <c:forEach items="${tList}" var="rt">
                                            <c:if test="${rt.roomTypeID == b.roomTypeId}">
                                                ${rt.roomTypeName}
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td class="px-6 py-4">${b.roomNumber}</td>
                                    <td class="px-6 py-4"><fmt:formatDate value="${b.checkinDate}" pattern="dd-MM-yyyy" /></td>
                                    <td class="px-6 py-4"><fmt:formatDate value="${b.checkoutDate}" pattern="dd-MM-yyyy" /></td>
                                    <td class="px-6 py-4"><span class="price" data-price="${b.totalPrice}"></span></td>
                                    <td class="px-6 py-4">${b.status}</td>
                                    <td class="px-6 py-4"><fmt:formatDate value="${b.bookingDate}" pattern="dd-MM-yyyy" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </body>
    <script>
    $(document).ready(function () {
        const table = $('#booking-tbl').DataTable({
            autoWidth: false,
            order: [[ 0, 'desc' ]]
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
</html>
