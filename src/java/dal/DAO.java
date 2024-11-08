package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Connect.DBconnect;
import dto.CartItem;
import dto.Category;
import dto.Chatroom;
import dto.Discount;
import dto.Image;
import dto.Message;
import dto.OrderItem;
import dto.OrderTable;
import dto.Product;
import dto.Review;
import dto.ShoppingCart;
import dto.User;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Base64;
import static java.util.Base64.getEncoder;
import java.util.Random;
import java.sql.Timestamp;

public class DAO extends DBconnect {

    public User checkExistUser(String username) throws SQLException {
        String queryString = "SELECT * FROM [user] WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public User checkExistGmail(String gmail) {
        String query = "SELECT * FROM [user] WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, gmail);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void doSignup(String username, String password, String name, String email, String address, String phone, String role) {
        String query = "INSERT INTO [user] (username, password, name, email, address, phone, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, email);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.setString(7, role);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User doLogin(String argUser, String argPass) {
        User user = null;
        String queryString = "SELECT * from  [user] WHERE (username = ? OR email = ?) AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setString(1, argUser);
            ps.setString(2, argUser);
            ps.setString(3, argPass);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                user = new User(result.getInt(1), result.getString(2), result.getString(3),
                        result.getString(4), result.getString(5), result.getString(6),
                        result.getString(7), result.getString(8));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return user;
    }

