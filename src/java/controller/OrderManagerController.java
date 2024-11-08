/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

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
import java.util.Date;
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
public class OrderManagerController extends HttpServlet {

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
            String url = "";
            HttpSession session = request.getSession();
            DAO dao = new DAO();
            User user = (User)session.getAttribute("user");
            List<OrderTable> orderTables = new ArrayList<OrderTable>();
            if("2".equals(user.getRole())){
                url = "orderManager.jsp";
                orderTables = dao.getOrderTableByCustomerID(user.getUserId());
            }else if("3".equals(user.getRole())){
                orderTables = dao.getAllOrderTableForShipper();
                url = "OrderForShipperController";
            }else if("1".equals(user.getRole())){
                orderTables = dao.getAllOrderTableForAdmin();
                url = "AdminUITransactionManage.jsp";
            }
            session.setAttribute("orderList", orderTables);
            request.getRequestDispatcher(url).forward(request, response);
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
        String submit = request.getParameter("submit");
        int order_id;
        
        switch (submit) {
            case "order":
                ShoppingCart shoppingCart = (ShoppingCart)session.getAttribute("ShoppingCart");
                User customer = (User)session.getAttribute("user");
                shoppingCart.getCartItems().get(0).getProduct().getUser();
                String ship_name = request.getParameter("ship_name");
                String ship_mail = request.getParameter("ship_mail");
                String ship_phone = request.getParameter("ship_phone");
                String ship_address = request.getParameter("ship_address");
                String discount_code = request.getParameter("discount_code");
                String payment_method = request.getParameter("payment_method");
                Integer payment = Integer.valueOf(payment_method);
                String total_amount_raw = request.getParameter("total_amount");
                if (ship_mail == null) {
                    // Handle the case when "action" is null, e.g., redirect to an error page or return an error response
                    // You can also throw an exception or log an error message
                    // For example:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameter");
                    return;
                }
                
                if(payment == 1){
                List<CartItem> CartItemsList = shoppingCart.getCartItems();
                Timestamp orderDate = new Timestamp(System.currentTimeMillis());
                while(!CartItemsList.isEmpty()){
                    for(int i=1;i<CartItemsList.size();i++){
                        BigDecimal total_amount = new BigDecimal(0);
                        OrderTable orderTable = new OrderTable(dao.randomOrderID("order_table"),ship_name, ship_mail, ship_phone, ship_address, orderDate, BigDecimal.valueOf(10), dao.getDiscountByCode(discount_code), payment_method, "1", customer);
    //                  dao.createOrderTable(orderTable);
                        List<OrderItem> orderItemsList = new ArrayList<>();
                        if(CartItemsList.get(0).getProduct().getUser().getUserId()==CartItemsList.get(i).getProduct().getUser().getUserId()){
                            OrderItem orderItem = new OrderItem(CartItemsList.get(i).getQuantity(), orderTable, CartItemsList.get(i).getPrice(), CartItemsList.get(i).getProduct());
                            orderItemsList.add(orderItem);
                            CartItemsList.remove(i);
                        }
                        OrderItem orderItem = new OrderItem(CartItemsList.get(0).getQuantity(), orderTable, CartItemsList.get(0).getPrice(), CartItemsList.get(0).getProduct());
                        orderItemsList.add(orderItem);
                        orderTable.setOrderItems(orderItemsList);
                        CartItemsList.remove(0);
                        orderTable.setSeller(orderItemsList.get(0).getProduct().getUser());
                        for(OrderItem orderItem1:orderItemsList){
                            total_amount=total_amount.add(orderItem1.getPrice().multiply(BigDecimal.valueOf((orderItem1.getQuantity()))));
                        }
                        orderTable.setTotalAmount(total_amount.add(BigDecimal.valueOf(10)));
                        dao.createOrderTable(orderTable);
                        for(OrderItem orderItem2:orderItemsList){
                            dao.addOrderItemToOrderTable(orderItem2);
                        }
                    }
                    if(CartItemsList.size()==1){
                        BigDecimal total_amount = new BigDecimal(0);
                        OrderTable orderTable = new OrderTable(dao.randomOrderID("order_table"),ship_name, ship_mail, ship_phone, ship_address, orderDate, BigDecimal.valueOf(5), dao.getDiscountByCode(discount_code), payment_method, "1", customer);
                        List<OrderItem> orderItemsList = new ArrayList<>();
                        OrderItem orderItem = new OrderItem(CartItemsList.get(0).getQuantity(), orderTable, CartItemsList.get(0).getPrice(), CartItemsList.get(0).getProduct());
                        orderItemsList.add(orderItem);
                        orderTable.setOrderItems(orderItemsList);
                        CartItemsList.remove(0);
                        orderTable.setSeller(orderItemsList.get(0).getProduct().getUser());
                        for(OrderItem orderItem1:orderItemsList){
                            total_amount=total_amount.add(orderItem1.getPrice().multiply(BigDecimal.valueOf((orderItem1.getQuantity()))));
                        }
                        orderTable.setTotalAmount(total_amount.add(BigDecimal.valueOf(10)));
                        dao.createOrderTable(orderTable);
                        for(OrderItem orderItem2:orderTable.getOrderItems()){
                            dao.addOrderItemToOrderTable(orderItem2);
                        }
                    }
                } 
                dao.deleteCartItemByCartId(shoppingCart.getCartId());
                processRequest(request, response);
                }else{
                    total_amount_raw = total_amount_raw.replace(".", "");
                    BigDecimal total_amount_raw2 = new BigDecimal(total_amount_raw);
                    Timestamp orderDate = new Timestamp(System.currentTimeMillis());
                    OrderTable orderTable = new OrderTable(dao.randomOrderID("order_table"),ship_name, ship_mail,
                                                           ship_phone, ship_address, orderDate,
                                                    BigDecimal.valueOf(10), dao.getDiscountByCode(discount_code),
                                                    payment_method, "1", customer);
                    session.setAttribute("order", orderTable);
                    session.setAttribute("total_amount", total_amount_raw2.add(BigDecimal.valueOf(10)));
                    response.sendRedirect("vnpay_pay.jsp?total_amount="+total_amount_raw2+"00");
                }
                
                break;
            case "accept":
                order_id = Integer.parseInt(request.getParameter("order_id"));
                User user = (User) session.getAttribute("user");
                dao.changeStatusAndShipperForOrderTable("3", user.getUserId(), order_id);
                processRequest(request, response);
                break;
            case "view":
                order_id =  Integer.parseInt(request.getParameter("order_id"));
                OrderTable orderTable = dao.getOrderTableByOrderIdWithOrderItems(order_id);
                request.setAttribute("detail", orderTable);
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
