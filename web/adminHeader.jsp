<%-- 
    Document   : header
    Created on : Jun 7, 2025, 10:21:14 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<header class="bg-white shadow-md sticky top-0 z-30">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex items-center justify-between h-16">
        <div class="flex items-center space-x-3">
            <img alt="Hotel logo with letter H in white on blue background" class="h-10 w-10 rounded-md" height="40" src="https://storage.googleapis.com/a1aa/image/e9b7da70-5fa0-461a-8dcf-a877cf2a5f0a.jpg" width="40"/>
            <h1 class="text-2xl font-semibold text-gray-800">
                Hotel Manager
            </h1>
        </div>

        <div class="flex items-center space-x-4">

            <div class="relative group">
                <button aria-label="User menu" class="flex items-center space-x-2 focus:outline-none">
                    <img alt="User avatar with initials JD on gray background" class="h-10 w-10 rounded-full object-cover" height="40" src="https://storage.googleapis.com/a1aa/image/103bc7f7-8a3d-45a6-fbea-9cbb6f889ed8.jpg" width="40"/>
                    <span class="hidden sm:block font-medium text-gray-700">
                        John Doe
                    </span>
                    <i class="fas fa-chevron-down text-gray-500">
                    </i>
                </button>
                <div class="absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-2 opacity-0 group-hover:opacity-100 invisible group-hover:visible transition-opacity">
                    <a class="block px-4 py-2 text-gray-700 hover:bg-gray-100" href="#">
                        Profile
                    </a>
                    <a class="block px-4 py-2 text-gray-700 hover:bg-gray-100" href="#">
                        Settings
                    </a>
                    <a class="block px-4 py-2 text-gray-700 hover:bg-gray-100" href="#">
                        Logout
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>