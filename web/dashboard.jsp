<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <title>Mường Thanh Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">
    <jsp:include page="adminHeader.jsp" />

    <div class="flex flex-1 overflow-hidden">
        <aside class="hidden md:flex md:flex-col md:w-64 bg-white border-r border-gray-200 overflow-y-auto">
            <jsp:include page="adminSidebar.jsp" />
        </aside>
        <main class="flex-1 overflow-y-auto p-6">
            <h2 class="text-3xl font-semibold text-gray-800 mb-6">Dashboard Overview</h2>

            <!-- Stats Section -->
            <section class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                  <div class="bg-white rounded-lg shadow p-5 flex items-center space-x-4">
                    <div class="p-3 bg-blue-100 text-blue-600 rounded-full">
                        <i class="fas fa-bed fa-2x"></i>
                    </div>
                    <div>
                        <p class="text-gray-500 font-semibold">Hạng phòng </p>
                        <p class="text-2xl font-bold text-gray-800">
                            ${totalRoomTypes}
                        </p>
                    </div>
                </div>
                <div class="bg-white rounded-lg shadow p-5 flex items-center space-x-4">
                    <div class="p-3 bg-blue-100 text-blue-600 rounded-full">
                        <i class="fas fa-bed fa-2x"></i>
                    </div>
                    <div>
                        <p class="text-gray-500 font-semibold">Số phòng </p>
                        <p class="text-2xl font-bold text-gray-800">
                            ${totalRooms}
                        </p>
                    </div>
                </div>
              
                <div class="bg-white rounded-lg shadow p-5 flex items-center space-x-4">
                    <div class="p-3 bg-green-100 text-green-600 rounded-full">
                        <i class="fas fa-calendar-check fa-2x"></i>
                    </div>
                    <div>
                        <p class="text-gray-500 font-semibold">Lượt đặt phòng</p>
                        <p class="text-2xl font-bold text-gray-800">
                            ${totalBookings}
                        </p>
                    </div>
                </div>
            </section>

            <section class="mb-10">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">Recent Bookings</h3>
                <div class="overflow-x-auto bg-white rounded-lg shadow">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Booking ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Guest Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Room Type Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Check-in</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Check-out</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach var="booking" items="${recentBookings}">
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 font-mono">
                                        ${booking.bookingId}
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        ${booking.customerName}
                                    </td>
                                 <td class="px-6 py-4">
                                        <c:forEach items="${tList}" var="rt">
                                            <c:if test="${rt.roomTypeID == booking.roomTypeId}">
                                                <span class="px-6 py-4">
                                                    ${rt.roomTypeName}
                                                </span>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        ${booking.checkinDate}
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        ${booking.checkoutDate}
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full
                                            <c:choose>
                                                <c:when test="${booking.status == 'Confirmed'}">
                                                    bg-green-100 text-green-800
                                                </c:when>
                                                <c:when test="${booking.status == 'Pending'}">
                                                    bg-yellow-100 text-yellow-800
                                                </c:when>
                                                <c:otherwise>
                                                    bg-red-100 text-red-800
                                                </c:otherwise>
                                            </c:choose>">
                                            ${booking.status}
                                        </span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>

        </main>
    </div>
</body>
</html>
