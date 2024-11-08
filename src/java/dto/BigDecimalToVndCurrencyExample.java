/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Currency;

/**
 *
 * @author Admin
 */
public class BigDecimalToVndCurrencyExample {
    public static void main(String[] args) {
        BigDecimal number = new BigDecimal("1234.5678");
        BigDecimal roundedNumber = number.setScale(0, BigDecimal.ROUND_DOWN);

        System.out.println("Original Number: " + number);
        System.out.println("Rounded Number: " + roundedNumber);
    }
}