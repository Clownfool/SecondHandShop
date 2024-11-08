/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import dal.DAO;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author Raiku
 */
public class ShoppingCart {
    private int cartId;
    private User user;
    private List<CartItem> cartItems; 
    
    public ShoppingCart() {
    }

    public ShoppingCart(int cartId, User user) {
        this.cartId = cartId;
        this.user = user;
    }
    
    public ShoppingCart(int cartId, User user, List<CartItem> cartItems) {
        this.cartId = cartId;
        this.user = user;
        this.cartItems = cartItems;
    }
    
    public ShoppingCart(User user, List<CartItem> cartItems) {
        this.user = user;
        this.cartItems = cartItems;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }
    
    public int getCartId() {
        return cartId;
    }
    
    public void setCartId(int cartId) {
        this.cartId = cartId;
    }
    
    public User getUser() {
        return user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    
    public BigDecimal totalPrice(){
        BigDecimal totalPrice = BigDecimal.valueOf(0);
        for(CartItem cartItem:cartItems){
            totalPrice = totalPrice.add(cartItem.getPrice());
        }
        totalPrice = totalPrice.add(BigDecimal.valueOf(10*countUniqueSellers()));
        return totalPrice;
    }
    
    public int totalQuantity(){
        int totalQuantity = 0;
        for(CartItem cartItem:cartItems){
            totalQuantity += cartItem.getQuantity();
        }
        return totalQuantity;
    }
    
    public int countUniqueSellers() {
        Set<Integer> uniqueSellers = new HashSet<>();
        for (CartItem cartItem:cartItems) {
            uniqueSellers.add(cartItem.getProduct().getUser().getUserId());
        }

        return uniqueSellers.size();
    }
    
    @Override
    public String toString() {
        return "dto.ShoppingCart[ cartId=" + cartId + " ]";
    }
}
