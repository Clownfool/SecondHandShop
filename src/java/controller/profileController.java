/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DAO;
import dto.User;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class profileController extends HttpServlet {

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
        String statusSave ="disabled";
        String statusEdit = "";
        request.setAttribute("statusSave", statusSave);
        request.setAttribute("statusEdit", statusEdit);
        HttpSession sessionPassword=request.getSession();
        sessionPassword.setAttribute("changePassword", false);
        request.getRequestDispatcher("profileCustomer.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession();
        DAO dao = new DAO();
        String action =request.getParameter("action");
        switch (action) {
            case "edit":
                String statusSave ="";
                String statusEdit = "disabled";
                request.setAttribute("statusSave", statusSave);
                request.setAttribute("statusEdit", statusEdit);
                request.getRequestDispatcher("profileCustomer.jsp").forward(request, response);
                break;
            case "save":
                boolean Valid = true;
                User baseC = (User)session.getAttribute("user");
                String customerName =request.getParameter("customerName");
                if(customerName==""){
                    customerName=baseC.getName();
                }
                String phone =request.getParameter("phone");
                if(phone==""){
                    phone=baseC.getPhone();
                }else if (!isValidPhoneNumber(phone)){
                    request.setAttribute("message", "Invalid phone number");
                    phone=baseC.getPhone();
                    Valid=false;
                }
                String address =request.getParameter("address");
                if(address==""){
                    address=baseC.getAddress();
                }
                dao.changeProfile(baseC.getUsername(), baseC.getPassword(), customerName, phone, address);
                User changeC = dao.doLogin(baseC.getUsername(), baseC.getPassword());
                session.setAttribute("user", changeC);
                if(Valid=true){
                    statusSave ="disabled";
                    statusEdit = "";
                    request.setAttribute("statusSave", statusSave);
                    request.setAttribute("statusEdit", statusEdit);
                }else{
                    statusSave ="";
                    statusEdit = "disabled";
                    request.setAttribute("statusSave", statusSave);
                    request.setAttribute("statusEdit", statusEdit);
                }
                request.getRequestDispatcher("profileCustomer.jsp").forward(request, response);
                break;
        }
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
    public boolean isValidEmail(String email) {
        // Regular expression pattern for email validation
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
    }
    public boolean isValidPhoneNumber(String phoneNumber) {
        // Regular expression pattern for phone number validation
        String phoneRegex = "^[0-9]{10}$";

        Pattern pattern = Pattern.compile(phoneRegex);
        Matcher matcher = pattern.matcher(phoneNumber);

        return matcher.matches();
    }
}
