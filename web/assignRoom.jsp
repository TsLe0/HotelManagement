<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hotel Manager - Assign Room</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
    <jsp:include page="adminHeader.jsp" />
    <div class="flex flex-1 overflow-hidden">
        <jsp:include page="adminSidebar.jsp" />
        <main class="flex-1 p-6">
            <div class="bg-white p-8 rounded-lg shadow-md max-w-lg mx-auto">
                <h2 class="text-2xl font-semibold text-gray-800 mb-6">Assign Room for Booking #${booking.bookingId}</h2>

                <form action="${pageContext.request.contextPath}/assign-room" method="POST">
                    <input type="hidden" name="bookingId" value="${booking.bookingId}">

                    <div>
                        <label for="roomNumber" class="block text-sm font-medium text-gray-700 mb-1">Available Rooms</label>
                        <select id="roomNumber" name="roomNumber" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                            <c:choose>
                                <c:when test="${not empty availableRooms}">
                                    <option value="">-- Select a Room --</option>
                                    <c:forEach items="${availableRooms}" var="room">
                                        <option value="${room.roomNumber}">${room.roomNumber}</option>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <option value="" disabled>No available rooms of this type</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>
                    
                    <c:if test="${not empty sessionScope.errorMessage}">
                        <p class="text-red-500 text-sm mt-2">${sessionScope.errorMessage}</p>
                        <c:remove var="errorMessage" scope="session"/>
                    </c:if>

                    <div class="mt-8 pt-5 border-t flex items-center justify-end gap-3">
                        <a href="${pageContext.request.contextPath}/admin-booking-detail?bookingId=${booking.bookingId}" class="text-gray-600 bg-gray-200 hover:bg-gray-300 font-bold py-2 px-4 rounded-md transition duration-300">
                            Cancel
                        </a>
                        <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-md transition duration-300" ${empty availableRooms ? 'disabled' : ''}>
                            <i class="fas fa-check-circle mr-2"></i>Confirm Assignment
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
