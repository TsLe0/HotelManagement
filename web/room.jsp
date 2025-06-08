
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1" name="viewport"/>
        <title>
            Room Booking
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    </head>
    <body class="bg-white p-6">
        <div class="bg-yellow-400 rounded-md p-4 mb-8 flex flex-col sm:flex-row sm:items-center sm:space-x-6">
            <div class="flex flex-col mb-4 sm:mb-0">
                <label class="text-[10px] font-normal mb-1" for="roomType">
                    Room Type
                </label>
                <select class="w-24 text-[12px] font-normal rounded border border-gray-300 px-2 py-1" id="roomType">
                    <option>
                        All
                    </option>
                </select>
            </div>
            <div class="flex flex-col mb-4 sm:mb-0 flex-grow max-w-xs">
                <label class="text-[10px] font-normal mb-1" for="search">
                    Search
                </label>
                <input class="text-[12px] font-normal rounded border border-gray-300 px-2 py-1" id="search" placeholder="Search..." type="text"/>
            </div>
            <button class="bg-teal-700 hover:bg-teal-800 text-white font-semibold text-[14px] rounded-md px-6 py-2 self-start sm:self-auto" type="button">
                Search
            </button>
        </div>
        <div class="flex flex-wrap gap-6">
            <div class="w-40">
                <img alt="Deluxe Suite room with modern furniture and large window" class="rounded-md mb-2" height="120" src="https://storage.googleapis.com/a1aa/image/90b3873c-e017-4753-ddd1-a0b38137e6c7.jpg" width="160"/>
                <div class="flex justify-between items-center mb-1">
                    <h3 class="font-bold text-[14px] leading-tight">
                        Deluxe Suite
                    </h3>
                    <span class="font-bold text-[14px]">
                        $ 100
                    </span>
                </div>
                <p class="text-[10px] font-light mb-1">
                    suite Room
                </p>
                <p class="text-[10px] font-normal leading-tight mb-3">
                    spacious and luxurious suite with stunning views. Enjoy the comfort and elegance of this beautiful...
                </p>
                <button class="bg-teal-700 hover:bg-teal-800 text-white font-semibold text-[12px] rounded-md w-full py-2" type="button">
                    BOOKED
                </button>
            </div>
            <div class="w-40">
                <img alt="Family Suite room with bed and framed art on wall" class="rounded-md mb-2" height="120" src="https://storage.googleapis.com/a1aa/image/ef32114b-df87-422e-d673-bd5586a03f10.jpg" width="160"/>
                <div class="flex justify-between items-center mb-1">
                    <h3 class="font-bold text-[14px] leading-tight">
                        Family Suite
                    </h3>
                    <span class="font-bold text-[14px]">
                        $ 300
                    </span>
                </div>
                <p class="text-[10px] font-light mb-1">
                    basic Room
                </p>
                <p class="text-[10px] font-normal leading-tight mb-3">
                    spacious suite suitable for families with children. This comfortable and well-appointed suite offe...
                </p>
                <button class="bg-teal-700 hover:bg-teal-800 text-white font-semibold text-[12px] rounded-md w-full py-2" type="button">
                    BOOKED
                </button>
            </div>
            <div class="w-40">
                <img alt="Test Hotel room with green armchair and side table" class="rounded-md mb-2" height="120" src="https://storage.googleapis.com/a1aa/image/25c571cc-efca-43d8-b9fc-fe3eb8cf4af2.jpg" width="160"/>
                <div class="flex justify-between items-center mb-1">
                    <h3 class="font-bold text-[14px] leading-tight">
                        Test Hotel
                    </h3>
                    <span class="font-bold text-[14px]">
                        $ 1000
                    </span>
                </div>
                <p class="text-[10px] font-light mb-1">
                    luxury Room
                </p>
                <p class="text-[10px] font-normal leading-tight mb-3">
                    spacious executive room with a view of the city skyline. Enjoy the comforts of modern luxury in th...
                </p>
                <button class="bg-teal-700 hover:bg-teal-800 text-white font-semibold text-[12px] rounded-md w-full py-2" type="button">
                    BOOKED
                </button>
            </div>
            <div class="w-40">
                <img alt="Executive Room with round mirror and plants" class="rounded-md mb-2" height="120" src="https://storage.googleapis.com/a1aa/image/7b299403-f8a2-4ce6-8696-498a76a7236d.jpg" width="160"/>
                <div class="flex justify-between items-center mb-1">
                    <h3 class="font-bold text-[14px] leading-tight">
                        Executive Room
                    </h3>
                    <span class="font-bold text-[14px]">
                        $ 200
                    </span>
                </div>
                <p class="text-[10px] font-light mb-1">
                    luxury Room
                </p>
                <p class="text-[10px] font-normal leading-tight mb-3">
                    spacious executive room with a view of the city skyline. Enjoy the comforts of modern luxury in th...
                </p>
                <button class="bg-teal-700 hover:bg-teal-800 text-white font-semibold text-[12px] rounded-md w-full py-2" type="button">
                    BOOKED
                </button>
            </div>
            <div class="w-40">
                <img alt="Luxury Villa room with sofa and plants" class="rounded-md mb-2" height="120" src="https://storage.googleapis.com/a1aa/image/679dafb5-f92d-473a-3cf8-aa52810ba955.jpg" width="160"/>
                <div class="flex justify-between items-center mb-1">
                    <h3 class="font-bold text-[14px] leading-tight">
                        Luxury Villa
                    </h3>
                    <span class="font-bold text-[14px]">
                        $ 500
                    </span>
                </div>
                <p class="text-[10px] font-light mb-1">
                    basic Room
                </p>
                <p class="text-[10px] font-normal leading-tight mb-3">
                    n exquisite villa with a private pool and garden. Indulge in the ultimate luxury and tranquility wi...
                </p>
                <button class="bg-teal-700 hover:bg-teal-800 text-white font-semibold text-[12px] rounded-md w-full py-2" type="button">
                    BOOKED
                </button>
            </div>
            <div class="w-40">
                <img alt="Standard Room with bed and window view" class="rounded-md mb-2" height="120" src="https://storage.googleapis.com/a1aa/image/e7f1237f-6db0-4c27-ece4-67bbba972fa9.jpg" width="160"/>
                <div class="flex justify-between items-center mb-1">
                    <h3 class="font-bold text-[14px] leading-tight">
                        Standard Room
                    </h3>
                    <span class="font-bold text-[14px]">
                        $ 121
                    </span>
                </div>
                <p class="text-[10px] font-light mb-1">
                    basic Room
                </p>
                <p class="text-[10px] font-normal leading-tight mb-3">
                    comfortable and affordable standard room. Experience a pleasant stay in this cozy room, designed f...
                </p>
                <button class="bg-teal-700 hover:bg-teal-800 text-white font-semibold text-[12px] rounded-md w-full py-2" type="button">
                    BOOKED
                </button>
            </div>
        </div>
    </body>
</html>
