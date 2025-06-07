<%-- 
    Document   : roomdetails
    Created on : Jun 7, 2025, 9:23:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <title>
      Family Suite
    </title>
    <script src="https://cdn.tailwindcss.com">
    </script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  </head>
  <body class="bg-white font-sans text-gray-900">
    <div class="max-w-7xl mx-auto p-4 md:p-8">
      <div class="flex flex-col md:flex-row md:space-x-8">
        <div class="md:flex-1 space-y-4">
          <div class="flex space-x-4">
            <img alt="Bright living room with sofa, armchair, floor lamp, and wall art in sunlight" class="rounded-lg w-full md:w-2/3 object-cover" height="300" src="https://storage.googleapis.com/a1aa/image/e552df11-c9d6-4c44-df15-136e2e0b3cec.jpg" width="600"/>
            <div class="hidden md:flex flex-col space-y-4 w-1/3">
              <img alt="Cozy corner with pink armchair, lamp, plants, and framed artwork" class="rounded-lg object-cover" height="140" src="https://storage.googleapis.com/a1aa/image/002a6b43-f2e0-4889-fe5f-b679f897d0c5.jpg" width="200"/>
              <img alt="Modern living room with gray sofa, armchair, plants, and large window" class="rounded-lg object-cover" height="140" src="https://storage.googleapis.com/a1aa/image/f040643c-605e-467c-67df-4cb3804d79fc.jpg" width="200"/>
            </div>
          </div>
          <h3 class="font-bold text-sm mt-6">
            Family Suite (800 sq ft)
          </h3>
          <div class="flex space-x-4 mt-4">
            <div class="flex flex-col items-center justify-center bg-gray-200 rounded p-4 w-28">
              <i class="fas fa-bed text-xl mb-2">
              </i>
              <span class="text-xs text-center">
                Double beds
              </span>
            </div>
            <div class="flex flex-col items-center justify-center bg-gray-200 rounded p-4 w-28">
              <i class="fas fa-child text-xl mb-2">
              </i>
              <span class="text-xs text-center">
                Children's play area
              </span>
            </div>
            <div class="flex flex-col items-center justify-center bg-gray-200 rounded p-4 w-28">
              <i class="fas fa-wifi text-xl mb-2">
              </i>
              <span class="text-xs text-center">
                Free Wi-Fi
              </span>
            </div>
          </div>
          <div class="mt-8 max-w-3xl">
            <h4 class="font-bold text-base mb-2">
              Description
            </h4>
            <p class="text-xs text-gray-700 leading-tight">
              A spacious suite suitable for families with children. This comfortable and well-appointed suite offers ample space for families to relax and enjoy their stay. It’s the perfect choice for a memorable family vacation.
            </p>
          </div>
          <div class="mt-8 max-w-3xl">
            <h4 class="font-bold text-base mb-2">
              Offered Amenities
            </h4>
            <div class="flex flex-wrap text-xs text-gray-700">
              <div class="flex items-center mr-8 mb-2">
                <i class="fas fa-bed mr-1">
                </i>
                Double beds
              </div>
              <div class="flex items-center mr-8 mb-2">
                <i class="fas fa-child mr-1">
                </i>
                Children’s play area
              </div>
              <div class="flex items-center mr-8 mb-2">
                <i class="fas fa-wifi mr-1">
                </i>
                Free Wi-Fi
              </div>
            </div>
          </div>
          <div class="mt-8 max-w-3xl">
            <h4 class="font-bold text-base mb-2">
              Safety And Hygiene
            </h4>
            <div class="flex flex-wrap text-xs text-gray-700">
              <div class="flex items-center mr-8 mb-2">
                <i class="fas fa-lock mr-1">
                </i>
                Daily Cleaning
              </div>
              <div class="flex items-center mr-8 mb-2">
                <i class="fas fa-lock mr-1">
                </i>
                Disinfections and Sterilizations
              </div>
              <div class="flex items-center mr-8 mb-2">
                <i class="fas fa-fire-extinguisher mr-1">
                </i>
                Fire Extinguishers
              </div>
              <div class="flex items-center mr-8 mb-2">
                <i class="fas fa-smoking-ban mr-1">
                </i>
                Smoke Detectors
              </div>
            </div>
          </div>
        </div>
        <div class="mt-8 md:mt-0 md:w-80 bg-white rounded-lg shadow p-6">
          <div class="border-b border-yellow-300 pb-2 mb-4">
            <span class="font-bold text-sm">
              $ 300
            </span>
          </div>
          <p class="text-xs text-gray-700 mb-4">
            Check-in time is 12:00 PM, checkout time is 11:59 AM. If you leave behind any items, please contact the receptionist.
          </p>
          <form class="space-y-3 text-xs">
            <div class="flex space-x-4">
              <div class="flex flex-col w-1/2">
                <label class="mb-1" for="checkin">
                  Check In date
                </label>
                <input class="border border-gray-300 rounded px-2 py-1 text-xs" id="checkin" name="checkin" type="date"/>
              </div>
              <div class="flex flex-col w-1/2">
                <label class="mb-1" for="checkout">
                  Check Out date
                </label>
                <input class="border border-gray-300 rounded px-2 py-1 text-xs" id="checkout" name="checkout" type="date"/>
              </div>
            </div>
            <div class="flex space-x-4">
              <div class="flex flex-col w-1/2">
                <label class="mb-1" for="adults">
                  Adults
                </label>
                <input class="border border-gray-300 rounded px-2 py-1 text-xs" id="adults" min="0" name="adults" type="number" value="1"/>
              </div>
              <div class="flex flex-col w-1/2">
                <label class="mb-1" for="children">
                  Children
                </label>
                <input class="border border-gray-300 rounded px-2 py-1 text-xs" id="children" min="0" name="children" type="number" value="0"/>
              </div>
            </div>
            <button class="w-full bg-gray-600 text-white font-semibold rounded py-2 text-xs" type="submit">
              Booked
            </button>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
