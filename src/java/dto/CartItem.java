/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.math.BigDecimal;

public class CartItem {
    private int cartItemId;
    private int quantity;
    private Product product;
    private ShoppingCart cart;
    private BigDecimal price;
    
    public CartItem() {
    }

    public CartItem(int cartItemId, int quantity, Product product, ShoppingCart cart, BigDecimal price) {
        this.cartItemId = cartItemId;
        this.quantity = quantity;
        this.product = product;
        this.cart = cart;
        this.price = price;
    }
    
    public CartItem(int quantity, Product product, ShoppingCart cart, BigDecimal price) {
        this.quantity = quantity;
        this.product = product;
        this.cart = cart;
        this.price = price;
    }

    public CartItem(int quantity, Product product, BigDecimal price) {
        this.quantity = quantity;
        this.product = product;
        this.price = price;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ShoppingCart getCart() {
        return cart;
    }

    public void setCart(ShoppingCart cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return "dto.CartItem[ cartItemId=" + cartItemId + " ]";
    }
    
}
