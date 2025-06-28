<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header class="bg-white shadow-md sticky top-0 z-50">
    <div class="max-w-7xl mx-auto flex items-center justify-between px-6 py-4">
        <a class="flex items-center space-x-3" href="#">
            <img alt="Logo khách sạn Mường Thanh màu xanh dương và trắng" class="h-10 w-auto object-contain" height="40" src="https://storage.googleapis.com/a1aa/image/70f89fa0-b8c9-42e9-d653-8f2a8d28c384.jpg" width="80"/>
            <span class="text-2xl font-bold text-blue-700">
                Mường Thanh
            </span>
        </a>
        <nav class="hidden md:flex space-x-8 font-semibold text-gray-700 items-center">
            <a class="hover:text-blue-600 transition" href="#booking">
                Đặt Phòng
            </a>
            <a class="hover:text-blue-600 transition" href="#hotels">
                Khách Sạn
            </a>
            <a class="hover:text-blue-600 transition" href="#promotion">
                Khuyến Mãi
            </a>
            <a class="hover:text-blue-600 transition" href="#contact">
                Liên Hệ
            </a>
            <a href="login" aria-label="Đăng nhập" class="ml-6 bg-blue-700 text-white px-4 py-2 rounded-md font-semibold hover:bg-blue-800 transition" id="login-btn" type="button">
                <i class="fas fa-user mr-2">
                </i>
                Đăng Nhập
            </a>
        </nav>
        <button aria-label="Mở menu" class="md:hidden text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-600" id="menu-btn">
            <i class="fas fa-bars fa-lg">
            </i>
        </button>
    </div>
    <nav aria-label="Menu di động" class="hidden md:hidden bg-white border-t border-gray-200" id="mobile-menu">
        <a class="block px-6 py-3 border-b border-gray-200 hover:bg-blue-50 transition" href="#booking">
            Đặt Phòng
        </a>
        <a class="block px-6 py-3 border-b border-gray-200 hover:bg-blue-50 transition" href="#hotels">
            Khách Sạn
        </a>
        <a class="block px-6 py-3 border-b border-gray-200 hover:bg-blue-50 transition" href="#promotion">
            Khuyến Mãi
        </a>
        <a class="block px-6 py-3 border-b border-gray-200 hover:bg-blue-50 transition" href="#contact">
            Liên Hệ
        </a>
        <a href="login" aria-label="Đăng nhập" class="w-full text-left px-6 py-3 bg-blue-700 text-white font-semibold hover:bg-blue-800 transition" id="login-btn-mobile" type="button">
            <i class="fas fa-user mr-2">
            </i>
            Đăng Nhập
        </a>
    </nav>
</header>