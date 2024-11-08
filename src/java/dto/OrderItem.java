/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class OrderItem implements Serializable{
    private int orderItemId;
    private int quantity;
    private OrderTable orderTable;
    private BigDecimal price;
    private Product product;
    
    public OrderItem() {
        super();
    }

    public OrderItem(int orderItemId, int quantity, BigDecimal price, Product product) {
        this.orderItemId = orderItemId;
        this.quantity = quantity;
        this.price = price;
        this.product = product;
    }

    public OrderItem(int orderItemId, int quantity, OrderTable orderTable, BigDecimal price, Product product) {
        this.orderItemId = orderItemId;
        this.quantity = quantity;
        this.orderTable = orderTable;
        this.price = price;
        this.product = product;
    }

    public OrderItem(int quantity, OrderTable orderTable, BigDecimal price, Product product) {
        this.quantity = quantity;
        this.orderTable = orderTable;
        this.price = price;
        this.product = product;
    }

    public OrderItem(int quantity, BigDecimal price, Product product) {
        this.quantity = quantity;
        this.price = price;
        this.product = product;
    }
    

    public OrderTable getOrderTable() {
        return orderTable;
    }

    public void setOrderTable(OrderTable orderTable) {
        this.orderTable = orderTable;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    

    @Override
    public String toString() {
        return "dto.OrderItem[ orderItemId=" + orderItemId + " ]";
    }
    
}
