<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Latest Rooms</title>
        <link rel="stylesheet" href="css/style.css"/> <%-- Assuming a general style.css --%>
        <style>
            .room-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: center;
                padding: 20px;
            }
            .room-card {
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                width: 300px;
                overflow: hidden;
                background-color: #fff;
            }
            .room-card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }
            .room-info {
                padding: 15px;
            }
            .room-info h3 {
                margin-top: 0;
                color: #333;
            }
            .room-info p {
                color: #666;
                font-size: 0.9em;
                margin-bottom: 5px;
            }
            .room-info .price {
                font-weight: bold;
                color: #007bff;
                font-size: 1.1em;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <h1>Latest Rooms</h1>
            <div class="room-container">
                <%
                    java.util.List<Models.Room> latestRooms = (java.util.List<Models.Room>) request.getAttribute("latestRooms");
                    if (latestRooms != null && !latestRooms.isEmpty()) {
                        for (Models.Room room : latestRooms) {
                %>
                <div class="room-card">
                    <img src="image/room_placeholder.jpg" alt="Room Image"/> <%-- Placeholder image --%>
                    <div class="room-info">
                        <h3>Room <%= room.getRoomID() %> - <%= room.getRoomType().getRoomTypeName() %></h3>
                        <p>Status: <%= room.getStatus() %></p>
                        <p class="price">Price: $<%= room.getRoomType().getPrice() %></p>
                        <p><%= room.getRoomType().getDescription() %></p>
                        <a href="RoomDetailServlet?roomID=<%= room.getRoomID() %>">View Details</a>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <p>No latest rooms available.</p>
                <%
                    }
                %>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
