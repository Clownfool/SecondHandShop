package Controller;

import dal.DAO;
import dto.Product;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FilterByPriceController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String priceRange = request.getParameter("price");
        List<Product> listResult;

        switch (priceRange) {
            case "all":
                listResult = new DAO().getAllActiveProducts();
                break;
            case "below100":
                listResult = new DAO().filterProductByPrice(0, 100);
                break;
            case "below200":
                listResult = new DAO().filterProductByPrice(100, 200);
                break;
            case "below300":
                listResult = new DAO().filterProductByPrice(200, 300);
                break;
            case "below400":
                listResult = new DAO().filterProductByPrice(300, 400);
                break;
            case "below500":
                listResult = new DAO().filterProductByPrice(400, 500);
                break;
            default:
                throw new IllegalArgumentException("Invalid price range: " + priceRange);
        }

        request.setAttribute("priceRange", priceRange);
        request.setAttribute("listP", listResult);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
