/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


/**
 *
 * @author Raiku
 */
public class OrderTable {
    private int orderId;
    private String shipName;
    private String shipMail;
    private String shipPhone;
    private String shipAddress;
    private Timestamp orderDate;
    private BigDecimal shipFee;
    private Discount discount;
    private BigDecimal totalAmount;
    private String paymentMethod;
    private String status;
    private User customer;
    private User seller;
    private User shipper;
    private List<OrderItem> orderItems;
    
    public OrderTable() {
    }
    
    public OrderTable(int orderId) {
        this.orderId = orderId;
    }

    public OrderTable(int orderId, String shipName, String shipMail, String shipPhone, String shipAddress, Timestamp orderDate, BigDecimal shipFee, Discount discount, BigDecimal totalAmount, String paymentMethod, String status, User customer, User seller, User shipper, List<OrderItem> orderItems) {
        this.orderId = orderId;
        this.shipName = shipName;
        this.shipMail = shipMail;
        this.shipPhone = shipPhone;
        this.shipAddress = shipAddress;
        this.orderDate = orderDate;
        this.shipFee = shipFee;
        this.discount = discount;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.customer = customer;
        this.seller = seller;
        this.shipper = shipper;
        this.orderItems = orderItems;
    }

    public OrderTable(String shipName, String shipMail, String shipPhone, String shipAddress, Timestamp orderDate, BigDecimal shipFee, Discount discount, BigDecimal totalAmount, String paymentMethod, String status, User customer, User seller, User shipper, List<OrderItem> orderItems) {
        this.shipName = shipName;
        this.shipMail = shipMail;
        this.shipPhone = shipPhone;
        this.shipAddress = shipAddress;
        this.orderDate = orderDate;
        this.shipFee = shipFee;
        this.discount = discount;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.customer = customer;
        this.seller = seller;
        this.shipper = shipper;
        this.orderItems = orderItems;
    }

    public OrderTable(String shipName, String shipMail, String shipPhone, String shipAddress, Timestamp orderDate, BigDecimal shipFee, Discount discount, BigDecimal totalAmount, String paymentMethod, String status, User customer, User seller, User shipper) {
        this.shipName = shipName;
        this.shipMail = shipMail;
        this.shipPhone = shipPhone;
        this.shipAddress = shipAddress;
        this.orderDate = orderDate;
        this.shipFee = shipFee;
        this.discount = discount;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.customer = customer;
        this.seller = seller;
        this.shipper = shipper;
    }

    public OrderTable(String shipName, String shipMail, String shipPhone, String shipAddress, Timestamp orderDate, BigDecimal shipFee, Discount discount, String paymentMethod, String status, User customer) {
        this.shipName = shipName;
        this.shipMail = shipMail;
        this.shipPhone = shipPhone;
        this.shipAddress = shipAddress;
        this.orderDate = orderDate;
        this.shipFee = shipFee;
        this.discount = discount;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.customer = customer;
    }
    public OrderTable(int orderId, String shipName, String shipMail, String shipPhone, String shipAddress, Timestamp orderDate, BigDecimal shipFee, Discount discount, String paymentMethod, String status, User customer) {
        this.orderId = orderId;
        this.shipName = shipName;
        this.shipMail = shipMail;
        this.shipPhone = shipPhone;
        this.shipAddress = shipAddress;
        this.orderDate = orderDate;
        this.shipFee = shipFee;
        this.discount = discount;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.customer = customer;
    }

    public OrderTable(int orderId, String shipName, String shipMail, String shipPhone, String shipAddress, Timestamp orderDate, BigDecimal shipFee, Discount discount, BigDecimal totalAmount, String paymentMethod, String status, User customer, User seller, List<OrderItem> orderItems) {
        this.orderId = orderId;
        this.shipName = shipName;
        this.shipMail = shipMail;
        this.shipPhone = shipPhone;
        this.shipAddress = shipAddress;
        this.orderDate = orderDate;
        this.shipFee = shipFee;
        this.discount = discount;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.customer = customer;
        this.seller = seller;
        this.orderItems = orderItems;
    }

    

    public OrderTable(int orderId, String shipName, String shipMail, String shipPhone, String shipAddress, Timestamp orderDate, BigDecimal shipFee,Discount discount, BigDecimal totalAmount, String paymentMethod, String status, User customer, User seller) {
        this.orderId = orderId;
        this.shipName = shipName;
        this.shipMail = shipMail;
        this.shipPhone = shipPhone;
        this.shipAddress = shipAddress;
        this.orderDate = orderDate;
        this.shipFee = shipFee;
        this.discount = discount;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.customer = customer;
        this.seller = seller;
    }

    

    
    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
    
    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getShipName() {
        return shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName;
    }

    public String getShipMail() {
        return shipMail;
    }

    public void setShipMail(String shipMail) {
        this.shipMail = shipMail;
    }

    public String getShipPhone() {
        return shipPhone;
    }

    public void setShipPhone(String shipPhone) {
        this.shipPhone = shipPhone;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public BigDecimal getShipFee() {
        return shipFee;
    }

    public void setShipFee(BigDecimal shipFee) {
        this.shipFee = shipFee;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public User getSeller() {
        return seller;
    }

    public void setSeller(User seller) {
        this.seller = seller;
    }

    public User getShipper() {
        return shipper;
    }

    public void setShipper(User shipper) {
        this.shipper = shipper;
    }

    

    @Override
    public String toString() {
        return "dto.OrderTable[ orderId=" + orderId + " ]";
    }
    
}
