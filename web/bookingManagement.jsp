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
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-3xl font-semibold">Booking Management</h2>
                </div>

                <!-- Alert Messages -->
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                        <span class="block sm:inline">${sessionScope.successMessage}</span>
                    </div>
                    <c:remove var="successMessage" scope="session" />
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                        <span class="block sm:inline">${errorMessage}</span>
                    </div>
                </c:if>

                <!-- Table -->
                <div class="bg-white shadow rounded-lg overflow-x-auto">
                    <table id="booking-tbl" class="min-w-full text-sm text-left whitespace-nowrap mb-3">
                        <thead class="bg-gray-50 border-b font-medium">
                            <tr>
                                <th class="px-6 py-3">ID</th>
                                <th class="px-6 py-3">Customer Name</th>
                                <th class="px-6 py-3">Room Type Name</th>
                                <th class="px-6 py-3">Room Number</th>
                                <th class="px-6 py-3">Check-in</th>
                                <th class="px-6 py-3">Check-out</th>
                                <th class="px-6 py-3">Total Price</th>
                                <th class="px-6 py-3">Status</th>
                                <th class="px-6 py-3">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${bookingList}" var="b">
                                <tr class="border-b hover:bg-gray-50">
                                    <td class="px-6 py-4">${b.bookingId}</td>
                                    <td class="px-6 py-4 font-medium">${b.customerName}</td>
                                    <td class="px-6 py-4 font-medium">
                                        <c:forEach items="${tList}" var="rt">
                                            <c:if test="${rt.roomTypeID == b.roomTypeId}">
                                                <span class="px-6 py-4">
                                                    ${rt.roomTypeName}
                                                </span>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td class="px-6 py-4">${b.roomNumber}</td>
                                    <td class="px-6 py-4"><fmt:formatDate value="${b.checkinDate}" pattern="dd-MM-yyyy" /></td>
                                    <td class="px-6 py-4"><fmt:formatDate value="${b.checkoutDate}" pattern="dd-MM-yyyy" /></td>
                                    <td class="px-6 py-4 font-medium"><span class="price" data-price="${b.totalPrice}"></span></td>
                                    <td class="px-6 py-4">
                                        <c:choose>
                                            <c:when test="${b.status eq 'Pending'}"><span class="bg-yellow-100 text-yellow-800 text-xs px-2 py-1 rounded-full">${b.status}</span></c:when>
                                            <c:when test="${b.status eq 'Confirmed'}"><span class="bg-green-100 text-green-800 text-xs px-2 py-1 rounded-full">${b.status}</span></c:when>
                                            <c:when test="${b.status eq 'Checked-in'}"><span class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded-full">${b.status}</span></c:when>
                                            <c:when test="${b.status eq 'Checked-out'}"><span class="bg-gray-100 text-gray-800 text-xs px-2 py-1 rounded-full">${b.status}</span></c:when>
                                            <c:when test="${b.status eq 'Cancelled'}"><span class="bg-red-100 text-red-800 text-xs px-2 py-1 rounded-full">${b.status}</span></c:when>
                                            <c:otherwise><span class="bg-gray-100 text-gray-800 text-xs px-2 py-1 rounded-full">${b.status}</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4">
                                        <a href="${pageContext.request.contextPath}/admin-booking-detail?bookingId=${b.bookingId}" class="text-indigo-600 hover:text-indigo-900">
                                            <i class="fas fa-eye"></i> View
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
    $(document).ready(function () {
        const table = $('#booking-tbl').DataTable({
            autoWidth: false,
            order: [[ 0, 'desc' ]],
            columnDefs: [
                { targets: -1, orderable: false } // Disable sorting for Actions column
            ]
        });

        function formatPrices() {
            document.querySelectorAll('.price').forEach(el => {
                const price = Number(el.dataset.price);
                el.textContent = price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
            });
        }

        table.on('draw', function () {
            formatPrices();
        });

        formatPrices();
    });
    </script>
</html>
