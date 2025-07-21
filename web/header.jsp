<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header class="bg-white shadow-md sticky top-0 z-50">
    <div class="max-w-7xl mx-auto flex items-center justify-between px-6 py-4">
        <a class="flex items-center space-x-3" href="home.jsp">
            <img alt="Logo khách sạn Mường Thanh màu xanh dương và trắng" class="h-16 w-16 w-auto object-contain"
                 src="https://employer.jobsgo.vn/uploads/media/img/201912/pictures_library_38320_20191224135816_4094.jpg" width="80"/>
            
            <span class="text-xl font-bold text-black-700">
                Mường Thanh Grand
            </span>
            <div class="flex space-x-4 text-base">
    <a aria-label="Facebook" class="hover:text-[#f5a623]" href="#">
      <i class="fab fa-facebook-f" aria-hidden="true"></i>
    </a>
    <a aria-label="Instagram" class="hover:text-[#f5a623]" href="#">
      <i class="fab fa-instagram" aria-hidden="true"></i>
    </a>
    <a aria-label="YouTube" class="hover:text-[#f5a623]" href="#">
      <i class="fab fa-youtube" aria-hidden="true"></i>
    </a>
  </div>
            
            
        </a> 
        <nav class="hidden md:flex space-x-8 font-semibold text-gray-700 items-center">
            <a class="hover:text-blue-600 transition" href="getallrooms">
                Đặt Phòng
            </a>

            <a class="hover:text-blue-600 transition" href="#contact">
                Liên Hệ
            </a>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <div class="flex items-center justify-end space-x-4">
                <c:choose>
                    <c:when test="${not empty sessionScope.account}">
                    <div class="flex items-center space-x-4">
                        <a href="booking-history" class="hover:text-blue-600 transition">Lịch sử đặt phòng</a>
                        <span class="text-gray-700 font-semibold">Xin chào  ${sessionScope.account.username}</span>
                        <a href="logout" class="text-sm text-red-600 hover:underline">Đăng xuất</a>
                    </div>
                </c:when>
                    <c:otherwise>
                        <a href="login" aria-label="Đăng nhập" class="bg-blue-700 text-white px-4 py-2 rounded-md font-semibold hover:bg-blue-800 transition" id="login-btn">
                            <i class="fas fa-user mr-2"></i> Đăng Nhập
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>


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
<!--        <a class="block px-6 py-3 border-b border-gray-200 hover:bg-blue-50 transition" href="#hotels">
            Khách Sạn
        </a>-->
<!--        <a class="block px-6 py-3 border-b border-gray-200 hover:bg-blue-50 transition" href="#promotion">
            Khuyến Mãi
        </a>-->
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