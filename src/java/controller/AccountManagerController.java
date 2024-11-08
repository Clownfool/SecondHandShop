/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DAO;
import dto.Category;
import dto.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AccountManagerController extends HttpServlet {

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
        String indexPage = request.getParameter("index");
        String search = request.getParameter("search");
        if(indexPage==null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        DAO dao = new DAO();
        HttpSession session=request.getSession();
        User user = new User();
        int count = dao.getTotal("user");
        int endPage = count/10;
        if(count%10!=0) endPage++;
        List<User> userList = dao.pagingAccounts(index);
        userList.remove((User)session.getAttribute("user"));
        if (search!=null) {
            userList = user.findUsersByString(userList,search);
        }
        session.setAttribute("ListAllUsers", userList);
        session.setAttribute("search", search);
        request.setAttribute("endPage", endPage);
        request.setAttribute("tag", index);
        request.getRequestDispatcher("AdminUIUserAccounts.jsp").forward(request, response);
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
        DAO dao = new DAO();
        User user = new User();
        HttpSession session=request.getSession();
        String action = request.getParameter("action");
        switch (action) {
            case "detail":
                
                break;
            case "delete":
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                User currentUser = (User) session.getAttribute("user");
                if(user_id==currentUser.getUserId()){
                    session.setAttribute("Message", "Cannot Delete Because Of Logged-in Account!");
                    processRequest(request, response);
                }else{
                    session.setAttribute("Message", "Delete Successfully");
                    dao.deleteAccount(user_id);
                    processRequest(request, response);
                }
                break;
            case "Add":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String role = request.getParameter("role");
                if(!dao.checkUsername(username)){
                    session.setAttribute("message", "This username is existed!");
                    request.getRequestDispatcher("accountManager.jsp").forward(request, response);
                }
                else if(!dao.checkEmail(email)){
                    session.setAttribute("message", "This email is existed!");
                    request.getRequestDispatcher("accountManager.jsp").forward(request, response);
                }
                else if(!dao.checkPhoneNumber(phone)){
                    session.setAttribute("message", "This phone is existed!");
                    request.getRequestDispatcher("accountManager.jsp").forward(request, response);
                }
                dao.doSignup(username, password, name, email, address, phone, role);
                processRequest(request, response);
                break;
            default:
                processRequest(request, response);
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

}
