<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <title>Hotel Manager - Create Room Type</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter&amp;display=swap" rel="stylesheet"/>
    </head>
    <body class="bg-white text-gray-900">
        <div class="flex flex-col ">
            <!-- Header -->
            <jsp:include page="adminHeader.jsp" />
            <div class="flex flex-1 overflow-hidden">
                <!-- Sidebar -->
                <aside class="hidden md:flex h-screen md:flex-col md:w-64 bg-white border-r border-gray-200 overflow-y-auto">
                    <jsp:include page="adminSidebar.jsp" />
                </aside>
                <!-- Main content -->
                <main class="flex-1 overflow-auto p-6 bg-slate-50">
                    <h2 class="text-2xl font-semibold mb-6 select-none">
                        Tạo hạng phòng
                    </h2>
                    <form class="bg-white rounded-md shadow-sm border border-gray-200 p-6 max-w-lg"
                          action="add-room-type" method="POST" enctype="multipart/form-data">


                        <!-- RoomTypeID -->
                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2" for="roomTypeID">
                                Mã hạng phòng
                            </label>
                            <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                                   id="roomTypeID" name="roomTypeID" placeholder="VD: RT001" required type="text"/>
                        </div>

                        <!-- RoomTypeName -->
                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2" for="roomTypeName">
                                Tên hạng phòng
                            </label>
                            <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                                   id="roomTypeName" name="roomTypeName" placeholder="VD: Deluxe" required type="text"/>
                        </div>

                        <!-- Price -->
                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2" for="roomTypePrice">
                                Giá / đêm (₫)
                            </label>
                            <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                                   id="roomTypePrice" name="roomTypePrice" type="number" min="0" step="1000" required placeholder="VD: 500000"/>
                        </div>

                        <!-- Area -->
                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2" for="roomArea">
                                Diện tích (m²)
                            </label>
                            <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                                   id="roomArea" name="roomArea" type="number" step="0.1" min="0" required placeholder="VD: 35.5"/>
                        </div>

                        <!-- Number of Beds -->
                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2" for="numBeds">
                                Số giường
                            </label>
                            <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                                   id="numBeds" name="numBeds" type="number" min="1" required placeholder="VD: 2"/>
                        </div>

                        <!-- Description -->
                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2" for="roomDec">
                                Mô tả
                            </label>
                            <textarea class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                                      id="roomDec" name="roomDec" rows="3" placeholder="Mô tả hạng phòng..."></textarea>
                        </div>

                        <!-- Status -->
                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2" for="roomTypeStatus">
                                Trạng thái
                            </label>
                            <select class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                                    id="roomTypeStatus" name="roomTypeStatus" required>
                                <option value="Đang kinh doanh">Đang kinh doanh</option>
                                <option value="Ngừng kinh doanh">Ngừng kinh doanh</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 font-semibold mb-2" for="roomImages">
                                Ảnh phòng (có thể chọn nhiều ảnh)
                            </label>
                            <input class="w-full border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-sky-500"
                                   id="roomImages" name="roomImages" type="file" accept="image/*" multiple />
                        </div>

                        <div id="imagePreview" class="grid grid-cols-2 md:grid-cols-4 gap-4 mt-4"></div>

                        <!-- Error message -->
                        <c:if test="${not empty error}">
                            <div class="mb-4">
                                <p class="text-red-600 font-medium">${error}</p>
                            </div>
                        </c:if>

                        <!-- Buttons -->
                        <div class="flex justify-end space-x-3">
                            <a href='admin-room-type'
                               class="bg-red-600 text-white hover:bg-red-800 font-semibold px-5 py-2 rounded-md">
                                Cancel
                            </a>
                            <button class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold px-5 py-2 rounded-md" type="reset">
                                Reset
                            </button>
                            <button class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-5 py-2 rounded-md" type="submit">
                                Create
                            </button>
                        </div>
                    </form>
                </main>
            </div>
        </div>
    </body>

    <script>
        const input = document.getElementById('roomImages');
        const preview = document.getElementById('imagePreview');

        // Danh sách tạm giữ file (vì input.files không thể chỉnh trực tiếp)
        let selectedFiles = [];

        input.addEventListener('change', function () {
            // Gộp file mới với các file đã chọn trước đó
            selectedFiles = [...selectedFiles, ...Array.from(input.files)];
            renderPreviews();
        });

        function updateInputFiles() {
            const dataTransfer = new DataTransfer();
            selectedFiles.forEach(file => dataTransfer.items.add(file));
            input.files = dataTransfer.files;
        }


        function renderPreviews() {
            preview.innerHTML = '';

            selectedFiles.forEach((file, index) => {
                if (!file.type.startsWith('image/'))
                    return;

                const reader = new FileReader();
                reader.onload = function (e) {
                    const container = document.createElement('div');
                    container.className = 'relative';

                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.className = 'w-full h-40 object-cover rounded-md shadow';

                    // Nút xóa
                    const closeBtn = document.createElement('button');
                    closeBtn.innerHTML = '❌';
                    closeBtn.className = 'absolute top-1 right-1 bg-white rounded-full text-red-500 font-bold text-xs px-1 hover:bg-red-100';
                    closeBtn.addEventListener('click', () => {
                        selectedFiles.splice(index, 1);  // Xóa khỏi danh sách
                        renderPreviews(); // Vẽ lại
                    });

                    container.appendChild(img);
                    container.appendChild(closeBtn);
                    preview.appendChild(container);
                };
                reader.readAsDataURL(file);
            });

            input.value = '';
            updateInputFiles();
        }

    </script>
</html>
