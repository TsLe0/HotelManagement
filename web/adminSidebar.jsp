<%-- 
    Document   : adminSidebar
    Created on : Jun 7, 2025, 10:25:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String currentPage = request.getRequestURI(); // hoặc đặt sẵn attribute như: request.setAttribute("currentPage", "rooms")
%>


<nav class="flex flex-col p-6 space-y-4 text-gray-700 text-sm font-semibold">
    <a class="flex items-center space-x-3 px-3 py-2 rounded-md <%= currentPage.contains("dashboard") ? "bg-blue-100 text-blue-700" : "hover:bg-gray-100" %>"
       href="dashboard.jsp">
        <i class="fas fa-tachometer-alt"></i>
        <span>Dashboard</span>
    </a>

    <a class="flex items-center space-x-3 px-3 py-2 rounded-md <%= currentPage.contains("roomManagement") ? "bg-blue-100 text-blue-700" : "hover:bg-gray-100" %>"
       href="adminroom">
        <i class="fas fa-bed"></i>
        <span>Rooms</span>
    </a>

    <a class="flex items-center space-x-3 px-3 py-2 rounded-md hover:bg-gray-100" href="#">
        <i class="fas fa-users">
        </i>
        <span>
            Guests
        </span>
    </a>
    <a class="flex items-center space-x-3 px-3 py-2 rounded-md hover:bg-gray-100" href="#">
        <i class="fas fa-calendar-check">
        </i>
        <span>
            Bookings
        </span>
    </a>
    <a class="flex items-center space-x-3 px-3 py-2 rounded-md hover:bg-gray-100" href="#">
        <i class="fas fa-file-invoice-dollar">
        </i>
        <span>
            Billing
        </span>
    </a>
    <a class="flex items-center space-x-3 px-3 py-2 rounded-md hover:bg-gray-100" href="#">
        <i class="fas fa-chart-line">
        </i>
        <span>
            Reports
        </span>
    </a>
    <a class="flex items-center space-x-3 px-3 py-2 rounded-md hover:bg-gray-100" href="#">
        <i class="fas fa-cogs">
        </i>
        <span>
            Settings
        </span>
    </a>
</nav>
