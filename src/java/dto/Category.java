/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.util.ArrayList;
import java.util.List;

public class Category {
    private int categoryId;
    private String name;

    public Category() {
    }

    public Category(int categoryId, String name) {
        this.categoryId = categoryId;
        this.name = name;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Category> findCategoriesByString(List<Category> categoryList, String searchString) {

        List<Category> matchCategoryList = new ArrayList<>();

        // Convert the search string to lowercase for case-insensitive search
        String lowerSearchString = searchString.toLowerCase();

        for (Category category : categoryList) {
            if (containsString(category, lowerSearchString)) {
                matchCategoryList.add(category);
            }
        }

        return matchCategoryList;
    }
    public boolean containsString(Category category, String searchString) {
        return String.valueOf(category.getName()).contains(searchString);
    }

    @Override
    public String toString() {
        return "dto.Category[ categoryId=" + categoryId + " ]";
    }
    
}
