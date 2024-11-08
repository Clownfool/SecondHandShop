package Controller;

import dal.DAO;
import dto.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.Instant;

/**
 *
 * @author Trung Kien
 */
@WebServlet(name = "RegisterControl", urlPatterns = { "/RegisterControl" })
public class RegisterControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        String submit = request.getParameter("submit");
        User register;
        switch (submit) {
            case "Verify":

                // String codeB = request.getParameter("code");
                // String inputCode = request.getParameter("inputCode");
                 register = (User)session.getAttribute("register");

                String codeB = (String) session.getAttribute("verificationCode"); // Mã xác nhận từ session
                String inputCode = request.getParameter("inputCode"); // Mã người dùng nhập vào

                // Lấy thời gian hết hạn từ session
                long expiryTime = (Long) session.getAttribute("verificationCodeExpiryTime");
                long currentTime = Instant.now().toEpochMilli();

                // Kiểm tra mã xác nhận và thời gian hết hạn
                if (currentTime > expiryTime) {
                    // Nếu mã hết hạn, xóa mã khỏi session và thông báo cho người dùng
                    session.removeAttribute("verificationCode");
                    session.removeAttribute("verificationCodeExpiryTime");
                    request.setAttribute("message", "Verification code has expired. Please request a new one.");
                    request.getRequestDispatcher("verifyEmail.jsp").forward(request, response);
                    return; // Dừng lại và không xử lý tiếp
                }

                if (!codeB.equals(inputCode)) {
                    request.setAttribute("message", "Verification code was not match!");
                    session.setAttribute("register", register);
                    session.setAttribute("verificationCode", codeB);
                    request.getRequestDispatcher("verifyEmail.jsp").forward(request, response);
                } else {
                    User user = (User) session.getAttribute("register");
                    dao.doSignup(user.getUsername(), user.getPassword(), user.getName(), user.getEmail(),
                            user.getAddress(), user.getPhone(), user.getRole());
                    // dao.sendEmail(gmail, user);
                    user = dao.doLogin(user.getUsername(), user.getPassword());
                    if ("2".equals(user.getRole())) {
                        dao.createShoppingCart(user.getUserId());
                    }
                    session.setAttribute("Message", "Sign-up Successful!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    // }
                }
                break;
            case "Sign Up":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String re_password = request.getParameter("re_password");
                String first_name = request.getParameter("first_name");
                String last_name = request.getParameter("last_name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String province = request.getParameter("province");
                String role = request.getParameter("role");
                register = new User(username, password, first_name + " " + last_name, email, address + ", " + province,
                        phone, role);
                String code = validation.randomCode(10);
                if (!dao.checkUsername(username)) {
                    session.setAttribute("username", null);
                    session.setAttribute("password", password);
                    session.setAttribute("re_password", re_password);
                    session.setAttribute("first_name", first_name);
                    session.setAttribute("last_name", last_name);
                    session.setAttribute("email", email);
                    session.setAttribute("phone", phone);
                    session.setAttribute("address", address);
                    session.setAttribute("role", role);
                    request.setAttribute("message", "This username is existed!");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                } else if (!dao.checkEmail(email)) {
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("re_password", re_password);
                    session.setAttribute("first_name", first_name);
                    session.setAttribute("last_name", last_name);
                    session.setAttribute("email", null);
                    session.setAttribute("phone", phone);
                    session.setAttribute("address", address);
                    session.setAttribute("role", role);
                    request.setAttribute("message", "This email is existed!");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                } else if (!dao.checkPhoneNumber(phone)) {
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("re_password", re_password);
                    session.setAttribute("first_name", first_name);
                    session.setAttribute("last_name", last_name);
                    session.setAttribute("email", email);
                    session.setAttribute("phone", null);
                    session.setAttribute("address", address);
                    session.setAttribute("role", role);
                    request.setAttribute("message", "This phone is existed!");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                } else if (!password.equals(re_password)) {
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("re_password", null);
                    session.setAttribute("first_name", first_name);
                    session.setAttribute("last_name", last_name);
                    session.setAttribute("email", email);
                    session.setAttribute("phone", phone);
                    session.setAttribute("address", address);
                    session.setAttribute("role", role);
                    request.setAttribute("message", "Password was not match!");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                } else {
                    String subject = "Verify your Email";
                    String content = "<h2>Thanks for registering for an account on SFashion! Before we get started, we just need to confirm that this is you.</h2>\r\n"
                            + "<h2>Your Verification Code: " + code + " </h2>\r\n";
                    validation.sendEmail(email, subject, content);
                    session.setAttribute("register", register);
                    session.setAttribute("verificationCode", code);
                    request.getRequestDispatcher("verifyEmail.jsp").include(request, response);
                }
                
                 session.setAttribute("verificationCode", code);
                long expiryTimeMock = Instant.now().plusSeconds(180).toEpochMilli(); // Thời gian hết hạn 180 giây
                session.setAttribute("verificationCodeExpiryTime", expiryTimeMock);
                break;
            // case "EmailSignUp":
            // if(!password.equals(re_password)) {
            // request.setAttribute("message", "Password was not match!");
            // request.getRequestDispatcher("Register.jsp").forward(request, response);
            // }
            // else {
            // //Account a;
            // // if(dao.checkExistGmail(gmail) != null) {
            // // request.setAttribute("message", "This gmail was register! Try again!");
            // // request.getRequestDispatcher("Register.jsp").forward(request, response);
            // // }
            // // else if(dao.checkExistUser(user) != null) {
            // // request.setAttribute("message", "This username was register! Try again!");
            // // request.getRequestDispatcher("Register.jsp").forward(request, response);
            // // }
            // // else {
            // dao.signup(username, password, email, first_name+" "+last_name, phone,
            // address);
            // // dao.sendEmail(gmail, user);
            // request.setAttribute("message", "Register SUCCESSFULLY!");
            //
            // request.getRequestDispatcher("Register.jsp").forward(request, response);
            // // }
            // }
            // break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
