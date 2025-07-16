<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hotel Manager - Change Room</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
    <jsp:include page="adminHeader.jsp" />
    <div class="flex flex-1 overflow-hidden">
        <aside class="hidden md:flex h-screen md:flex-col md:w-64 bg-white border-r border-gray-200 overflow-y-auto">
            <jsp:include page="adminSidebar.jsp" />
        </aside>
        <main class="flex-1 p-6">
            <div class="max-w-lg mx-auto bg-white p-8 rounded-lg shadow">
                <h2 class="text-2xl font-semibold text-gray-800 mb-6">Change Room for Booking #${booking.bookingId}</h2>
                <form action="${pageContext.request.contextPath}/change-room" method="POST">
                    <input type="hidden" name="bookingId" value="${booking.bookingId}">
                    <input type="hidden" name="oldRoomNumber" value="${booking.roomNumber}">
                    
                    <div class="mb-4">
                        <label for="currentRoom" class="block text-sm font-medium text-gray-700">Current Room</label>
                        <input type="text" id="currentRoom" value="${booking.roomNumber}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md bg-gray-100" readonly>
                    </div>

                    <div class="mb-6">
                        <label for="newRoomNumber" class="block text-sm font-medium text-gray-700">Select New Room</label>
                        <select id="newRoomNumber" name="newRoomNumber" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                            <c:forEach var="room" items="${availableRooms}">
                                <option value="${room.roomNumber}">${room.roomNumber}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="flex justify-end gap-4">
                        <a href="${pageContext.request.contextPath}/admin-booking-detail?bookingId=${booking.bookingId}" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded">
                            Cancel
                        </a>
                        <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                            <i class="fas fa-exchange-alt mr-2"></i>Confirm Change
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
