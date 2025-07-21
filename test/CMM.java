
import DAO.BookingDAO;
import Models.Booking;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author Admin
 */
public class CMM {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BookingDAO dao = new BookingDAO();
        Booking b = dao.getById(35);
        System.out.println(b);
    }
    
}
