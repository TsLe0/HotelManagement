<%-- 
    Document   : roomadmin
    Created on : Jun 7, 2025, 10:18:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Hotel Manager - Rooms</title>

        <!-- ✅ Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <!-- ✅ Tailwind CSS (optional, if you're using both) -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- ✅ DataTables CSS for Bootstrap 5 -->
        <link rel="stylesheet" href="https://cdn.datatables.net/2.3.2/css/dataTables.bootstrap5.min.css" />

        <!-- ✅ Font Awesome (optional) -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>

        <!-- ✅ Google Fonts (optional) -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>

        <!-- ✅ jQuery (required for DataTables) -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <!-- ✅ Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

        <!-- ✅ DataTables JS core -->
        <script src="https://cdn.datatables.net/2.3.2/js/dataTables.min.js"></script>

        <!-- ✅ DataTables Bootstrap 5 integration -->
        <script src="https://cdn.datatables.net/2.3.2/js/dataTables.bootstrap5.min.js"></script>
    </head>

    <body class="bg-gray-100 text-gray-800">

        <!-- Header -->
        <jsp:include page="header.jsp" />

        <!-- Sidebar + Main Content -->
        <div class="flex">

            <!-- Sidebar -->
            <aside class="hidden md:flex h-screen md:flex-col md:w-64 bg-white border-r border-gray-200 overflow-y-auto">
                <jsp:include page="adminSidebar.jsp" />
            </aside>

            <!-- Main Content -->
            <main class="flex-1 p-6">
                <h2 class="text-3xl font-semibold mb-6">Rooms</h2>

                <!-- Table -->
                <div class="bg-white shadow rounded-lg overflow-x-auto">
                    <table id="room-tbl" class="min-w-full text-sm text-left whitespace-nowrap">
                        <thead class="bg-gray-50 border-b font-medium">
                            <tr>
                                <th class="px-6 py-3">Room Number</th>
                                <th class="px-6 py-3">Type</th>
                                <th class="px-6 py-3">Status</th>
                                <th class="px-6 py-3">Price/Night</th>
                                <th class="px-6 py-3 text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Room 1 -->
                            <tr class="border-b hover:bg-gray-50">
                                <td class="px-6 py-4">400</td>
                                <td class="px-6 py-4">
                                    <span class="bg-green-100 text-green-800 text-xs px-2 py-1 rounded">Available</span>
                                </td>
                                <td class="px-6 py-4">
                                    <span class="bg-green-100 text-green-800 text-xs px-2 py-1 rounded">Available</span>
                                </td>
                                <td class="px-6 py-4">$200</td>
                                <td class="px-6 py-4 text-left">
                                    <button
                                        class="text-white bg-[#007bff] hover:bg-[#0069D9]
                                        rounded-lg py-1.5 px-4 mr-4"
                                        >
                                        Edit
                                    </button>
                                    <button 
                                        class="text-white bg-[#dc3545] hover:bg-[#c82333]
                                        rounded-lg py-1.5 px-4 mr-4"
                                        >
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <!-- Room 2 -->
                            <tr class="border-b hover:bg-gray-50">
                                <td class="px-6 py-4">401</td>
                                <td class="px-6 py-4">
                                    <span class="bg-yellow-100 text-yellow-800 text-xs px-2 py-1 rounded">Occupied</span>
                                </td>
                                <td class="px-6 py-4">
                                    <span class="bg-yellow-100 text-yellow-800 text-xs px-2 py-1 rounded">Occupied</span>
                                </td>
                                <td class="px-6 py-4">$120</td>
                                <td class="px-6 py-4 text-left">
                                    <button
                                        class="text-white bg-[#007bff] hover:bg-[#0069D9]
                                        rounded-lg py-1.5 px-4 mr-4"
                                        >
                                        Edit
                                    </button>
                                    <button 
                                        class="text-white bg-[#dc3545] hover:bg-[#c82333]
                                        rounded-lg py-1.5 px-4 mr-4"
                                        >
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <!-- Room 3 -->
                            <tr class="hover:bg-gray-50">
                                <td class="px-6 py-4">D201</td>
                                <td class="px-6 py-4">
                                    <span class="bg-red-100 text-red-800 text-xs px-2 py-1 rounded">Maintenance</span>
                                </td>
                                <td class="px-6 py-4">
                                    <span class="bg-red-100 text-red-800 text-xs px-2 py-1 rounded">Maintenance</span>
                                </td>
                                <td class="px-6 py-4"><a href="#">300 VND</a></td>
                                <td class="px-6 py-4 text-left">
                                    <button
                                        class="text-white bg-[#007bff] hover:bg-[#0069D9]
                                        rounded-lg py-1.5 px-4 mr-4"
                                        >
                                        Edit
                                    </button>
                                    <button 
                                        class="text-white bg-[#dc3545] hover:bg-[#c82333]
                                        rounded-lg py-1.5 px-4 mr-4"
                                        >
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>

        </div>
    </body>
    <script>
        $('#room-tbl').DataTable({
            autoWidth: false
        });

    </script>
</html>
