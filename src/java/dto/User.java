/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import dal.DAO;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class User {
    private int userId;
    private String username;
    private String password;
    private String name;
    private String email;
    private String address;
    private String phone;
    private String role;
    List<Review> reviews;
    List<OrderTable> orderTables;
    
    public User() {
    }

    public User(int userId, String username, String password, String name, String email, String address, String phone, String role) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.role = role;
    }
    
    public User(String username, String password, String name, String email, String address, String phone, String role) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.role = role;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getRole() {
        return role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
    
    public List<User> findUsersByString(List<User> userList, String searchString) {

        List<User> matchingUsers = new ArrayList<>();

        // Convert the search string to lowercase for case-insensitive search
        String lowerSearchString = searchString.toLowerCase();

        for (User user : userList) {
            if (containsString(user, lowerSearchString)) {
                matchingUsers.add(user);
            }
        }

        return matchingUsers;
    }
    public boolean containsString(User user, String searchString) {
        return String.valueOf(user.getUserId()).contains(searchString)
                || user.getUsername().toLowerCase().contains(searchString)
                || user.getName().toLowerCase().contains(searchString)
                || user.getEmail().toLowerCase().contains(searchString);
    }
    public int countProducts(){
        int count;
        DAO dao = new DAO();
        if("1".equals(this.role)){
            List<Product> products = dao.getAllProducts();
            count = products.size();
            return count;
        }else{
            List<Product> products = dao.getProductByUserID(userId);
            count = products.size();
            return count;
        }
    }
    public int countCustomers(){
        int count;
        DAO dao = new DAO();
        if("1".equals(this.role)){
            List<User> customers = dao.getAllCustomers();
            count = customers.size();
            return count;
        }else{
            return 0;
        }
    }
    public int countShippers(){
        int count;
        DAO dao = new DAO();
        if("1".equals(this.role)){
            List<User> shippers = dao.getAllShippers();
            count = shippers.size();
            return count;
        }else{
            return 0;
        }
    }
    public int countReviews(){
        DAO dao = new DAO();
        this.reviews = dao.getReviewsByUserOd(userId);
        return reviews.size();
    }
    public float averageReviews(){
        DAO dao = new DAO();
        this.reviews = dao.getReviewsByUserOd(userId);
        float a = 0;
        for(Review review : reviews){
            a += review.getRating();
        }
        a = a/reviews.size();
        return a;
    }
    public int countSoldProduct(){
        DAO dao = new DAO();
        this.orderTables = dao.getCountOrderTableForAdmin();
        int count = this.orderTables.size();
        return count;
    }
    public BigDecimal Revenue(){
        if("1".equals(this.role)){
            DAO dao = new DAO();
            this.orderTables = dao.getFinishedOrderTable();
            BigDecimal revenue = BigDecimal.valueOf(0);
            for(OrderTable orderTable:orderTables){
                for(OrderItem orderItem:orderTable.getOrderItems()){
                    revenue.add(orderItem.getPrice().multiply(BigDecimal.valueOf(0.1)));
                }
            }
            return revenue;
        }else{
            return BigDecimal.valueOf(0);
        }
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", username=" + username + ", password=" + password + ", name=" + name + ", email=" + email + ", address=" + address + ", phone=" + phone + ", role=" + role + '}';
    }
    
}
