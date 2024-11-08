/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DAO;
import dto.Chatroom;
import dto.Message;
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
public class ChatboxController extends HttpServlet {

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
        User user1 = (User)session.getAttribute("user");
        int uid = Integer.parseInt(request.getParameter("uid"));
        User user2 = dao.getUserByID(uid);
        Chatroom chatroom = new Chatroom(user1, user2);
        Chatroom check_chatroom = dao.getChatRoomByUsersId(chatroom);
        if(check_chatroom==null){
            dao.addChatRoom(chatroom.getUser1().getUserId(), chatroom.getUser2().getUserId());
            Chatroom new_chatroom = dao.getChatRoomByUsersId(chatroom);
            List<Message> chatList = dao.getChatMessages(new_chatroom.getRoomId());
            request.setAttribute("chatList", chatList);
            request.setAttribute("room_id", new_chatroom.getRoomId());
            request.getRequestDispatcher("chatBox.jsp").forward(request, response);
        }
        else{
            List<Message> chatList = dao.getChatMessages(check_chatroom.getRoomId());
            request.setAttribute("chatList", chatList);
            request.setAttribute("room_id", check_chatroom.getRoomId());
            request.getRequestDispatcher("chatBox.jsp").forward(request, response);
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
