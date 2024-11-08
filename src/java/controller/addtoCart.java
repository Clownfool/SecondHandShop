/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DAO;
import dto.CartItem;
import dto.OrderItem;
import dto.OrderTable;
import dto.Product;
import dto.ShoppingCart;
import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
public class addtoCart extends HttpServlet {

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
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        if(session.getAttribute("user")==null){
            response.sendRedirect("Login.jsp");
        }else{
            User user = (User)session.getAttribute("user");
            int quantity = 1;
            int pid;
            if(request.getParameter("pid")!=null){
                pid = Integer.parseInt(request.getParameter("pid"));
                Product product = dao.getProductWithImagesByProductID(pid);
                if(product!=null){
                    if(request.getParameter("quantity")!=null){
                        quantity = Integer.parseInt(request.getParameter("quantity"));
                        if (quantity>product.getQuantity()) {
                            quantity=product.getQuantity();
                        }
                    }
                    ShoppingCart shoppingCart = dao.getShoppingCartByUserID(user.getUserId());
                        List<CartItem> cartItems = dao.getCartItemsByCartID(shoppingCart.getCartId());
                        boolean check = false;
                        for(CartItem cartItem : cartItems){
                            if(cartItem.getProduct().getProductId() == product.getProductId()){
                                quantity=cartItem.getQuantity()+quantity;
                                if (quantity>product.getQuantity()) {
                                    quantity=product.getQuantity();
                                }
                                dao.addToSimiliarCart(cartItem, quantity,product.getPrice().multiply(BigDecimal.valueOf(quantity)));
                                check = true;
                            }
                        }
                        if(check == false){
                            dao.addToCart(new CartItem(quantity, product, shoppingCart, product.getPrice().multiply(BigDecimal.valueOf(quantity))));
                        }
                        shoppingCart = dao.getShoppingCartByUserID(user.getUserId());
                        session.setAttribute("ShoppingCart", shoppingCart);
                }
                ShoppingCart shoppingCart = dao.getShoppingCartByUserID(user.getUserId());
                session.setAttribute("ShoppingCart", shoppingCart);
                response.sendRedirect("cart.jsp");
            }else{
                response.sendRedirect("cart.jsp");
            }
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