    public void changeProfile(String username, String password, String name, String phone, String address) {
        String queryString = "UPDATE [user] SET name = ?, phone = ?, address = ? WHERE username = ? AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setString(4, username);
            ps.setString(5, password);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void changePassword(int user_id, String passwordChange) {
        String queryString = "UPDATE [user] SET password = ? WHERE [user_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setString(1, passwordChange);
            ps.setInt(2, user_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public User getUserByID(int user_id) {
        User user = new User();
        String queryString = "SELECT * FROM [user] WHERE [user_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, user_id);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                user = new User(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getString(4),
                        result.getString(5),
                        result.getString(6),
                        result.getString(7),
                        result.getString(8)
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String queryString = "SELECT * from [user]";

        try (PreparedStatement ps = connection.prepareStatement(queryString); ResultSet result = ps.executeQuery()) {

            while (result.next()) {
                User user = new User(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getString(4),
                        result.getString(5),
                        result.getString(6),
                        result.getString(7),
                        result.getString(8)
                );
                list.add(user);
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }
        return list;
    }

    public List<User> getAllCustomers() {
        List<User> list = new ArrayList<>();
        String queryString = "SELECT * from [user] WHERE role = '2'";

        try (PreparedStatement ps = connection.prepareStatement(queryString); ResultSet result = ps.executeQuery()) {

            while (result.next()) {
                User user = new User(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getString(4),
                        result.getString(5),
                        result.getString(6),
                        result.getString(7),
                        result.getString(8)
                );
                list.add(user);
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }
        return list;
    }

    public List<User> getAllShippers() {
        List<User> list = new ArrayList<>();
        String queryString = "SELECT * from [user] WHERE role = '3'";

        try (PreparedStatement ps = connection.prepareStatement(queryString); ResultSet result = ps.executeQuery()) {

            while (result.next()) {
                User user = new User(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getString(4),
                        result.getString(5),
                        result.getString(6),
                        result.getString(7),
                        result.getString(8)
                );
                list.add(user);
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }
        return list;
    }

    public User checkEmailLogin(String email) {
        User user = null;
        String queryString = "SELECT * from  [user] WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setString(1, email);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                user = new User(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getString(4),
                        result.getString(5),
                        result.getString(6),
                        result.getString(7),
                        result.getString(8)
                );
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return user;
    }

    public boolean checkUsername(String username) {
        String queryString = "SELECT * from  [user] WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setString(1, username);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                return false;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return true;
    }

    public boolean checkEmail(String email) {
        String queryString = "SELECT * from  [user] WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setString(1, email);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                return false;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return true;
    }

    public boolean checkPhoneNumber(String phone) {
        String queryString = "SELECT * from  [user] WHERE phone = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setString(1, phone);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                return false;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return true;
    }

    public User checkForgotPasswordAccount(String argUser) {
        User user = null;
        String queryString = "SELECT * from  [user] WHERE username = ? OR email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setString(1, argUser);
            ps.setString(2, argUser);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                user = new User(
                        result.getInt(1),
                        result.getString(2),
                        result.getString(3),
                        result.getString(4),
                        result.getString(5),
                        result.getString(6),
                        result.getString(7),
                        result.getString(8)
                );
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return user;
    }

    public void deleteAccount(int user_id) {
        String queryString = "DELETE FROM [user] WHERE [user_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, user_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void deleteCategory(int category_id) {
        String queryString = "DELETE FROM [category] WHERE [category_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, category_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void deleteProduct(int product_id) {
        String queryString = "DELETE FROM [product] WHERE [product_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, product_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public List<Product> getProductByUserID(int id) {
        List<Product> list = new ArrayList<>();
        String queryString = "select * from product\n"
                + "where [user_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9),
                        getImagesByProductID(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Category getCategoryById(int categoryId) {
        Category category = null;
        String queryString = "SELECT * FROM category WHERE category_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                // Assuming the Category class has a constructor that accepts category_id and category_name
                category = new Category(id, name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String queryString = "SELECT * from category";

        try (PreparedStatement ps = connection.prepareStatement(queryString); ResultSet result = ps.executeQuery()) {

            while (result.next()) {
                Category category = new Category(
                        result.getInt(1),
                        result.getString(2)
                );
                list.add(category);
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Category> list = dao.getAllCategories();
        for (Category o : list) {
            System.out.println(o.getName());
        }
    }

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String queryString = "SELECT * from product";

        try (PreparedStatement ps = connection.prepareStatement(queryString); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9),
                        getImagesByProductID(rs.getInt(1))
                ));
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }
        return list;
    }

    public void addProduct(Product product) {
        String query = "INSERT INTO [product] (name, price, quantity, description, quantity_sold, category_id, user_id, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setBigDecimal(2, product.getPrice());
            ps.setInt(3, product.getQuantity());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getQuantitySold());
            ps.setInt(6, product.getCategory().getCategoryId());
            ps.setInt(7, product.getUser().getUserId());
            ps.setString(8, product.getStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int findProductId(Product product) {
        int product_id = 0;
        String query2 = "SELECT * FROM product WHERE name = ? AND price = ? AND quantity = ? AND description = ? AND quantity_sold = ? AND category_id = ? AND user_id = ? AND status = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query2);
            ps.setString(1, product.getName());
            ps.setBigDecimal(2, product.getPrice());
            ps.setInt(3, product.getQuantity());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getQuantitySold());
            ps.setInt(6, product.getCategory().getCategoryId());
            ps.setInt(7, product.getUser().getUserId());
            ps.setString(8, "0");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product_id = rs.getInt(1);
                return product_id;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product_id;
    }

    public void addImage(int product_id, byte[] imageData) {
        String query3 = "INSERT INTO image (product_id, img) VALUES (?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query3);
            ps.setInt(1, product_id);
            ps.setBytes(2, imageData);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getTotal(String tablename) {
        String query = "SELECT COUNT(*) FROM [" + tablename + "]";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalByUserId(String tablename, int user_id) {
        String query = "SELECT COUNT(*) FROM [" + tablename + "] WHERE [user_id] = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> pagingProducts(int index, int user_id) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM [product] where [user_id] = ?\n"
                + "ORDER BY [product_id]\n"
                + "OFFSET ? ROWS FETCH next 10 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setInt(2, (index - 1) * 10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9),
                        getImagesByProductID(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> pagingProducts9Rows(int index, int user_id) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM [product] where [user_id] = ?\n"
                + "ORDER BY [product_id]\n"
                + "OFFSET ? ROWS FETCH next 9 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.setInt(2, (index - 1) * 9);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9),
                        getImagesByProductID(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> pagingAllProducts(int index) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM [product]\n"
                + "ORDER BY [product_id]\n"
                + "OFFSET ? ROWS FETCH next 10 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9),
                        getImagesByProductID(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<User> pagingAccounts(int index) {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM [user]\n"
                + "ORDER BY [user_id]\n"
                + "OFFSET ? ROWS FETCH next 10 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Category> pagingCategories(int index) {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM [category]\n"
                + "ORDER BY [category_id]\n"
                + "OFFSET ? ROWS FETCH next 10 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Discount> pagingDiscounts(int index) {
        List<Discount> list = new ArrayList<>();
        String query = "SELECT * FROM [discount]\n"
                + "ORDER BY [id]\n"
                + "OFFSET ? ROWS FETCH next 10 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Discount(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6))
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductByProductID(int id) {
        Product p = new Product();
        String queryString = "select * from product\n"
                + "where [product_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9)
                );
            }
        } catch (Exception e) {
        }
        return p;
    }

    public Product getProductWithImagesByProductID(int id) {
        Product p = new Product();
        String queryString = "select * from product\n"
                + "where [product_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9),
                        getImagesByProductID(rs.getInt(1))
                );
            }
        } catch (Exception e) {
        }
        return p;
    }

    public List<Image> getImagesByProductID(int product_id) {
        List<Image> list = new ArrayList<>();
        String queryString = "select * from image\n"
                + "where [product_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, product_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                InputStream imageStream = rs.getBlob(3).getBinaryStream();
//                byte[] imageBytes = imageStream.readAllBytes();
//                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                byte[] imageBytes = rs.getBytes(3);
                list.add(new Image(rs.getInt(1), getProductByProductID(rs.getInt(2)), Base64.getEncoder().encodeToString(imageBytes)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteImagesByProductId(int product_id) {
        String queryString = "DELETE FROM [image] WHERE [product_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, product_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void createShoppingCart(int user_id) {
        String query = "INSERT INTO [Shopping_cart] (user_id) VALUES (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ShoppingCart getShoppingCartByUserID(int user_id) {
        ShoppingCart shoppingCart = null;
        DAO dao = new DAO();
        String query = "SELECT * FROM [Shopping_cart] WHERE [user_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                shoppingCart = (new ShoppingCart(rs.getInt(1), dao.getUserByID(rs.getInt(2)), getCartItemsByCartID(rs.getInt(1))));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shoppingCart;
    }

    public ShoppingCart getShoppingCartByCartID(int cart_id) {
        ShoppingCart shoppingCart = null;
        DAO dao = new DAO();
        String query = "SELECT * FROM [Shopping_cart] WHERE [cart_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cart_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                shoppingCart = (new ShoppingCart(rs.getInt(1), dao.getUserByID(rs.getInt(2))));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shoppingCart;
    }

    public List<CartItem> getCartItemsByCartID(int cart_id) {
        List<CartItem> list = new ArrayList<>();
        DAO dao = new DAO();
        String query = "SELECT * FROM [cart_item] WHERE [cart_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cart_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add((new CartItem(rs.getInt(1),
                        rs.getInt(2),
                        dao.getProductWithImagesByProductID(rs.getInt(3)),
                        getShoppingCartByCartID(rs.getInt(4)),
                        rs.getBigDecimal(5).setScale(1, BigDecimal.ROUND_DOWN))));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public CartItem getCartItemByCartItemID(int cart_item_id) {
        CartItem cartItem = new CartItem();
        DAO dao = new DAO();
        String query = "SELECT * FROM [cart_item] WHERE [cart_item_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cart_item_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cartItem = new CartItem(rs.getInt(1),
                        rs.getInt(2),
                        dao.getProductWithImagesByProductID(rs.getInt(3)),
                        getShoppingCartByCartID(rs.getInt(4)),
                        rs.getBigDecimal(5).setScale(1, BigDecimal.ROUND_DOWN));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItem;
    }

    public void addToCart(CartItem cartItem) {
        String query = "INSERT INTO [cart_item] (quantity, product_id, cart_id, price) VALUES (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cartItem.getQuantity());
            ps.setInt(2, cartItem.getProduct().getProductId());
            ps.setInt(3, cartItem.getCart().getCartId());
            ps.setBigDecimal(4, cartItem.getProduct().getPrice());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addToSimiliarCart(CartItem cartItem, int quantity, BigDecimal price) {
        String query = "UPDATE [cart_item] SET quantity = ?, price = ? WHERE [cart_item_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setBigDecimal(2, price);
            ps.setInt(3, cartItem.getCartItemId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCartItem(int cart_item_id) {
        String queryString = "DELETE FROM [cart_item] WHERE [cart_item_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, cart_item_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public Discount getDiscountByCode(String code) {
        Discount discount = new Discount();
        DAO dao = new DAO();
        String query = "SELECT * FROM [discount] WHERE [code] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                discount = new Discount(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discount;
    }

    public void createOrderTable(OrderTable orderTable) {
        String query = "INSERT INTO [platform_online].[dbo].[order_table] "
                + "([order_id], [ship_name], [ship_mail], [ship_phone], [ship_address], [order_date], "
                + "[ship_fee], [discount_code], [total_amount], [payment_method], [status], [user_id], "
                + "[seller_id]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderTable.getOrderId());
            ps.setString(2, orderTable.getShipName());
            ps.setString(3, orderTable.getShipMail());
            ps.setString(4, orderTable.getShipPhone());
            ps.setString(5, orderTable.getShipAddress());
            ps.setTimestamp(6, orderTable.getOrderDate());
            ps.setBigDecimal(7, orderTable.getShipFee());
            ps.setString(8, orderTable.getDiscount().getCode());
            ps.setBigDecimal(9, orderTable.getTotalAmount());
            ps.setString(10, orderTable.getPaymentMethod());
            ps.setString(11, orderTable.getStatus());
            ps.setInt(12, orderTable.getCustomer().getUserId());
            ps.setInt(13, orderTable.getSeller().getUserId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addOrderItemToOrderTable(OrderItem orderItem) {
        String query3 = "INSERT INTO order_item ([quantity], [order_id], [product_id], [price]) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query3);
            ps.setInt(1, orderItem.getQuantity());
            ps.setInt(2, orderItem.getOrderTable().getOrderId());
            ps.setInt(3, orderItem.getProduct().getProductId());
            ps.setBigDecimal(4, orderItem.getPrice());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int randomOrderID(String tablename) {
        int i = 0;
        Random r = new Random();
        try {
            while (true) {
                i = r.nextInt(1000);
                String sqlQuery = "SELECT * FROM " + tablename + " WHERE order_id=?";
                PreparedStatement ps = connection.prepareStatement(sqlQuery);
                ps.setString(1, String.valueOf(i));
                ResultSet result = ps.executeQuery();
                if (!result.next()) {
                    return i;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public int randomProductID() {
        Random r = new Random();
        int i;
        try {
            while (true) {
                i = r.nextInt(1000);
                String sqlQuery = "SELECT COUNT(*) AS count FROM product WHERE product_id = ?";
                PreparedStatement ps = connection.prepareStatement(sqlQuery);
                ps.setInt(1, i);
                ResultSet result = ps.executeQuery();
                if (result.next() && result.getInt("count") == 0) {
                    return i;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // Trả về -1 nếu không tìm thấy ID hợp lệ sau một số lần thử
    }

    public OrderTable getOrderTableByOrderIdWithoutOrderItems(int order_id) {
        DAO dao = new DAO();
        OrderTable orderTable = new OrderTable();
        String queryString = "SELECT [order_id], [ship_name], [ship_mail], [ship_phone], [ship_address], "
                + "[order_date], [ship_fee], [discount_code], [total_amount], [payment_method], [status], "
                + "[user_id], [seller_id] "
                + "FROM [platform_online].[dbo].[order_table] "
                + "WHERE [order_id] = ? "
                + "ORDER BY order_date DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, order_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderTable = new OrderTable(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        rs.getBigDecimal(7).setScale(1, BigDecimal.ROUND_DOWN),
                        dao.getDiscountByCode(rs.getString(8)),
                        rs.getBigDecimal(9).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getString(10),
                        rs.getString(11),
                        dao.getUserByID(rs.getInt(12)),
                        dao.getUserByID(rs.getInt(13))
                );
            }
        } catch (Exception e) {
        }
        return orderTable;
    }

    public OrderTable getOrderTableByOrderIdWithOrderItems(int order_id) {
        DAO dao = new DAO();
        OrderTable orderTable = new OrderTable();
        String queryString = "SELECT [order_id], [ship_name], [ship_mail], [ship_phone], [ship_address], "
                + "[order_date], [ship_fee], [discount_code], [total_amount], [payment_method], [status], "
                + "[user_id], [seller_id] "
                + "FROM [platform_online].[dbo].[order_table] "
                + "WHERE [order_id] = ? "
                + "ORDER BY order_date DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, order_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderTable = new OrderTable(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        rs.getBigDecimal(7).setScale(1, BigDecimal.ROUND_DOWN),
                        dao.getDiscountByCode(rs.getString(8)),
                        rs.getBigDecimal(9).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getString(10),
                        rs.getString(11),
                        dao.getUserByID(rs.getInt(12)),
                        dao.getUserByID(rs.getInt(13)),
                        dao.getOrderItemsByOrderId(rs.getInt(1))
                );
            }
        } catch (Exception e) {
        }
        return orderTable;
    }

    public List<OrderItem> getOrderItemsByOrderId(int order_id) {
        DAO dao = new DAO();
        List<OrderItem> orderItems = new ArrayList<>();
        String queryString = "SELECT [order_item_id], [quantity], [order_id], [product_id], [price] "
                + "FROM [platform_online].[dbo].[order_item] "
                + "WHERE [order_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, order_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderItems.add(new OrderItem(rs.getInt(1),
                        rs.getInt(2),
                        dao.getOrderTableByOrderIdWithoutOrderItems(rs.getInt(3)),
                        rs.getBigDecimal(5).setScale(0, BigDecimal.ROUND_DOWN),
                        dao.getProductWithImagesByProductID(rs.getInt(4))));
            }
        } catch (Exception e) {
        }
        return orderItems;
    }

    public List<OrderTable> getOrderTableByCustomerID(int customer_id) {
        DAO dao = new DAO();
        List<OrderTable> orderTables = new ArrayList<>();
        String queryString = "SELECT * "
                + "FROM [platform_online].[dbo].[order_table] "
                + "WHERE [user_id] = ? "
                + "ORDER BY order_date DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, customer_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderTables.add(new OrderTable(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        rs.getBigDecimal(7).setScale(1, BigDecimal.ROUND_DOWN),
                        dao.getDiscountByCode(rs.getString(8)),
                        rs.getBigDecimal(9).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getString(10),
                        rs.getString(11),
                        getUserByID(rs.getInt(12)),
                        getUserByID(rs.getInt(13)),
                        dao.getOrderItemsByOrderId(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
        }
        return orderTables;
    }

    public void changeStatusForProduct(Product product, String status) {
        String query = "UPDATE [product] SET status = ? WHERE [product_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, product.getProductId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Product> getAllActiveProducts() {
        List<Product> list = new ArrayList<>();
        String queryString = "SELECT * from product WHERE status = '1'";

        try (PreparedStatement ps = connection.prepareStatement(queryString); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(0, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9),
                        getImagesByProductID(rs.getInt(1))
                ));
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> pagingAllActiveProducts9Rows(int index) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM [product] WHERE status = '1'\n"
                + "ORDER BY [product_id]\n"
                + "OFFSET ? ROWS FETCH next 9 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 9);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setProductId(rs.getInt(1));  // Assuming column 1 is productId
                product.setName(rs.getString(2));  // Assuming column 2 is name
                product.setPrice(rs.getBigDecimal(3).setScale(1, BigDecimal.ROUND_DOWN));  // Column 3 is price
                product.setQuantity(rs.getInt(4));  // Column 4 is quantity
                product.setDescription(rs.getString(5));  // Column 5 is description
                product.setQuantitySold(rs.getInt(6));  // Column 6 is quantitySold

                Category category = getCategoryById(rs.getInt(7));  // Column 7 is categoryId
                User user = getUserByID(rs.getInt(8));  // Column 8 is userId

                product.setCategory(category);  // Set the category
                product.setUser(user);  // Set the user

                product.setStatus(rs.getString(9));               
                product.setImage(rs.getString(10));
                list.add(product);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<OrderTable> getAllOrderTableForShipper() {
        DAO dao = new DAO();
        List<OrderTable> orderTables = new ArrayList<>();
        String queryString = "SELECT * "
                + "FROM [platform_online].[dbo].[order_table] "
                + "WHERE status = '2'";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderTables.add(new OrderTable(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        rs.getBigDecimal(7).setScale(1, BigDecimal.ROUND_DOWN),
                        dao.getDiscountByCode(rs.getString(8)),
                        rs.getBigDecimal(9).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getString(10),
                        rs.getString(11),
                        getUserByID(rs.getInt(12)),
                        getUserByID(rs.getInt(13)),
                        dao.getOrderItemsByOrderId(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
        }
        return orderTables;
    }

    public List<OrderTable> getAllOrderTableForAdmin() {
        DAO dao = new DAO();
        List<OrderTable> orderTables = new ArrayList<>();
        String queryString = "SELECT * "
                + "FROM [platform_online].[dbo].[order_table] ";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderTables.add(new OrderTable(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        rs.getBigDecimal(7).setScale(1, BigDecimal.ROUND_DOWN),
                        dao.getDiscountByCode(rs.getString(8)),
                        rs.getBigDecimal(9).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getString(10),
                        rs.getString(11),
                        getUserByID(rs.getInt(12)),
                        getUserByID(rs.getInt(13)),
                        dao.getOrderItemsByOrderId(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
        }
        return orderTables;
    }

    public List<OrderTable> getCountOrderTableForAdmin() {
        DAO dao = new DAO();
        List<OrderTable> orderTables = new ArrayList<>();
        String queryString = "SELECT [order_id] "
                + "FROM [platform_online].[dbo].[order_table] ";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderTables.add(new OrderTable(rs.getInt(1)));
            }
        } catch (Exception e) {
        }
        return orderTables;
    }

    public List<OrderTable> getFinishedOrderTable() {
        DAO dao = new DAO();
        List<OrderTable> orderTables = new ArrayList<>();
        String queryString = "SELECT * "
                + "FROM [platform_online].[dbo].[order_table] "
                + "WHERE status = '4'";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderTables.add(new OrderTable(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        rs.getBigDecimal(7).setScale(1, BigDecimal.ROUND_DOWN),
                        dao.getDiscountByCode(rs.getString(8)),
                        rs.getBigDecimal(9).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getString(10),
                        rs.getString(11),
                        getUserByID(rs.getInt(12)),
                        getUserByID(rs.getInt(13)),
                        dao.getOrderItemsByOrderId(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
        }
        return orderTables;
    }

    public List<OrderTable> getOrderTableBySellerId(int seller_id) {
        DAO dao = new DAO();
        List<OrderTable> orderTables = new ArrayList<>();
        String queryString = "SELECT * "
                + "FROM [platform_online].[dbo].[order_table] "
                + "WHERE [seller_id] = ? AND status = '1' "
                + "ORDER BY order_date DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, seller_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderTables.add(new OrderTable(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        rs.getBigDecimal(7).setScale(1, BigDecimal.ROUND_DOWN),
                        dao.getDiscountByCode(rs.getString(8)),
                        rs.getBigDecimal(9).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getString(10),
                        rs.getString(11),
                        getUserByID(rs.getInt(12)),
                        getUserByID(rs.getInt(13)),
                        dao.getOrderItemsByOrderId(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
        }
        return orderTables;
    }

    public void changeStatusForOrderTable(String status, int order_id) {
        String query = "UPDATE [order_table] SET status = ? WHERE [order_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, order_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void changeStatusAndShipperForOrderTable(String status, int shipper_id, int order_id) {
        String query = "UPDATE [order_table] SET status = ?, shipper_id = ? WHERE [order_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, shipper_id);
            ps.setInt(3, order_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteShoppingCart(int cart_id) {
        String queryString = "DELETE FROM [shopping_cart] WHERE [cart_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, cart_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void deleteCartItemByCartId(int cart_id) {
        String queryString = "DELETE FROM [cart_item] WHERE [cart_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, cart_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void changeProductQuantity(Product product, int new_quantity, int quantity_sold, String status) {
        String query = "UPDATE [product] SET quantity = ?, quantity_sold = ?, status = ? WHERE [product_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, new_quantity);
            ps.setInt(2, quantity_sold);
            ps.setString(3, status);
            ps.setInt(4, product.getProductId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<OrderTable> getOrderTableByShipperId(int shipper_id) {
        DAO dao = new DAO();
        List<OrderTable> orderTables = new ArrayList<>();
        String queryString = "SELECT * "
                + "FROM [platform_online].[dbo].[order_table] "
                + "WHERE [shipper_id] = ? AND (status = '3' OR status = '4') "
                + "ORDER BY order_date DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, shipper_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderTables.add(new OrderTable(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        rs.getBigDecimal(7).setScale(1, BigDecimal.ROUND_DOWN),
                        dao.getDiscountByCode(rs.getString(8)),
                        rs.getBigDecimal(9).setScale(1, BigDecimal.ROUND_DOWN),
                        rs.getString(10),
                        rs.getString(11),
                        getUserByID(rs.getInt(12)),
                        getUserByID(rs.getInt(13)),
                        dao.getOrderItemsByOrderId(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
        }
        return orderTables;
    }

    public void addReview(Review review) {
        String query = "INSERT INTO [platform_online].[dbo].[review] "
                + "([rating], [comment], [ratingDate], [user_id], [product_id]) "
                + "VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setFloat(1, review.getRating());
            ps.setString(2, review.getComment());
            ps.setTimestamp(3, review.getDate());
            ps.setInt(4, review.getUser().getUserId());
            ps.setInt(5, review.getProduct().getProductId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Review> getAllReviews() {
        DAO dao = new DAO();
        List<Review> list = new ArrayList<>();
        String queryString = "SELECT * from review";

        try (PreparedStatement ps = connection.prepareStatement(queryString); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Review review = new Review(rs.getInt(1),
                        rs.getFloat(2),
                        rs.getString(3),
                        rs.getTimestamp(4),
                        dao.getUserByID(rs.getInt(5)),
                        dao.getProductWithImagesByProductID(rs.getInt(6))
                );
                list.add(review);
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }
        return list;
    }

    public List<Review> getReviewsByProductId(int product_id) {
        DAO dao = new DAO();
        List<Review> list = new ArrayList<>();
        String queryString = "SELECT * from review WHERE product_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, product_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review review = new Review(rs.getInt(1),
                        rs.getFloat(2),
                        rs.getString(3),
                        rs.getTimestamp(4),
                        dao.getUserByID(rs.getInt(5)),
                        dao.getProductWithImagesByProductID(rs.getInt(6))
                );
                list.add(review);
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }
        return list;
    }

    public List<Review> getReviewsByUserOd(int user_id) {
        DAO dao = new DAO();
        List<Review> list = new ArrayList<>();
        String queryString = "SELECT * from review WHERE user_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review review = new Review(rs.getInt(1),
                        rs.getFloat(2),
                        rs.getString(3),
                        rs.getTimestamp(4),
                        dao.getUserByID(rs.getInt(5)),
                        dao.getProductWithImagesByProductID(rs.getInt(6))
                );
                list.add(review);
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }
        return list;
    }

    public void addChatRoom(int user1_id, int user2_id) {
        String query = "INSERT INTO [chatroom] ( user1Id, [user2Id]) VALUES (?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user1_id);
            ps.setInt(2, user2_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Message> getChatMessages(int roomId) {
        List<Message> chatMessages = new ArrayList<>();
        try {
            // Prepare the SQL statement for retrieving chat messages
            String sql = "SELECT * FROM [platform_online].[dbo].[message] "
                    + "WHERE roomId = ? "
                    + "ORDER BY timestamp ASC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roomId);

            // Execute the SQL statement
            ResultSet rs = ps.executeQuery();

            // Process the result set and populate the chat messages
            while (rs.next()) {
                int messageId = rs.getInt(1);
                int senderId = rs.getInt(2);
                String senderName = rs.getString(3);
                String content = rs.getString(4);
                Timestamp timestamp = rs.getTimestamp(5);
                int roomID = rs.getInt(6);

                Message message = new Message(messageId, senderId, senderName, content, timestamp, getChatRoomByRoomId(roomID));
                chatMessages.add(message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chatMessages;
    }

    public Chatroom getChatRoomByRoomId(int roomID) {
        Chatroom chatroom = null;
        DAO dao = new DAO();
        try {
            String sql = "SELECT * FROM [platform_online].[dbo].[chatroom] "
                    + "WHERE [roomId] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roomID);

            // Execute the SQL statement
            ResultSet rs = ps.executeQuery();

            // Process the result set and populate the chat messages
            while (rs.next()) {
                chatroom = new Chatroom(rs.getInt(1), dao.getUserByID(rs.getInt(2)), dao.getUserByID(rs.getInt(3)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chatroom;
    }

    public Chatroom getChatRoomByUsersId(Chatroom chatroom) {
        Chatroom o = null;
        DAO dao = new DAO();
        try {
            String sql = "SELECT * FROM [platform_online].[dbo].[chatroom] "
                    + "WHERE ([user1Id] = ? AND [user2Id] = ? ) OR ([user1Id] = ? AND [user2Id] = ? ) ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, chatroom.getUser1().getUserId());
            ps.setInt(2, chatroom.getUser2().getUserId());
            ps.setInt(3, chatroom.getUser2().getUserId());
            ps.setInt(4, chatroom.getUser1().getUserId());

            // Execute the SQL statement
            ResultSet rs = ps.executeQuery();

            // Process the result set and populate the chat messages
            while (rs.next()) {
                o = new Chatroom(rs.getInt(1),
                        dao.getUserByID(rs.getInt(2)),
                        dao.getUserByID(rs.getInt(3)),
                        dao.getChatMessages(rs.getInt(1)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
    }

    public List<Chatroom> getChatRoomsByUserId(int user_id) {
        List<Chatroom> chatrooms = new ArrayList<>();
        DAO dao = new DAO();
        try {
            String sql = "SELECT * FROM [platform_online].[dbo].[chatroom] "
                    + "WHERE [user1Id] = ? OR [user2Id] = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, user_id);

            // Execute the SQL statement
            ResultSet rs = ps.executeQuery();

            // Process the result set and populate the chat messages
            while (rs.next()) {
                chatrooms.add(new Chatroom(rs.getInt(1), dao.getUserByID(rs.getInt(2)), dao.getUserByID(rs.getInt(3)), dao.getChatMessages(rs.getInt(1))));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chatrooms;
    }

    public void addMessage(Message message) {
        String query = "INSERT INTO [message] (senderId, senderName, content, timestamp, roomId) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, message.getSenderId());
            ps.setString(2, message.getSenderName());
            ps.setString(3, message.getContent());
            ps.setTimestamp(4, message.getTimestamp());
            ps.setInt(5, message.getChatroom().getRoomId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Product> getRandomProduct() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT TOP 8 * FROM product ORDER BY NEWID()";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            //ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(0, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9),
                        getImagesByProductID(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> filterProductByPrice(int start, int end) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE price > ? AND price <= ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(0, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9),
                        getImagesByProductID(rs.getInt(1))
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getActiveProductsByCategoryId(int category_id) {
        List<Product> list = new ArrayList<>();
        String queryString = "SELECT * from product WHERE status = '1' AND category_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setInt(1, category_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getBigDecimal(3).setScale(0, BigDecimal.ROUND_DOWN),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        getCategoryById(rs.getInt(7)),
                        getUserByID(rs.getInt(8)),
                        rs.getString(9),
                        getImagesByProductID(rs.getInt(1))
                ));
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }
        return list;
    }

    public void changeProduct(Product product) {
        String queryString = "UPDATE [product] SET name = ?, price = ?, quantity = ?, description = ?, category_id = ? WHERE product_id = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(queryString);
            ps.setString(1, product.getName());
            ps.setBigDecimal(2, product.getPrice());
            ps.setInt(3, product.getQuantity());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getCategory().getCategoryId());
            ps.setInt(6, product.getProductId());
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public List<Discount> getDiscountByDate() {
        List<Discount> discounts = new ArrayList<>();
        String query = "SELECT * "
                + "FROM [platform_online].[dbo].[discount] "
                + "WHERE ? <= valid_to";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            Timestamp today = new Timestamp(System.currentTimeMillis());
            ps.setTimestamp(1, today);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                discounts.add(new Discount(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discounts;
    }

    public List<Product> getProductsByPriceRange(BigDecimal minPrice, BigDecimal maxPrice) {
        List<Product> products = new ArrayList<>();
        String queryString = "SELECT * FROM product WHERE price >= ? AND price <= ?";

        try (PreparedStatement ps = connection.prepareStatement(queryString)) {
            ps.setBigDecimal(1, minPrice);
            ps.setBigDecimal(2, maxPrice);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(new Product(rs.getInt(1),
                            rs.getString(2),
                            rs.getBigDecimal(3).setScale(1, BigDecimal.ROUND_DOWN),
                            rs.getInt(4),
                            rs.getString(5),
                            rs.getInt(6),
                            getCategoryById(rs.getInt(7)),
                            getUserByID(rs.getInt(8)),
                            rs.getString(9),
                            getImagesByProductID(rs.getInt(1))
                    ));
                }
            }
        } catch (SQLException e) {
            // Handle the exception according to your application's requirements
            e.printStackTrace();
        }

        return products;
    }
}
