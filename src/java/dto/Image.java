/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author Admin
 */
public class Image {
    private int image_id;
    private Product product;
    private String img;

    public Image() {
    }

    public Image(int image_id, Product product, String img) {
        this.image_id = image_id;
        this.product = product;
        this.img = img;
    }

    public Image(Product product, String img) {
        this.product = product;
        this.img = img;
    }

    public int getImage_id() {
        return image_id;
    }

    public void setImage_id(int image_id) {
        this.image_id = image_id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Image{" + "image_id=" + image_id + ", product=" + product + ", img=" + img + '}';
    }
    
}
