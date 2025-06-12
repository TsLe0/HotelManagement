<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <title>
            Hotel Management Dashboard
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&amp;display=swap" rel="stylesheet"/>
    </head>
    <body class="bg-gray-100 min-h-screen flex flex-col">
      <jsp:include page="adminHeader.jsp" />

        <div class="flex flex-1 overflow-hidden">
            <aside class="hidden md:flex md:flex-col md:w-64 bg-white border-r border-gray-200 overflow-y-auto">
                 <jsp:include page="adminSidebar.jsp" />
            </aside>
            <main class="flex-1 overflow-y-auto p-6">
                <h2 class="text-3xl font-semibold text-gray-800 mb-6">
                    Dashboard Overview
                </h2>
                <section class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                    <div class="bg-white rounded-lg shadow p-5 flex items-center space-x-4">
                        <div class="p-3 bg-blue-100 text-blue-600 rounded-full">
                            <i class="fas fa-bed fa-2x">
                            </i>
                        </div>
                        <div>
                            <p class="text-gray-500 font-semibold">
                                Total Rooms
                            </p>
                            <p class="text-2xl font-bold text-gray-800">
                                120
                            </p>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-5 flex items-center space-x-4">
                        <div class="p-3 bg-green-100 text-green-600 rounded-full">
                            <i class="fas fa-users fa-2x">
                            </i>
                        </div>
                        <div>
                            <p class="text-gray-500 font-semibold">
                                Current Guests
                            </p>
                            <p class="text-2xl font-bold text-gray-800">
                                85
                            </p>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-5 flex items-center space-x-4">
                        <div class="p-3 bg-yellow-100 text-yellow-600 rounded-full">
                            <i class="fas fa-calendar-check fa-2x">
                            </i>
                        </div>
                        <div>
                            <p class="text-gray-500 font-semibold">
                                Bookings Today
                            </p>
                            <p class="text-2xl font-bold text-gray-800">
                                34
                            </p>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-5 flex items-center space-x-4">
                        <div class="p-3 bg-red-100 text-red-600 rounded-full">
                            <i class="fas fa-file-invoice-dollar fa-2x">
                            </i>
                        </div>
                        <div>
                            <p class="text-gray-500 font-semibold">
                                Revenue (This Month)
                            </p>
                            <p class="text-2xl font-bold text-gray-800">
                                $45,230
                            </p>
                        </div>
                    </div>
                </section>
                <section class="mb-10">
                    <h3 class="text-xl font-semibold text-gray-800 mb-4">
                        Recent Bookings
                    </h3>
                    <div class="overflow-x-auto bg-white rounded-lg shadow">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" scope="col">
                                        Booking ID
                                    </th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" scope="col">
                                        Guest Name
                                    </th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" scope="col">
                                        Room
                                    </th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" scope="col">
                                        Check-in
                                    </th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" scope="col">
                                        Check-out
                                    </th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" scope="col">
                                        Status
                                    </th>
                                    <th class="relative px-6 py-3" scope="col">
                                        <span class="sr-only">
                                            Actions
                                        </span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 font-mono">
                                        BKG-00123
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        Alice Johnson
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        Deluxe Suite 101
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        2024-06-10
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        2024-06-15
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                            Confirmed
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                        <a class="text-blue-600 hover:text-blue-900 mr-3" href="#">
                                            View
                                        </a>
                                        <a class="text-red-600 hover:text-red-900" href="#">
                                            Cancel
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 font-mono">
                                        BKG-00124
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        Michael Smith
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        Standard Room 205
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        2024-06-12
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        2024-06-14
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                            Pending
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                        <a class="text-blue-600 hover:text-blue-900 mr-3" href="#">
                                            View
                                        </a>
                                        <a class="text-red-600 hover:text-red-900" href="#">
                                            Cancel
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 font-mono">
                                        BKG-00125
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        Sofia Martinez
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        Executive Suite 303
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        2024-06-11
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        2024-06-16
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">
                                            Cancelled
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                        <a class="text-blue-600 hover:text-blue-900 mr-3" href="#">
                                            View
                                        </a>
                                        <a class="text-red-600 hover:text-red-900" href="#">
                                            Cancel
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 font-mono">
                                        BKG-00126
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        David Lee
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        Standard Room 207
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        2024-06-13
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        2024-06-18
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                            Confirmed
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                        <a class="text-blue-600 hover:text-blue-900 mr-3" href="#">
                                            View
                                        </a>
                                        <a class="text-red-600 hover:text-red-900" href="#">
                                            Cancel
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 font-mono">
                                        BKG-00127
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        Emma Wilson
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        Deluxe Suite 102
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        2024-06-14
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                        2024-06-20
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                            Pending
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                        <a class="text-blue-600 hover:text-blue-900 mr-3" href="#">
                                            View
                                        </a>
                                        <a class="text-red-600 hover:text-red-900" href="#">
                                            Cancel
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
                <section class="mb-10">
                    <h3 class="text-xl font-semibold text-gray-800 mb-4">
                        Room Status
                    </h3>
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                        <div class="bg-white rounded-lg shadow p-5 flex flex-col items-center">
                            <img alt="Photo of Deluxe Suite 101 hotel room with modern decor and king size bed" class="rounded-md mb-3 object-cover w-full h-24" height="100" src="https://storage.googleapis.com/a1aa/image/01dcb39e-8f5a-4f34-2a42-cb4bf8566e80.jpg" width="150"/>
                            <h4 class="font-semibold text-gray-800 mb-1">
                                Deluxe Suite 101
                            </h4>
                            <span class="px-3 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                Available
                            </span>
                        </div>
                        <div class="bg-white rounded-lg shadow p-5 flex flex-col items-center">
                            <img alt="Photo of Standard Room 205 hotel room with two twin beds and bright interior" class="rounded-md mb-3 object-cover w-full h-24" height="100" src="https://storage.googleapis.com/a1aa/image/b0762f00-cf89-4343-6816-346eeab11c0e.jpg" width="150"/>
                            <h4 class="font-semibold text-gray-800 mb-1">
                                Standard Room 205
                            </h4>
                            <span class="px-3 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                Occupied
                            </span>
                        </div>
                        <div class="bg-white rounded-lg shadow p-5 flex flex-col items-center">
                            <img alt="Photo of Executive Suite 303 hotel room with elegant furniture and city view" class="rounded-md mb-3 object-cover w-full h-24" height="100" src="https://storage.googleapis.com/a1aa/image/02ac5e99-b57f-4eb6-5b8d-de60ea28b8ad.jpg" width="150"/>
                            <h4 class="font-semibold text-gray-800 mb-1">
                                Executive Suite 303
                            </h4>
                            <span class="px-3 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">
                                Maintenance
                            </span>
                        </div>
                        <div class="bg-white rounded-lg shadow p-5 flex flex-col items-center">
                            <img alt="Photo of Standard Room 207 hotel room with queen bed and modern lighting" class="rounded-md mb-3 object-cover w-full h-24" height="100" src="https://storage.googleapis.com/a1aa/image/d8c2cfc5-b857-4e93-b954-2fd31effe336.jpg" width="150"/>
                            <h4 class="font-semibold text-gray-800 mb-1">
                                Standard Room 207
                            </h4>
                            <span class="px-3 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                Available
                            </span>
                        </div>
                        <div class="bg-white rounded-lg shadow p-5 flex flex-col items-center">
                            <img alt="Photo of Deluxe Suite 102 hotel room with king size bed and warm lighting" class="rounded-md mb-3 object-cover w-full h-24" height="100" src="https://storage.googleapis.com/a1aa/image/92865bf2-818c-4cb5-3802-01721c09db9c.jpg" width="150"/>
                            <h4 class="font-semibold text-gray-800 mb-1">
                                Deluxe Suite 102
                            </h4>
                            <span class="px-3 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                Occupied
                            </span>
                        </div>
                        <div class="bg-white rounded-lg shadow p-5 flex flex-col items-center">
                            <img alt="Photo of Presidential Suite 401 hotel room with luxurious decor and large windows" class="rounded-md mb-3 object-cover w-full h-24" height="100" src="https://storage.googleapis.com/a1aa/image/21a9ac18-d4b2-4153-9b37-f77ea1369d24.jpg" width="150"/>
                            <h4 class="font-semibold text-gray-800 mb-1">
                                Presidential Suite 401
                            </h4>
                            <span class="px-3 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                Available
                            </span>
                        </div>
                        <div class="bg-white rounded-lg shadow p-5 flex flex-col items-center">
                            <img alt="Photo of Standard Room 208 hotel room with two twin beds and neutral colors" class="rounded-md mb-3 object-cover w-full h-24" height="100" src="https://storage.googleapis.com/a1aa/image/b6ad9fbd-23a6-4df9-715a-23207f77bc59.jpg" width="150"/>
                            <h4 class="font-semibold text-gray-800 mb-1">
                                Standard Room 208
                            </h4>
                            <span class="px-3 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                Available
                            </span>
                        </div>
                    </div>
                </section>
                <section>
                    <h3 class="text-xl font-semibold text-gray-800 mb-4">
                        Recent Guests
                    </h3>
                    <div class="bg-white rounded-lg shadow p-6 overflow-x-auto">
                        <ul class="divide-y divide-gray-200">
                            <li class="flex items-center py-4 space-x-4">
                                <img alt="Avatar of guest Alice Johnson with initials AJ on blue background" class="h-12 w-12 rounded-full object-cover" height="48" src="https://storage.googleapis.com/a1aa/image/06873152-af00-436c-282d-d5f47acc9610.jpg" width="48"/>
                                <div class="flex-1 min-w-0">
                                    <p class="text-sm font-medium text-gray-900">
                                        Alice Johnson
                                    </p>
                                    <p class="text-sm text-gray-500 truncate">
                                        Deluxe Suite 101
                                    </p>
                                </div>
                                <div class="text-sm text-gray-500">
                                    Checked in: 2024-06-10
                                </div>
                            </li>
                            <li class="flex items-center py-4 space-x-4">
                                <img alt="Avatar of guest Michael Smith with initials MS on green background" class="h-12 w-12 rounded-full object-cover" height="48" src="https://storage.googleapis.com/a1aa/image/e22fc44c-845b-4db8-7cee-c4c9a7655fbd.jpg" width="48"/>
                                <div class="flex-1 min-w-0">
                                    <p class="text-sm font-medium text-gray-900">
                                        Michael Smith
                                    </p>
                                    <p class="text-sm text-gray-500 truncate">
                                        Standard Room 205
                                    </p>
                                </div>
                                <div class="text-sm text-gray-500">
                                    Checked in: 2024-06-12
                                </div>
                            </li>
                            <li class="flex items-center py-4 space-x-4">
                                <img alt="Avatar of guest Sofia Martinez with initials SM on yellow background" class="h-12 w-12 rounded-full object-cover" height="48" src="https://storage.googleapis.com/a1aa/image/b9bc4bac-3d38-425f-1037-d0a6244fb043.jpg" width="48"/>
                                <div class="flex-1 min-w-0">
                                    <p class="text-sm font-medium text-gray-900">
                                        Sofia Martinez
                                    </p>
                                    <p class="text-sm text-gray-500 truncate">
                                        Executive Suite 303
                                    </p>
                                </div>
                                <div class="text-sm text-gray-500">
                                    Checked in: 2024-06-11
                                </div>
                            </li>
                            <li class="flex items-center py-4 space-x-4">
                                <img alt="Avatar of guest David Lee with initials DL on red background" class="h-12 w-12 rounded-full object-cover" height="48" src="https://storage.googleapis.com/a1aa/image/a8af3a44-04fc-46c0-e4f4-1ee79414a2dd.jpg" width="48"/>
                                <div class="flex-1 min-w-0">
                                    <p class="text-sm font-medium text-gray-900">
                                        David Lee
                                    </p>
                                    <p class="text-sm text-gray-500 truncate">
                                        Standard Room 207
                                    </p>
                                </div>
                                <div class="text-sm text-gray-500">
                                    Checked in: 2024-06-13
                                </div>
                            </li>
                            <li class="flex items-center py-4 space-x-4">
                                <img alt="Avatar of guest Emma Wilson with initials EW on purple background" class="h-12 w-12 rounded-full object-cover" height="48" src="https://storage.googleapis.com/a1aa/image/5c86a28e-5243-4312-8fa2-ac85fa20acd3.jpg" width="48"/>
                                <div class="flex-1 min-w-0">
                                    <p class="text-sm font-medium text-gray-900">
                                        Emma Wilson
                                    </p>
                                    <p class="text-sm text-gray-500 truncate">
                                        Deluxe Suite 102
                                    </p>
                                </div>
                                <div class="text-sm text-gray-500">
                                    Checked in: 2024-06-14
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </main>
        </div>
    </body>
</html>