package Models;

import java.sql.Date;

public class Booking {
    private int bookingId;
    private int userId;
    private int roomTypeId;
    private String roomNumber;
    private Date checkinDate;
    private Date checkoutDate;
    private int numberOfGuests;
    private double totalPrice;
    private String status; // e.g., "Confirmed", "Pending", "Cancelled"
    private Date bookingDate;
    private String specialRequests;
    private String customerPhoneNumber;
    private String customerName;
    public User user;

    public Booking() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(int roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public Date getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(Date checkinDate) {
        this.checkinDate = checkinDate;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public int getNumberOfGuests() {
        return numberOfGuests;
    }

    public void setNumberOfGuests(int numberOfGuests) {
        this.numberOfGuests = numberOfGuests;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getSpecialRequests() {
        return specialRequests;
    }

    public void setSpecialRequests(String specialRequests) {
        this.specialRequests = specialRequests;
    }

    public String getCustomerPhoneNumber() {
        return customerPhoneNumber;
    }

    public void setCustomerPhoneNumber(String customerPhoneNumber) {
        this.customerPhoneNumber = customerPhoneNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Override
    public String toString() {
        return "Booking{" + "bookingId=" + bookingId + ", userId=" + userId + ", roomTypeId=" + roomTypeId + ", roomNumber=" + roomNumber + ", checkinDate=" + checkinDate + ", checkoutDate=" + checkoutDate + ", numberOfGuests=" + numberOfGuests + ", totalPrice=" + totalPrice + ", status=" + status + ", bookingDate=" + bookingDate + ", specialRequests=" + specialRequests + ", customerPhoneNumber=" + customerPhoneNumber + ", customerName=" + customerName + '}';
    }
}
  