package Controller;

import DAO.RoomsDAO;
import Models.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "LatestRoomsServlet", urlPatterns = {"/latest-rooms-servlet"})
public class LatestRoomsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
         
            RoomsDAO roomDAO = new RoomsDAO();
            List<Room> latestRooms = roomDAO.getLatestRooms(6); // Get the 6 latest rooms
            request.setAttribute("latestRooms", latestRooms);
            request.getRequestDispatcher("latestRooms.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle error, maybe redirect to an error page
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving latest rooms.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for displaying the latest rooms.";
    }
}
