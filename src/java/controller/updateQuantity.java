/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DAO;
import dto.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class updateQuantity extends HttpServlet {

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
        String action = request.getParameter("action");
        int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
        CartItem cartItem = dao.getCartItemByCartItemID(cartItemID);
        int newQuantity;
        switch (action) {
            case "minus":
                newQuantity = cartItem.getQuantity()-1;
                if (newQuantity>cartItem.getProduct().getQuantity()) {
                    newQuantity=cartItem.getProduct().getQuantity();
                }
                if (newQuantity==0) {
                    newQuantity = 1;
                }
                dao.addToSimiliarCart(cartItem, newQuantity,cartItem.getProduct().getPrice().multiply(BigDecimal.valueOf(newQuantity)));
                response.sendRedirect("cart.jsp");
                break;
            case "plus":
                newQuantity = cartItem.getQuantity()+1;
                if (newQuantity>cartItem.getProduct().getQuantity()) {
                    newQuantity=cartItem.getProduct().getQuantity();
                }
                dao.addToSimiliarCart(cartItem, newQuantity,cartItem.getProduct().getPrice().multiply(BigDecimal.valueOf(newQuantity)));
                response.sendRedirect("cart.jsp");
                break;
            case "delete":
                dao.deleteCartItem(cartItemID);
                response.sendRedirect("cart.jsp");
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
