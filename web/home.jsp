
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- This is a complete JSP file combining the hotel page and footer sections --%>
<html lang="en">
 <head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1" name="viewport"/>
  <title>
   Hotelzz - Your Exquisite Stay
  </title>
  <script src="https://cdn.tailwindcss.com">
  </script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&amp;display=swap" rel="stylesheet"/>
  <style>
   body {
     font-family: "Inter", sans-serif;
   }
  </style>
 </head>
 <body class="bg-white text-black">
  <header class="max-w-7xl mx-auto flex justify-between items-center px-6 py-4">
   <div class="flex items-center space-x-1 text-[13px] font-bold text-[#f28c00]">
   <span>
     Hotelzz
   </span>
   <i class="fas fa-user-circle text-[14px]">
   </i>
   <i class="fas fa-moon text-[14px]">
   </i>
   </div>
   <nav class="flex space-x-8 text-[14px] font-normal">
   <a class="hover:underline" href="#">
     Home
   </a>
   <a class="hover:underline" href="#">
     Rooms
   </a>
   <a class="hover:underline" href="#">
     Contact
   </a>
   </nav>
  </header>
  <main class="max-w-7xl mx-auto px-6">
   <section class="mt-6 grid grid-cols-1 md:grid-cols-2 gap-x-10 gap-y-6 items-center">
    <div>
     <h1 class="font-extrabold text-3xl leading-tight mb-2">
     Explore Our Exquisite Hotel
     </h1>
     <p class="text-[10px] font-normal mb-6 leading-tight text-[#1a1a1a]">
     Experience an Exquisite Hotel Immersed in Rich History and Timeless
       Elegance.
     </p>
     <button class="bg-[#0b7f7a] text-white font-semibold text-[13px] rounded-md px-6 py-2">
     Get Started
     </button>
     <div class="mt-8 flex justify-between max-w-[400px]">
      <div class="text-[12px] font-normal">
       <div>
       Basic Room
       </div>
       <div class="font-extrabold text-xl -mt-1">
       50
       </div>
      </div>
      <div class="text-[12px] font-normal">
       <div>
       Luxury Room
       </div>
       <div class="font-extrabold text-xl -mt-1">
       120
       </div>
      </div>
      <div class="text-[12px] font-normal">
       <div>
       Suite
       </div>
       <div class="font-extrabold text-xl -mt-1">
       60
       </div>
      </div>
     </div>
    </div>
    <div class="space-y-4">
     <img alt="Hotel exterior building with warm lights at sunset with trees around" class="rounded-lg object-cover w-full h-[120px]" height="120" src="https://storage.googleapis.com/a1aa/image/ea486093-8f30-442c-0df1-116d64fa56d7.jpg" width="400"/>
     <div class="flex space-x-4">
      <img alt="Cozy bedroom with white bed and nightstand with lamp" class="rounded-lg object-cover w-[180px] h-[100px]" height="100" src="https://storage.googleapis.com/a1aa/image/3114563a-178c-4e8a-3d13-ca79954716f8.jpg" width="180"/>
      <img alt="Living room with plants, lamp, and framed art on wall" class="rounded-lg object-cover w-[180px] h-[100px]" height="100" src="https://storage.googleapis.com/a1aa/image/ce56f601-8b90-4d43-633f-86aa4cd29014.jpg" width="180"/>
     </div>
    </div>
   </section>
   <section class="mt-8 bg-[#f0c43e] rounded-md py-4 px-6 flex flex-col md:flex-row md:items-center md:space-x-12 space-y-4 md:space-y-0">
    <div class="flex flex-col space-y-1 text-[10px] font-normal max-w-[120px]">
     <label for="roomType">
     Room Type
     </label>
     <select class="text-[10px] rounded border border-gray-300 px-2 py-1" id="roomType">
     <option>
       All
     </option>
     </select>
    </div>
    <div class="flex flex-col space-y-1 text-[10px] font-normal max-w-[160px]">
     <label for="search">
     Search
     </label>
     <input class="text-[10px] rounded border border-gray-300 px-2 py-1" id="search" placeholder="Search..." type="text"/>
    </div>
    <button class="bg-[#0b7f7a] text-white font-semibold text-[13px] rounded-md px-8 py-2 self-start md:self-auto">
     Search
    </button>
   </section>
   <section class="mt-10 max-w-5xl mx-auto flex flex-col md:flex-row md:items-center md:space-x-12">
    <div class="flex flex-col space-y-4 md:space-y-6 md:w-[180px]">
     <img alt="Spacious suite interior with modern furniture and large window" class="rounded-lg object-cover w-[180px] h-[100px]" height="100" src="https://storage.googleapis.com/a1aa/image/cc47e78f-c983-4294-041c-6c91919a8372.jpg" width="180"/>
     <div class="flex space-x-4">
      <img alt="Suite living room with sofa and window with sunset light" class="rounded-lg object-cover w-[80px] h-[100px]" height="100" src="https://storage.googleapis.com/a1aa/image/c85c9de9-6a05-4a9a-06e8-275828297deb.jpg" width="80"/>
      <img alt="Suite bedroom corner with wooden furniture and plants" class="rounded-lg object-cover w-[80px] h-[100px]" height="100" src="https://storage.googleapis.com/a1aa/image/f792055e-390c-4057-756e-633bbb4f990e.jpg" width="80"/>
     </div>
    </div>
    <div class="flex-1 mt-6 md:mt-0">
     <h2 class="font-extrabold text-2xl mb-3">
     Featured Room
     </h2>
     <p class="text-[10px] font-normal mb-6 leading-tight text-[#1a1a1a]">
     A spacious and luxurious suite with stunning views. Enjoy the comfort
       and elegance of this beautiful suite, complete with modern amenities
       and breathtaking vistas of the city skyline.
     </p>
     <div class="flex space-x-8 mb-6 text-[12px] font-normal">
      <div>
       <div>
       Start From
       </div>
       <div class="font-extrabold text-xl -mt-1">
       $ 100
       </div>
      </div>
      <div>
       <div>
       Discount
       </div>
       <div class="font-extrabold text-xl -mt-1">
       $ 8
       </div>
      </div>
     </div>
     <button class="text-[#f28c00] border border-[#f28c00] rounded-md px-5 py-2 text-[12px] font-semibold">
     More Details
     </button>
    </div>
   </section>
   <section class="mt-10 max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-4">
    <img alt="Hotel exterior building with warm lights at sunset with trees around" class="rounded-lg object-cover w-full h-[100px]" height="100" src="https://storage.googleapis.com/a1aa/image/ea486093-8f30-442c-0df1-116d64fa56d7.jpg" width="300"/>
    <img alt="Cozy bedroom with white bed and nightstand with lamp" class="rounded-lg object-cover w-full h-[100px]" height="100" src="https://storage.googleapis.com/a1aa/image/3114563a-178c-4e8a-3d13-ca79954716f8.jpg" width="150"/>
    <img alt="Hotel exterior building with warm lights at sunset with trees around" class="rounded-lg object-cover w-full h-[100px]" height="100" src="https://storage.googleapis.com/a1aa/image/ea486093-8f30-442c-0df1-116d64fa56d7.jpg" width="300"/>
    <img alt="Cozy bedroom with white bed and nightstand with lamp" class="rounded-lg object-cover w-full h-[100px]" height="100" src="https://storage.googleapis.com/a1aa/image/3114563a-178c-4e8a-3d13-ca79954716f8.jpg" width="150"/>
   </section>
  </main>

  <div class="max-w-6xl mx-auto px-4">
   <div class="flex justify-center space-x-2 mt-6">
    <img alt="Sunset view of a house exterior with trees and purple sky" class="w-[150px] h-[80px] object-cover rounded" height="80" src="https://storage.googleapis.com/a1aa/image/5004df20-c4d4-4561-5759-b48f90937e78.jpg" width="150"/>
    <img alt="Bedroom interior with white bed, blue pillows, and nightstand with lamp" class="w-[100px] h-[80px] object-cover rounded" height="80" src="https://storage.googleapis.com/a1aa/image/864dbae6-b373-4bf7-6840-6fbe72f7b184.jpg" width="100"/>
    <img alt="Wide sunset view of a house exterior with trees and purple sky" class="w-[300px] h-[80px] object-cover rounded" height="80" src="https://storage.googleapis.com/a1aa/image/1f04f2e3-a73f-454c-962c-662205e72541.jpg" width="300"/>
   </div>
   <div class="flex justify-center space-x-2 mt-2">
    <img alt="Living room wall with framed art and lamp on table" class="w-[200px] h-[80px] object-cover rounded" height="80" src="https://storage.googleapis.com/a1aa/image/c578acd3-3fd4-4a5a-ca02-d0b9f7daef0b.jpg" width="200"/>
    <img alt="Bedroom interior with white bed, blue pillows, and nightstand with lamp" class="w-[100px] h-[80px] object-cover rounded" height="80" src="https://storage.googleapis.com/a1aa/image/864dbae6-b373-4bf7-6840-6fbe72f7b184.jpg" width="100"/>
    <img alt="Living room wall with framed art and lamp on table, wide view" class="w-[200px] h-[80px] object-cover rounded" height="80" src="https://storage.googleapis.com/a1aa/image/48827912-4d97-46a2-7a3b-fa4d479269a4.jpg" width="200"/>
   </div>
  </div>

  <div class="max-w-4xl mx-auto mt-10 bg-teal-700 rounded-lg shadow-lg px-6 py-8">
   <p class="text-xs text-teal-200 text-center font-semibold mb-1">
   Explore More About Our Hotel
   </p>
   <h2 class="text-white text-center font-extrabold text-lg mb-4">
   Sign Up for Our Newsletter
   </h2>
   <form class="flex justify-center space-x-3 max-w-md mx-auto">
    <input class="rounded-md bg-teal-900 text-teal-100 placeholder-teal-300 text-xs px-3 py-2 focus:outline-none focus:ring-2 focus:ring-teal-400" placeholder="your email" type="email"/>
    <button class="bg-yellow-400 text-yellow-900 font-semibold text-xs rounded-md px-5 py-2 hover:bg-yellow-300 transition" type="submit">
      Subscribe
    </button>
   </form>
  </div>

  <footer class="max-w-6xl mx-auto mt-12 px-4 pb-10">
   <div class="flex flex-wrap justify-between text-xs text-gray-900">
    <div class="w-full sm:w-auto mb-6 sm:mb-0">
     <p class="text-yellow-600 font-bold mb-1">
     Hotels
     </p>
     <h3 class="font-extrabold text-sm mb-2">
     Contact
     </h3>
     <p class="text-[9px] mb-2">
     123 Road
     </p>
     <p class="text-[9px] flex items-center space-x-1 mb-1">
     <i class="fas fa-check text-gray-600">
     </i>
     <span>
       codewithtariq
     </span>
     </p>
     <p class="text-[9px] flex items-center space-x-1 mb-1">
     <i class="fas fa-phone-alt text-gray-600">
     </i>
     <span>
       000-000-00
     </span>
     </p>
     <p class="text-[9px] flex items-center space-x-1">
     <i class="fas fa-check text-gray-600">
     </i>
     <span>
       codewithtariq
     </span>
     </p>
    </div>
    <div class="w-full sm:w-auto text-center sm:text-left mb-6 sm:mb-0">
     <p class="text-[9px] mb-1">
     Our Story
     </p>
     <p class="text-[9px] mb-1">
     Get in Touch
     </p>
     <p class="text-[9px] mb-1">
     Our Privacy Commitment
     </p>
     <p class="text-[9px] mb-1">
     Terms of service
     </p>
     <p class="text-[9px]">
     Customer Assistance
     </p>
    </div>
    <div class="w-full sm:w-auto text-center sm:text-left">
     <p class="text-[9px] mb-1">
     Dining Experience
     </p>
     <p class="text-[9px] mb-1">
     Wellness
     </p>
     <p class="text-[9px] mb-1">
     Fitness
     </p>
     <p class="text-[9px] mb-1">
     Sports
     </p>
     <p class="text-[9px]">
     Events
     </p>
    </div>
   </div>
  </footer>

  <div class="fixed bottom-0 left-0 w-full h-4 bg-yellow-400">
  </div>
 </body>
</html>