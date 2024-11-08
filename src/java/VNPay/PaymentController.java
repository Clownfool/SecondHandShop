/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package VNPay;

import dal.DAO;
import dto.CartItem;
import dto.OrderItem;
import dto.OrderTable;
import dto.ShoppingCart;
import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author htk09
 */
public class PaymentController extends HttpServlet {

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
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        OrderTable orderTable = (OrderTable) session.getAttribute("order");
        User customer = (User) session.getAttribute("user");
        BigDecimal total_amount_raw = (BigDecimal) session.getAttribute("total_amount");
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");

        List<CartItem> CartItemsList = shoppingCart.getCartItems();
        Timestamp orderDate = new Timestamp(System.currentTimeMillis());
        while (!CartItemsList.isEmpty()) {
            for (int i = 1; i < CartItemsList.size(); i++) {
                BigDecimal total_amount = new BigDecimal(0);
                //                  dao.createOrderTable(orderTable);
                List<OrderItem> orderItemsList = new ArrayList<>();
                if (CartItemsList.get(0).getProduct().getUser().getUserId() == CartItemsList.get(i).getProduct().getUser().getUserId()) {
                    OrderItem orderItem = new OrderItem(CartItemsList.get(i).getQuantity(), orderTable, CartItemsList.get(i).getPrice(), CartItemsList.get(i).getProduct());
                    orderItemsList.add(orderItem);
                    CartItemsList.remove(i);
                }
                OrderItem orderItem = new OrderItem(CartItemsList.get(0).getQuantity(), orderTable, CartItemsList.get(0).getPrice(), CartItemsList.get(0).getProduct());
                orderItemsList.add(orderItem);
                orderTable.setOrderItems(orderItemsList);
                CartItemsList.remove(0);
                orderTable.setSeller(orderItemsList.get(0).getProduct().getUser());
                for (OrderItem orderItem1 : orderItemsList) {
                    total_amount = total_amount.add(orderItem1.getPrice().multiply(BigDecimal.valueOf((orderItem1.getQuantity()))));
                }
                orderTable.setTotalAmount(total_amount.add(BigDecimal.valueOf(10)));
                dao.createOrderTable(orderTable);
                for (OrderItem orderItem2 : orderItemsList) {
                    dao.addOrderItemToOrderTable(orderItem2);
                }
            }
            if (CartItemsList.size() == 1) {
                BigDecimal total_amount = new BigDecimal(0);
                List<OrderItem> orderItemsList = new ArrayList<>();
                OrderItem orderItem = new OrderItem(CartItemsList.get(0).getQuantity(), orderTable, CartItemsList.get(0).getPrice(), CartItemsList.get(0).getProduct());
                orderItemsList.add(orderItem);
                orderTable.setOrderItems(orderItemsList);
                CartItemsList.remove(0);
                orderTable.setSeller(orderItemsList.get(0).getProduct().getUser());
                for (OrderItem orderItem1 : orderItemsList) {
                    total_amount = total_amount.add(orderItem1.getPrice().multiply(BigDecimal.valueOf((orderItem1.getQuantity()))));
                }
                orderTable.setTotalAmount(total_amount.add(BigDecimal.valueOf(10)));
                dao.createOrderTable(orderTable);
                for (OrderItem orderItem2 : orderTable.getOrderItems()) {
                    dao.addOrderItemToOrderTable(orderItem2);
                }
            }
            dao.deleteCartItemByCartId(shoppingCart.getCartId());

        }
        
        List<OrderTable> orderTables = new ArrayList<>();
            if("2".equals(customer.getRole())){
                orderTables = dao.getOrderTableByCustomerID(customer.getUserId());
            }else if("3".equals(customer.getRole())){
                orderTables = dao.getAllOrderTableForShipper();
            }
            session.setAttribute("orderList", orderTables);
            request.getRequestDispatcher("orderManager.jsp").forward(request, response);
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
        OrderTable order = (OrderTable) session.getAttribute("order");
        User customer = (User) session.getAttribute("user");
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PaymentController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentController at " + order.toString() + "</h1>");
            out.println("<h1>Servlet PaymentController at " + customer.toString() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
