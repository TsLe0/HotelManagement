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
       href="dash-board">
        <i class="fas fa-tachometer-alt"></i>
        <span>Dashboard</span>
    </a>

    <a class="flex items-center space-x-3 px-3 py-2 rounded-md <%= currentPage.contains("roomTypeManagement") ? "bg-blue-100 text-blue-700" : "hover:bg-gray-100" %>"
       href="admin-room-type">
        <i class="fas fa-bed"></i>
        <span>Hạng phòng</span>
    </a>

       <a class="flex items-center space-x-3 px-3 py-2 rounded-md <%= currentPage.contains("roomManagement") ? "bg-blue-100 text-blue-700" : "hover:bg-gray-100" %>"
       href="adminroom">
        <i class="fas fa-door-open"></i>
        <span>Danh sách phòng</span>
    </a>

       <a class="flex items-center space-x-3 px-3 py-2 rounded-md <%= currentPage.contains("bookingManagement") ? "bg-blue-100 text-blue-700" : "hover:bg-gray-100" %>"
       href="admin-booking">
        <i class="fas fa-calendar-check"></i>
        <span>Danh sách đặt phòng</span>
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
