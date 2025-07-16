<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Hotel Manager - Booking Management</title>

        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/2.3.2/css/dataTables.min.css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/2.3.2/js/dataTables.min.js"></script>
        
        <style>
            .dropdown {
                position: relative;
                display: inline-block;
            }
            
            .dropdown-toggle {
                background: white;
                border: 1px solid #d1d5db;
                border-radius: 0.375rem;
                padding: 0.375rem 0.75rem;
                cursor: pointer;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }
            
            .dropdown-toggle:hover {
                background: #f9fafb;
            }
            
            .dropdown-menu {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                z-index: 1000;
                min-width: 10rem;
                padding: 0.5rem 0;
                margin: 0;
                background: white;
                border: 1px solid #d1d5db;
                border-radius: 0.375rem;
                box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            }
            
            .dropdown-menu.show {
                display: block;
            }
            
            .dropdown-item {
                display: block;
                width: 100%;
                padding: 0.375rem 1rem;
                text-decoration: none;
                color: #374151;
                border: none;
                background: none;
                cursor: pointer;
                text-align: left;
            }
            
            .dropdown-item:hover {
                background: #f3f4f6;
            }
            
            .alert {
                padding: 1rem;
                margin-bottom: 1rem;
                border-radius: 0.375rem;
                position: relative;
            }
            
            .alert-success {
                background-color: #d1fae5;
                color: #065f46;
                border: 1px solid #a7f3d0;
            }
            
            .alert-danger {
                background-color: #fee2e2;
                color: #991b1b;
                border: 1px solid #fca5a5;
            }
            
            .alert-dismissible .btn-close {
                position: absolute;
                top: 0.5rem;
                right: 0.5rem;
                background: none;
                border: none;
                font-size: 1.25rem;
                cursor: pointer;
                opacity: 0.5;
            }
            
            .alert-dismissible .btn-close:hover {
                opacity: 1;
            }
            
            .btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 0.5rem 1rem;
                border-radius: 0.375rem;
                font-weight: 500;
                text-decoration: none;
                border: none;
                cursor: pointer;
                transition: all 0.2s;
            }
            
            .btn-primary {
                background-color: #2563eb;
                color: white;
            }
            
            .btn-primary:hover {
                background-color: #1d4ed8;
            }
            
            .btn-secondary {
                background-color: #6b7280;
                color: white;
            }
            
            .btn-secondary:hover {
                background-color: #4b5563;
            }
            
            .btn-sm {
                padding: 0.25rem 0.5rem;
                font-size: 0.875rem;
            }
            
            .btn-outline-primary {
                background-color: white;
                color: #2563eb;
                border: 1px solid #2563eb;
            }
            
            .btn-outline-primary:hover {
                background-color: #2563eb;
                color: white;
            }
            
            .btn-outline-danger {
                background-color: white;
                color: #dc2626;
                border: 1px solid #dc2626;
            }
            
            .btn-outline-danger:hover {
                background-color: #dc2626;
                color: white;
            }
            
            .form-label {
                display: block;
                margin-bottom: 0.5rem;
                font-weight: 500;
                color: #374151;
            }
            
            .form-select, .form-control {
                display: block;
                width: 100%;
                padding: 0.5rem 0.75rem;
                border: 1px solid #d1d5db;
                border-radius: 0.375rem;
                background-color: white;
                font-size: 1rem;
            }
            
            .form-select:focus, .form-control:focus {
                outline: none;
                border-color: #2563eb;
                box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
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

            <!-- Main Content -->
            <main class="flex-1 p-6">
                <!-- Header Section -->
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-3xl font-semibold">Booking Management</h2>
                    <button class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg flex items-center">
                        <i class="fas fa-download mr-2"></i>
                        Export Data
                    </button>
                </div>

                <!-- Alert Messages -->
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="alert alert-success alert-dismissible mb-4" role="alert">
                        <i class="fas fa-check-circle mr-2"></i>
                        ${sessionScope.successMessage}
                        <button type="button" class="btn-close" onclick="this.parentElement.style.display='none'">&times;</button>
                    </div>
                    <c:remove var="successMessage" scope="session" />
                </c:if>

                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible mb-4" role="alert">
                        <i class="fas fa-exclamation-triangle mr-2"></i>
                        ${errorMessage}
                        <button type="button" class="btn-close" onclick="this.parentElement.style.display='none'">&times;</button>
                    </div>
                </c:if>

                <!-- Filter Section -->
                <div class="bg-white shadow rounded-lg mb-6 p-4">
                    <form method="GET" action="${pageContext.request.contextPath}/admin/bookings" class="grid grid-cols-1 md:grid-cols-5 gap-4">
                        <div>
                            <label for="statusFilter" class="form-label">Status</label>
                            <select id="statusFilter" name="status" class="form-select">
                                <option value="">All Status</option>
                                <option value="Pending" ${currentStatus eq 'Pending' ? 'selected' : ''}>Pending</option>
                                <option value="Confirmed" ${currentStatus eq 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                                <option value="Checked-in" ${currentStatus eq 'Checked-in' ? 'selected' : ''}>Checked-in</option>
                                <option value="Checked-out" ${currentStatus eq 'Checked-out' ? 'selected' : ''}>Checked-out</option>
                                <option value="Cancelled" ${currentStatus eq 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                            </select>
                        </div>
                        <div>
                            <label for="roomTypeFilter" class="form-label">Room Type</label>
                            <select id="roomTypeFilter" name="roomType" class="form-select">
                                <option value="">All Room Types</option>
                                <c:forEach items="${roomTypeList}" var="rt">
                                    <option value="${rt.roomTypeId}" ${currentRoomType eq rt.roomTypeId ? 'selected' : ''}>
                                        ${rt.roomTypeName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="md:col-span-2">
                            <label for="searchFilter" class="form-label">Search</label>
                            <input type="text" id="searchFilter" name="search" class="form-control" 
                                   placeholder="Customer name, room number..." value="${currentSearch}">
                        </div>
                        <div class="flex items-end gap-2">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-search mr-2"></i>
                                Search
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/bookings" class="btn btn-secondary">
                                <i class="fas fa-times mr-2"></i>
                                Reset
                            </a>
                        </div>
                    </form>
                </div>

                <!-- Statistics Cards -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                    <div class="bg-white rounded-lg shadow p-4">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-gray-600 text-sm mb-1">Total Bookings</p>
                                <h3 class="text-2xl font-bold">${bookingList.size()}</h3>
                            </div>
                            <div class="text-blue-600">
                                <i class="fas fa-calendar-alt text-2xl"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-4">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-gray-600 text-sm mb-1">Active Bookings</p>
                                <h3 class="text-2xl font-bold text-green-600">
                                    <c:set var="activeCount" value="0" />
                                    <c:forEach items="${bookingList}" var="b">
                                        <c:if test="${b.status eq 'Confirmed' or b.status eq 'Checked-in'}">
                                            <c:set var="activeCount" value="${activeCount + 1}" />
                                        </c:if>
                                    </c:forEach>
                                    ${activeCount}
                                </h3>
                            </div>
                            <div class="text-green-600">
                                <i class="fas fa-check-circle text-2xl"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-4">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-gray-600 text-sm mb-1">Pending</p>
                                <h3 class="text-2xl font-bold text-yellow-600">
                                    <c:set var="pendingCount" value="0" />
                                    <c:forEach items="${bookingList}" var="b">
                                        <c:if test="${b.status eq 'Pending'}">
                                            <c:set var="pendingCount" value="${pendingCount + 1}" />
                                        </c:if>
                                    </c:forEach>
                                    ${pendingCount}
                                </h3>
                            </div>
                            <div class="text-yellow-600">
                                <i class="fas fa-clock text-2xl"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-4">
                        <div class="flex justify-between items-center">
                            <div>
                                <p class="text-gray-600 text-sm mb-1">Cancelled</p>
                                <h3 class="text-2xl font-bold text-red-600">
                                    <c:set var="cancelledCount" value="0" />
                                    <c:forEach items="${bookingList}" var="b">
                                        <c:if test="${b.status eq 'Cancelled'}">
                                            <c:set var="cancelledCount" value="${cancelledCount + 1}" />
                                        </c:if>
                                    </c:forEach>
                                    ${cancelledCount}
                                </h3>
                            </div>
                            <div class="text-red-600">
                                <i class="fas fa-times-circle text-2xl"></i>
                            </div>
                        </div>
                    </div>
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
                                <th class="px-6 py-3">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty bookingList}">
                                    <c:forEach items="${bookingList}" var="b">
                                        <tr class="border-b hover:bg-gray-50">
                                            <td class="px-6 py-4">${b.bookingId}</td>
                                            <td class="px-6 py-4 font-medium">${b.customerName}</td>
                                            <td class="px-6 py-4">
                                                <c:forEach items="${roomTypeList}" var="rt">
                                                    <c:if test="${rt.roomTypeId == b.roomTypeId}">
                                                        <span class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded-full">
                                                            ${rt.roomTypeName}
                                                        </span>
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td class="px-6 py-4">${b.roomNumber}</td>
                                            <td class="px-6 py-4">
                                                <fmt:formatDate value="${b.checkinDate}" pattern="dd-MM-yyyy" />
                                            </td>
                                            <td class="px-6 py-4">
                                                <fmt:formatDate value="${b.checkoutDate}" pattern="dd-MM-yyyy" />
                                            </td>
                                            <td class="px-6 py-4 font-medium">
                                                <span class="price" data-price="${b.totalPrice}"></span>
                                            </td>
                                            <td class="px-6 py-4">
                                                <c:choose>
                                                    <c:when test="${b.status eq 'Pending'}">
                                                        <span class="bg-yellow-100 text-yellow-800 text-xs px-2 py-1 rounded-full">
                                                            ${b.status}
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${b.status eq 'Confirmed'}">
                                                        <span class="bg-green-100 text-green-800 text-xs px-2 py-1 rounded-full">
                                                            ${b.status}
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${b.status eq 'Checked-in'}">
                                                        <span class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded-full">
                                                            ${b.status}
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${b.status eq 'Checked-out'}">
                                                        <span class="bg-gray-100 text-gray-800 text-xs px-2 py-1 rounded-full">
                                                            ${b.status}
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${b.status eq 'Cancelled'}">
                                                        <span class="bg-red-100 text-red-800 text-xs px-2 py-1 rounded-full">
                                                            ${b.status}
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="bg-gray-100 text-gray-800 text-xs px-2 py-1 rounded-full">
                                                            ${b.status}
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="px-6 py-4">
                                                <fmt:formatDate value="${b.bookingDate}" pattern="dd-MM-yyyy" />
                                            </td>
                                            <td class="px-6 py-4">
                                                <div class="flex space-x-2">
                                                    <!-- Status Update Dropdown -->
                                                    <div class="dropdown">
                                                        <button class="dropdown-toggle btn btn-sm btn-outline-primary" type="button" onclick="toggleDropdown(this)">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item" href="javascript:void(0)" onclick="updateStatus(${b.bookingId}, 'Pending')">Pending</a>
                                                            <a class="dropdown-item" href="javascript:void(0)" onclick="updateStatus(${b.bookingId}, 'Confirmed')">Confirmed</a>
                                                            <a class="dropdown-item" href="javascript:void(0)" onclick="updateStatus(${b.bookingId}, 'Checked-in')">Checked-in</a>
                                                            <a class="dropdown-item" href="javascript:void(0)" onclick="updateStatus(${b.bookingId}, 'Checked-out')">Checked-out</a>
                                                            <a class="dropdown-item" href="javascript:void(0)" onclick="updateStatus(${b.bookingId}, 'Cancelled')">Cancelled</a>
                                                        </div>
                                                    </div>
                                                    <!-- Delete Button -->
                                                    <button class="btn btn-sm btn-outline-danger" onclick="deleteBooking(${b.bookingId})">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="10" class="px-6 py-8 text-center text-gray-500">
                                            <i class="fas fa-inbox fa-3x mb-3"></i>
                                            <p>No bookings found</p>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>

        <!-- Hidden Forms for Actions -->
        <form id="statusForm" method="POST" action="${pageContext.request.contextPath}/admin/bookings" style="display:none;">
            <input type="hidden" name="action" value="updateStatus">
            <input type="hidden" name="bookingId" id="statusBookingId">
            <input type="hidden" name="newStatus" id="newStatus">
        </form>

        <form id="deleteForm" method="POST" action="${pageContext.request.contextPath}/admin/bookings" style="display:none;">
            <input type="hidden" name="action" value="deleteBooking">
            <input type="hidden" name="bookingId" id="deleteBookingId">
        </form>
    </body>

    <script>
        $(document).ready(function () {
            const table = $('#booking-tbl').DataTable({
                autoWidth: false,
                order: [[ 0, 'desc' ]],
                pageLength: 25,
                responsive: true,
                columnDefs: [
                    { targets: -1, orderable: false } // Disable sorting for Actions column
                ]
            });

            // Format prices function
            function formatPrices() {
                document.querySelectorAll('.price').forEach(el => {
                    const price = Number(el.dataset.price);
                    el.textContent = price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                });
            }

            // Call when table redraws
            table.on('draw', function () {
                formatPrices();
            });

            // Call on page load
            formatPrices();
        });

        // Update booking status
        function updateStatus(bookingId, newStatus) {
            if (confirm('Are you sure you want to update this booking status?')) {
                document.getElementById('statusBookingId').value = bookingId;
                document.getElementById('newStatus').value = newStatus;
                document.getElementById('statusForm').submit();
            }
        }

        // Delete booking
        function deleteBooking(bookingId) {
            if (confirm('Are you sure you want to delete this booking? This action cannot be undone.')) {
                document.getElementById('deleteBookingId').value = bookingId;
                document.getElementById('deleteForm').submit();
            }
        }

        // Toggle dropdown menu
        function toggleDropdown(button) {
            const dropdown = button.nextElementSibling;
            const isVisible = dropdown.classList.contains('show');
            
            // Close all dropdowns
            document.querySelectorAll('.dropdown-menu').forEach(menu => {
                menu.classList.remove('show');
            });
            
            // Toggle current dropdown
            if (!isVisible) {
                dropdown.classList.add('show');
            }
        }

        // Close dropdown when clicking outside
        document.addEventListener('click', function(event) {
            if (!event.target.matches('.dropdown-toggle') && !event.target.closest('.dropdown-toggle')) {
                document.querySelectorAll('.dropdown-menu').forEach(menu => {
                    menu.classList.remove('show');
                });
            }
        });
    </script>
</html>