/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Discount {
    private int id;
    private String code;
    private float discountPercent;
    private Date validFrom;
    private Date validTo;
    private String status;
    
    public Discount() {
    }

    public Discount(int id, String code, float discountPercent, Date validFrom, Date validTo, String status) {
        this.id = id;
        this.code = code;
        this.discountPercent = discountPercent;
        this.validFrom = validFrom;
        this.validTo = validTo;
        this.status = status;
    }
    
    public Discount(String code, float discountPercent, Date validFrom, Date validTo, String status) {
        this.code = code;
        this.discountPercent = discountPercent;
        this.validFrom = validFrom;
        this.validTo = validTo;
        this.status = status;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getCode() {
        return code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    
    public float getDiscountPercent() {
        return discountPercent;
    }
    
    public void setDiscountPercent(float discountPercent) {
        this.discountPercent = discountPercent;
    }
    
    public Date getValidFrom() {
        return validFrom;
    }
    
    public void setValidFrom(Date validFrom) {
        this.validFrom = validFrom;
    }
    
    public Date getValidTo() {
        return validTo;
    }
    
    public void setValidTo(Date validTo) {
        this.validTo = validTo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public List<Discount> findDiscountssByString(List<Discount> discountList, String searchString) {

        List<Discount> matchingDiscounts = new ArrayList<>();

        // Convert the search string to lowercase for case-insensitive search
        String lowerSearchString = searchString.toLowerCase();

        for (Discount discount : discountList) {
            if (containsString(discount, lowerSearchString)) {
                matchingDiscounts.add(discount);
            }
        }

        return matchingDiscounts;
    }
    public boolean containsString(Discount discount, String searchString) {
        return String.valueOf(discount.getDiscountPercent()).contains(searchString)
                || discount.getCode().toLowerCase().contains(searchString);
    }

    @Override
    public String toString() {
        return "dto.Discount[ id=" + id + " ]";
    }
    
}
