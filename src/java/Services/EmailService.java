package Services;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import Models.Booking;
import Models.User;
import javax.mail.Message;
import javax.activation.DataHandler;
import javax.activation.DataSource;

public class EmailService {

    public static void sendBookingConfirmation(User user, Booking booking) {
        // Thay thế bằng thông tin email của bạn
        final String fromEmail = "hai222ad@gmail.com"; // Email của bạn
        final String password = "zbsjzcvwavxrqyfs"; // Mật khẩu ứng dụng email của bạn

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
        props.put("mail.smtp.port", "587"); // TLS Port
        props.put("mail.smtp.auth", "true"); // enable authentication
        props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS

        // Tạo một session với authenticator
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            MimeMessage msg = new MimeMessage(session);
            // Set from, to, subject, and content
            msg.setFrom(new InternetAddress(fromEmail));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
            String subject = "Xác nhận đặt phòng #" + booking.getBookingId() + " - " + System.currentTimeMillis();
            msg.setSubject(subject, "UTF-8");
            
            String roomTypeName = (booking.getRoomType() != null)
                    ? booking.getRoomType().getRoomTypeName()
                    : "Không xác định";
            
            String emailContent = "Chào " + booking.getCustomerName() + ",<br><br>"
                    + "Cảm ơn bạn đã đặt phòng tại khách sạn của chúng tôi. Đơn đặt phòng của bạn đã được xác nhận.<br><br>"
                    + "<b>Chi tiết đặt phòng:</b><br>"
                    + "Mã đặt phòng: " + booking.getBookingId() + "<br>"
                    + "Hạng phòng: <b>" + roomTypeName + "</b><br>"
                    + "Mã phòng: <b>" + booking.getRoomNumber() + "</b><br>"
                    + "Ngày nhận phòng: " + booking.getCheckinDate() + "<br>"
                    + "Ngày trả phòng: " + booking.getCheckoutDate() + "<br>"
                    + "Tổng tiền: " + String.format("%,.0f", booking.getTotalPrice()) + " VNĐ<br><br>"
                    + "Trân trọng,<br>Khách sạn Mường Thanh";
            msg.setContent(emailContent, "text/html; charset=UTF-8");

            // Gửi email
            Transport transport = session.getTransport("smtp");
            transport.connect();
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
            System.out.println("Email sent successfully!");

        } catch (Exception e) {
            System.out.println("❌ Gửi email thất bại!");
            e.printStackTrace();
        }
    }
}
