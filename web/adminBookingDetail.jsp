<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Hotel Manager - Booking Details</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>
        <style>
            .details-card {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                padding: 2rem;
            }
            .details-header {
                border-bottom: 1px solid #e5e7eb;
                padding-bottom: 1rem;
                margin-bottom: 1.5rem;
            }
            .details-grid {
                display: grid;
                grid-template-columns: repeat(1, 1fr);
                gap: 1.5rem;
            }
            @media (min-width: 768px) {
                .details-grid {
                    grid-template-columns: repeat(2, 1fr);
                }
            }
            .detail-item {
                display: flex;
                flex-direction: column;
            }
            .detail-item-label {
                font-size: 0.875rem;
                color: #6b7280;
                margin-bottom: 0.25rem;
            }
            .detail-item-value {
                font-size: 1rem;
                color: #111827;
                font-weight: 500;
            }
            .status-badge {
                display: inline-block;
                padding: 0.25rem 0.75rem;
                border-radius: 9999px;
                font-size: 0.875rem;
                font-weight: 600;
            }
        </style>
    </head>
    <body class="bg-gray-50 min-h-screen flex flex-col">
        <jsp:include page="adminHeader.jsp" />
        <div class="flex flex-1 overflow-hidden">
            <aside class="hidden md:flex h-screen md:flex-col md:w-64 bg-white border-r border-gray-200 overflow-y-auto">
                <jsp:include page="adminSidebar.jsp" />
            </aside>
            <main class="flex-1 p-6">
                <c:choose>
                    <c:when test="${not empty booking}">
                        <div class="details-card max-w-4xl mx-auto">
                            <div class="details-header flex justify-between items-center">
                                <div>
                                    <h2 class="text-2xl font-semibold text-gray-800">Booking #${booking.bookingId}</h2>
                                    <p class="text-gray-500">Details of the booking reservation.</p>
                                </div>
                                <a href="${pageContext.request.contextPath}/admin-booking" class="text-blue-600 hover:underline">
                                    <i class="fas fa-arrow-left mr-2"></i>Back to List
                                </a>
                            </div>

                            <div class="details-grid mt-6">
                                <!-- Customer Info -->
                                <div class="detail-item"><span class="detail-item-label">Customer Name</span><span class="detail-item-value">${booking.customerName}</span></div>
                                <div class="detail-item"><span class="detail-item-label">Customer Phone</span><span class="detail-item-value">${booking.customerPhoneNumber}</span></div>
                                <!-- Booking Details -->
                                <div class="detail-item"><span class="detail-item-label">Room Type</span><span class="detail-item-value">${roomType.roomTypeName}</span></div>
                                <div class="detail-item"><span class="detail-item-label">Room Number</span><span class="detail-item-value">${not empty booking.roomNumber ? booking.roomNumber : "Not Assigned"}</span></div>
                                <div class="detail-item"><span class="detail-item-label">Check-in</span><span class="detail-item-value"><fmt:formatDate value="${booking.checkinDate}" pattern="EEEE, dd MMMM yyyy" /></span></div>
                                <div class="detail-item"><span class="detail-item-label">Check-out</span><span class="detail-item-value"><fmt:formatDate value="${booking.checkoutDate}" pattern="EEEE, dd MMMM yyyy" /></span></div>
                                <div class="detail-item"><span class="detail-item-label">Booking Date</span><span class="detail-item-value"><fmt:formatDate value="${booking.bookingDate}" pattern="dd-MM-yyyy HH:mm" /></span></div>
                                <!-- Financials and Status -->
                                <div class="detail-item"><span class="detail-item-label">Total Price</span><span class="detail-item-value text-green-600"><fmt:formatNumber value="${booking.totalPrice}" type="currency" currencyCode="VND" /></span></div>
                                <div class="detail-item"><span class="detail-item-label">Status</span><span class="detail-item-value"><c:choose><c:when test="${booking.status eq 'Pending'}"><span class="status-badge bg-yellow-100 text-yellow-800">${booking.status}</span></c:when><c:when test="${booking.status eq 'Confirmed'}"><span class="status-badge bg-green-100 text-green-800">${booking.status}</span></c:when><c:when test="${booking.status eq 'Checked-in'}"><span class="status-badge bg-blue-100 text-blue-800">${booking.status}</span></c:when><c:when test="${booking.status eq 'Checked-out'}"><span class="status-badge bg-gray-100 text-gray-800">${booking.status}</span></c:when><c:when test="${booking.status eq 'Cancelled'}"><span class="status-badge bg-red-100 text-red-800">${booking.status}</span></c:when><c:otherwise><span class="status-badge bg-gray-100 text-gray-800">${booking.status}</span></c:otherwise></c:choose></span></div>
                                        <!-- Special Requests -->
                                                            <div class="md:col-span-2 detail-item"><span class="detail-item-label">Special Requests</span><span class="detail-item-value bg-gray-50 p-3 rounded-md">${not empty booking.specialRequests ? booking.specialRequests : "No special requests."}</span></div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="mt-8 pt-5 border-t flex justify-end gap-3">
                                <c:if test="${booking.status ne 'Cancelled' and booking.status ne 'Checked-out'}">
                                    <form action="${pageContext.request.contextPath}/admin-booking-detail" method="POST" onsubmit="return confirm('Are you sure you want to cancel this booking?');">
                                        <input type="hidden" name="action" value="cancel">
                                        <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                        <button type="submit" class="bg-red-600 hover:bg-red-700 text-white font-bold py-2 px-4 rounded-md transition duration-300">
                                            <i class="fas fa-times-circle mr-2"></i>Cancel Booking
                                        </button>
                                    </form>
                                    <a href="${pageContext.request.contextPath}/change-room?bookingId=${booking.bookingId}" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-md transition duration-300">
                                        <i class="fas fa-door-open mr-2"></i>
                                        ${not empty booking.roomNumber ? 'Change Room' : 'Assign Room'}
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center p-10 bg-white rounded-lg shadow">
                            <h2 class="text-2xl">Error</h2>
                            <p class="mt-2">${not empty errorMessage ? errorMessage : "Could not load booking details."}</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </main>
        </div>
    </body>
</html>
