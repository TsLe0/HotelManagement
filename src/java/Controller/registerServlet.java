/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList; // Import ArrayList
import java.util.List;
import Models.User;

/**
 *
 * @author zx1
 */
@WebServlet(name = "registerServlet", urlPatterns = {"/register"})
public class registerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");

        String errPass = "";
        String errMail = "";
        List<String> errUserList = new ArrayList<>(); // Use a list to store multiple username errors
        String success = "";
        boolean check = true; // Overall check for all validations

        try {
            // --- Password Validation ---
            if (pass1 == null || pass2 == null || pass1.isEmpty() || pass2.isEmpty()) {
                errPass = "Mật khẩu không được để trống.";
                check = false;
            } else if (!pass1.equals(pass2)) {
                errPass = "Mật khẩu xác nhận không khớp.";
                check = false;
            } else if (pass1.length() < 6) { // Example: minimum password length
                errPass = "Mật khẩu phải có ít nhất 6 ký tự.";
                check = false;
            }

            // --- Username Validation ---
            if (username == null || username.trim().isEmpty()) {
                errUserList.add("Tên người dùng không được để trống.");
                check = false;
            } else {
                // Individual username validation checks
                if (username.length() < 6 || username.length() > 20) {
                    errUserList.add("Độ dài từ 6 đến 20 ký tự.");
                    check = false;
                }
                if (username.contains(" ")) {
                    errUserList.add("Không có dấu cách.");
                    check = false;
                }
                if (!username.matches("^[a-zA-Z0-9_]*$")) {
                    errUserList.add("Chỉ chứa chữ cái, số và dấu gạch dưới (_).");
                    check = false;
                }
                if (username.contains("__")) { // No consecutive underscores
                    errUserList.add("Không có hai dấu gạch dưới liên tiếp.");
                    check = false;
                }
                if (!username.matches("^[a-zA-Z0-9].*[a-zA-Z0-9]$|^[a-zA-Z0-9]$")) { // Starts and ends with letter/number
                    errUserList.add("Bắt đầu và kết thúc bằng chữ cái hoặc số.");
                    check = false;
                }
            }
            
            // --- Database Checks for Email and Username Existence ---
            UserDAO ud = new UserDAO();
            List<User> allUser = ud.getAll();

            for (User temp : allUser) {
                if (temp.getEmail().equals(email)) {
                    errMail = "Email này đã được sử dụng.";
                    check = false;
                    break; // No need to check other users for email once found
                }
            }
            
            // Only check username existence if its format is already valid
            // This prevents "username already exists" from overriding "invalid format"
            if (errUserList.isEmpty()) { // If no format errors for username
                for (User temp : allUser) {
                    if (temp.getUsername().equals(username)) {
                        errUserList.add("Tên người dùng này đã tồn tại.");
                        check = false;
                        break; // No need to check other users for username once found
                    }
                }
            }

            // Set attributes for errors
            request.setAttribute("errMail", errMail);
            request.setAttribute("errPass", errPass);
            // If there are specific username errors, set them. Otherwise, leave it empty.
            if (!errUserList.isEmpty()) {
                // If you want to show individual errors, you can add them to request attributes
                // Or you can join them into a single string for display
                request.setAttribute("errUserMessages", errUserList); // Send list of messages
                request.setAttribute("errUser", "invalid_format"); // Indicate client to show specific rules or server messages
            } else {
                request.setAttribute("errUser", ""); // Clear any previous errUser if it was valid
            }

            if (check) {
                User result = new User(username, pass2, email);
                ud.register(result);
                success = "Đăng ký tài khoản thành công! Vui lòng đăng nhập.";
                request.setAttribute("success", success);
                // Optionally clear input fields on successful registration
                request.setAttribute("email", "");
                request.setAttribute("username", "");
            } else {
                // If there are errors, make sure to retain the user's input
                request.setAttribute("email", email);
                request.setAttribute("username", username);
            }
            
            request.getRequestDispatcher("register.jsp").forward(request, response);

        } catch (Exception e) {
            // Log the exception for debugging
            e.printStackTrace();
            // Set a generic error message for unexpected errors
            request.setAttribute("generalError", "Đã xảy ra lỗi không mong muốn. Vui lòng thử lại sau.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Register Servlet handles user registration.";
    }// </editor-fold>

    /**
     * This method is no longer used for detailed validation.
     * Individual checks are performed directly in doPost.
     * Keeping it here for reference or if needed elsewhere.
     */
    public static boolean isValidUsername(String username) {
        // This method's logic is now broken down and handled in doPost
        // If you still want a single boolean check, you'd combine all regex checks here
        return true; // Placeholder
    }
}