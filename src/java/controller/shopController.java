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
public class shopController extends HttpServlet {

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
        String action = (String) request.getParameter("action");
        
        
        
        if(indexPage==null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        HttpSession session = request.getSession();
        User c = (User) session.getAttribute("user");
        DAO dao = new DAO();
        Product p = new Product();
        int count = dao.getTotal("product");
        int endPage = count/9;
        if(count%9!=0) endPage++;
        List<Product> list = dao.pagingAllActiveProducts9Rows(index);
        if(search!=null){
            list = p.findProductsByString(list,search);
        }
        String priceRange = "all";
        
        List<Category> listC = dao.getAllCategories();
        
 if (action != null) {
    List<Product> listResult;
    List<Product> sortProduct;
    
    switch (action) {
        case "lowest":
             listResult = new DAO().getAllActiveProducts();
            sortProduct = p.sortProductsByPriceAscending(listResult);
            list = sortProduct;
            break;
                
        case "highest":
              listResult = new DAO().getAllActiveProducts();
            sortProduct = p.sortProductsByPriceDescending(listResult);
            list = sortProduct;
            
           
            break;
            
        default:
            throw new AssertionError();
    }
}
        
        session.setAttribute("listCC", listC);
        session.setAttribute("listP", list);
        request.setAttribute("endPage", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("priceRange", priceRange);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
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

    
    public static void main(String[] args) {
        DAO dao = new DAO();
        Product p = new Product();
        int index = 1;
        List<Product> list = dao.pagingAllActiveProducts9Rows(index);
        
        String action = "highest";
        if(action != null){
            switch (action) {
            case "highest":
                List<Product> listResult = new DAO().getAllActiveProducts();
                List<Product> sortProduct = p.sortProductsByPriceAscending(listResult);
                list = sortProduct;
                break;
                
            case "lowest":
             break;
            default:
                throw new AssertionError();
        }
        }
    }
        
}
