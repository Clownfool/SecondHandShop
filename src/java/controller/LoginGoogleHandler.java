/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.User;
import entity.Constants;
import entity.UserGoogleDto;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author Admin
 */
public class LoginGoogleHandler extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public LoginGoogleHandler() {
        super();
    }
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
        DAO dao = new DAO();
        HttpSession session=request.getSession();
//        String code = request.getParameter("code");
//	String accessToken = getToken(code);
//	UserGoogleDto user = getUserInfo(accessToken);
//        Customer customer = new Customer();
//        customer.setEmail(user.getEmail());
//	if(customer==null){
//                        request.setAttribute("message", "Incorrect email/phone or password");
//                        request.getRequestDispatcher("Login.jsp").forward(request, response);
//                }else{
//                    HttpSession session=request.getSession();
//                    session.setAttribute("user", customer);
//                    session.setAttribute("userRole", "customer");
//                    response.sendRedirect("index.jsp");
//                }
        //---------------------------------------
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            request.setAttribute("message", "Incorrect Email");
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = getToken(code);
            UserGoogleDto userGoogleDto = getUserInfo(accessToken);
            User user = new User();
            user = dao.checkEmailLogin(userGoogleDto.getEmail());
            if(user==null){
                user = new User();
                user.setEmail(userGoogleDto.getEmail());
                user.setUsername(userGoogleDto.getEmail());
                user.setName(splitEmailToUsername(userGoogleDto.getEmail()));
                user.setRole("2");
                dao.doSignup(user.getUsername(), user.getPassword(), user.getName(), user.getEmail(), user.getAddress(), user.getPhone(), user.getRole());
                session.setAttribute("isEmail", true);
            }else{
                session.setAttribute("isEmail", false);
            }
                session.setAttribute("user", user);
            RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
            dis.forward(request, response);
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
    public String getToken(String code) throws ClientProtocolException, IOException {
		// call api to get token
		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
						.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();

		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}

    public UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
	String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
	String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

        return googlePojo;
    }
    public String splitEmailToUsername(String email){
        String[] parts = email.split("@");
        String username = parts[0];
        return username;
    }
}
