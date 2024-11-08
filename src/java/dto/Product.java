/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import dal.DAO;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Product {
    private int productId;
    private String name;
    private BigDecimal price;
    private int quantity;
    private String description;
    private int quantitySold;
    private Category category;
    private User user;
    private String status;
    private List<Image> images;    
    private String image;
    private List<Review> reviews;
    
    public Product() {
    }

    public Product(int productId, String name, BigDecimal price, int quantity, String description, int quantitySold, Category category, User user, String status, List<Image> images) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.quantitySold = quantitySold;
        this.category = category;
        this.user = user;
        this.status = status;
        this.images = images;      
    }
     public Product(int productId, String name, BigDecimal price, int quantity, String description, int quantitySold, Category category, User user, String status, List<Image> images, String image) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.quantitySold = quantitySold;
        this.category = category;
        this.user = user;
        this.status = status;
        this.images = images;      
        this.image = image;
    }

    public Product(int productId, String name, BigDecimal price, int quantity, String description, int quantitySold, Category category, User user, String status) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.quantitySold = quantitySold;
        this.category = category;
        this.user = user;
        this.status = status;
    }

    public Product(String name, BigDecimal price, int quantity, String description, int quantitySold, Category category, User user, String status) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.quantitySold = quantitySold;
        this.category = category;
        this.user = user;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }
    
    public List<Product> findProductsByString(List<Product> productList, String searchString) {

        List<Product> matchingProducts = new ArrayList<>();

        // Convert the search string to lowercase for case-insensitive search
        String lowerSearchString = searchString.toLowerCase();

        for (Product product : productList) {
            if (containsString(product, lowerSearchString)) {
                matchingProducts.add(product);
            }
        }

        return matchingProducts;
    }
    public boolean containsString(Product product, String searchString) {
        return String.valueOf(product.getProductId()).contains(searchString)
                || product.getName().toLowerCase().contains(searchString);
    }
    public int countReviews(){
        DAO dao = new DAO();
        this.reviews = dao.getReviewsByProductId(productId);
        return reviews.size();
    }
    public float averageReviews(){
        DAO dao = new DAO();
        this.reviews = dao.getReviewsByProductId(productId);
        float a = 0;
        for(Review review : reviews){
            a += review.getRating();
        }
        a = a/reviews.size();
        return a;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", description=" + description + ", quantitySold=" + quantitySold + ", category=" + category + ", user=" + user + ", images=" + images + '}';
    }
    
    public List<Product> sortProductsByPriceAscending(List<Product> productList) {
        Collections.sort(productList, new Comparator<Product>() {
            @Override
            public int compare(Product p1, Product p2) {
                return p1.getPrice().compareTo(p2.getPrice());
            }
        });
        return productList;
    }
    
  public List<Product> sortProductsByPriceDescending(List<Product> productList) {
    Collections.sort(productList, new Comparator<Product>() {
        @Override
        public int compare(Product p1, Product p2) {
            return p2.getPrice().compareTo(p1.getPrice()); // Sắp xếp giảm dần
        }
    });
    return productList;
}
}
