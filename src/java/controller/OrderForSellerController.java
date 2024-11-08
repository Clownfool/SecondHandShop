/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DAO;
import dto.OrderItem;
import dto.OrderTable;
import dto.Product;
import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class OrderForSellerController extends HttpServlet {

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
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        User user = (User)session.getAttribute("user");
        List<OrderTable> orderTables = dao.getOrderTableBySellerId(user.getUserId());
        session.setAttribute("orderList", orderTables);
        request.getRequestDispatcher("orderForSeller.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        String action = request.getParameter("action");
        int order_id = Integer.parseInt(request.getParameter("order_id"));
        switch (action) {
            case "confirm":
                for(OrderItem orderItem: dao.getOrderItemsByOrderId(order_id)){
                    int quantity_sold = orderItem.getProduct().getQuantitySold()+orderItem.getQuantity();
                    int new_quantity = orderItem.getProduct().getQuantity()-orderItem.getQuantity();
                    String status = "1";
                    if(new_quantity==0){
                        status = "2";
                    }
                    dao.changeProductQuantity(orderItem.getProduct(), new_quantity, quantity_sold, status);
                } 
                dao.changeStatusForOrderTable("2", order_id);
                processRequest(request, response);
                break;
            case "view":
                OrderTable orderTable = dao.getOrderTableByOrderIdWithoutOrderItems(order_id);
                List<OrderItem> orderItems = dao.getOrderItemsByOrderId(order_id);
                request.setAttribute("detail", orderTable);
                request.setAttribute("listO", orderItems);
                request.getRequestDispatcher("detailOrderTable.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
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
