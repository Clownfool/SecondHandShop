/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DAO;
import dto.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class forgotPasswordController extends HttpServlet {

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
        DAO dao  = new DAO();
        HttpSession session=request.getSession();
        String submit = request.getParameter("submit");
        User forgotPasswordCustomer;
        User customer;
        switch(submit){
            case "Submit E-mail":
                String argUser = request.getParameter("argUser");
                forgotPasswordCustomer = dao.checkForgotPasswordAccount(argUser);
                String code = validation.randomCode(10);
                if(forgotPasswordCustomer==null){
                    request.setAttribute("message", "Username/E-mail is not existed!");
                    request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
                }else{
                    String subject = "Verify your Email";
                    String content = "<h2>We noticed that you have recently registered an account on SFashion. However, before we proceed further, we need to verify your identity.</h2>\r\n"
                            + "<h2>Your Verification Code: "+code+" </h2>\r\n";
                    validation.sendEmail(forgotPasswordCustomer.getEmail(),subject,content);
                    session.setAttribute("forgotPasswordCustomer", forgotPasswordCustomer);
                    session.setAttribute("verificationCode", code);
                    request.getRequestDispatcher("verifyForgotEmail.jsp").include(request, response);
                }
                break;
            case "Verify":
                String codeB = request.getParameter("code");
                String inputCode = request.getParameter("inputCode");
                forgotPasswordCustomer = (User)session.getAttribute("forgotPasswordCustomer");
                if(!codeB.equals(inputCode)) {
                    request.setAttribute("message", "Verification code was not match!");
                    session.setAttribute("forgotPasswordCustomer", forgotPasswordCustomer);
                    session.setAttribute("verificationCode", codeB);
                    request.getRequestDispatcher("verifyForgotEmail.jsp").forward(request, response);
                }
                else {
                    customer = (User)session.getAttribute("forgotPasswordCustomer");
                    session.setAttribute("forgotPasswordCustomer", customer);
                    request.getRequestDispatcher("changeForgotPassword.jsp").forward(request, response);         
                }
                break;
            case "Change Password":
                customer = (User)session.getAttribute("forgotPasswordCustomer");
                String newPassword = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");
                if(!newPassword.equals(confirmPassword)){
                    request.setAttribute("message", "New Password and Comfirm Password are not match!");
                    request.getRequestDispatcher("changeForgotPassword.jsp").forward(request, response);
                }else {
                    dao.changePassword(customer.getUserId(), newPassword);
                    session.setAttribute("Message", "Password change successful!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                break;
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
