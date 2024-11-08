/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.DAO;
import dto.Category;
import dto.Product;
import dto.User;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;
import javax.imageio.ImageIO;
import jakarta.servlet.http.Part;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class productManagerController extends HttpServlet {

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
        String indexPage = request.getParameter("index");
        String search = request.getParameter("search");
        if(indexPage==null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        HttpSession session = request.getSession();
        User c = (User) session.getAttribute("user");
        int id = c.getUserId();
        DAO dao = new DAO();
        int count = dao.getTotalByUserId("product",c.getUserId());
        int endPage = count/10;
        if(count%10!=0) endPage++;
        List<Product> products;
        Product product = new Product();
        if ("1".equals(c.getRole())) {
            url = "AdminUIProductsManage.jsp";
            products = dao.pagingAllProducts(index);
        }else{
            products = dao.pagingProducts(index,id);
            url = "productManager.jsp";
        }
        if (search!=null) {
            products = product.findProductsByString(products,search);
        }
        List<Category> listC = dao.getAllCategories();
        session.setAttribute("listCC", listC);
        session.setAttribute("listP", products);
        request.setAttribute("endPage", endPage);
        request.setAttribute("tag", index);
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
        String action = request.getParameter("action");
        Product product = new Product();
        switch (action) {
            case "Add": //Add sản phẩm
                String name = request.getParameter("name");
                String priceString = request.getParameter("price");
                BigDecimal price = new BigDecimal(priceString);
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String description = request.getParameter("description");
                int category = Integer.parseInt(request.getParameter("category"));
                product = new Product(name, price, quantity, description, 0,dao.getCategoryById(category), (User) session.getAttribute("user"),"0");
                dao.addProduct(product);
                int product_id = dao.findProductId(product);
                //-------------------------------------------------------
        //        List<Part> imageParts = new ArrayList<>();
        //        Collection<Part> parts = request.getParts();
        //        for (Part part : parts) {
        //            if ("images".equals(part.getName())) {
        //                imageParts.add(part);
        //            }
        //        }
                //--------------------------------------------------------
                //-------------------------------------------------------------
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                List<Part> imageParts = new ArrayList<>();
                Collection<Part> parts = request.getParts();
                for (Part part : parts) {
                    if ("images".equals(part.getName())) {
                        imageParts.add(part);
                    }
                } // Retrieves <input type="file" name="image">
                for(Part filePart : imageParts){
                        String fileName = UUID.randomUUID().toString() + ".jpg"; // Generate random file name
                        String filePath = uploadPath + File.separator + fileName;
                        Path path = new File(filePath).toPath();
                        Files.copy(filePart.getInputStream(), path);
                        File file = new File(filePath);
                        BufferedImage image = ImageIO.read(file);
                        ByteArrayOutputStream baos = new ByteArrayOutputStream();
                        ImageIO.write(image, "png", baos);
                        byte[] imageData = baos.toByteArray();
                        //-------------------------------------------------------------
                        dao.addImage(product_id, imageData);
                }
                processRequest(request, response);
                break;
            case "Edit":
                int pid = Integer.parseInt(request.getParameter("pid"));
                Product productB = dao.getProductWithImagesByProductID(pid);
                String nameE = request.getParameter("name");
                String priceStringE = request.getParameter("price");
                BigDecimal priceE = new BigDecimal(priceStringE);
                int quantityE = Integer.parseInt(request.getParameter("quantity"));
                String descriptionE = request.getParameter("description");
                int categoryE = Integer.parseInt(request.getParameter("category"));
                Product productE = new Product(pid, nameE, priceE, quantityE, descriptionE, productB.getQuantitySold(), dao.getCategoryById(categoryE), productB.getUser(), productB.getStatus());
                dao.changeProduct(productE);
                processRequest(request, response);
                break;
            case "changeStatus":
                int productIdChangeStatus = Integer.parseInt(request.getParameter("product_id"));
                Product product_check = dao.getProductWithImagesByProductID(productIdChangeStatus);
                if("0".equals(product_check.getStatus())){
                    if(product_check.getQuantity()==0){
                        dao.changeStatusForProduct(product_check,"2");
                    }else{
                        dao.changeStatusForProduct(product_check,"1");
                    }
                }else{
                    dao.changeStatusForProduct(product_check, "0");
                }
                processRequest(request, response);
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
