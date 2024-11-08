/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DAO;
import dto.Category;
import dto.Product;
import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class CategoryManagerController extends HttpServlet {

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
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        Category category = new Category();
        int count = dao.getTotal("category");
        int endPage = count/10;
        if(count%10!=0) endPage++;
        List<Category> categoryList = dao.pagingCategories(index);
        if(search!=null){
            categoryList = category.findCategoriesByString(categoryList,search);
        }
        session.setAttribute("slistCC", categoryList);
        session.setAttribute("search", search);
        session.setAttribute("slistCC", categoryList);
        request.setAttribute("endPage", endPage);
        request.setAttribute("tag", index);
        request.getRequestDispatcher("categoryManager.jsp").forward(request, response);
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
        Category category = new Category();
        HttpSession session=request.getSession();
        switch (request.getParameter("action")) {
            case "detail":
                
                break;
            case "delete":
                int category_id = Integer.parseInt(request.getParameter("category_id"));
                    session.setAttribute("Message", "Delete Successfully");
                    dao.deleteAccount(category_id);
                    processRequest(request, response);
                break;
            case "search":
                String search = request.getParameter("search");
                List<Category> categoryList = dao.getAllCategories();
                categoryList = category.findCategoriesByString(categoryList,search);
                session.setAttribute("slistCC", categoryList);
                session.setAttribute("search", search);
                request.getRequestDispatcher("accountManager.jsp").forward(request, response);
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
