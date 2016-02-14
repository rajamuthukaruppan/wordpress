package com.test;
 
import java.math.BigDecimal;
 
 
/**
 * Represents an item in inventory or in a shopping cart.
 */
public class Item {
    private Integer itemId;
    private String oemId;
    private String name;
    private String description;
    private String imageURL;
    private String color;
    private BigDecimal price;
    private BigDecimal length;
    private BigDecimal width;
    private BigDecimal height;
 
    /**
     * Weight in grams
     */
    private BigDecimal weight;
    /**
     * Quantity in stock.
     */
    private Integer stockQty;
     
    public Item() {
        super();
    }
 
    public Item(Integer id, String name) {
        this.name = name;
        this.itemId = id;
    }
     
    public Integer getItemId() {
        return itemId;
    }
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
    public String getOemId() {
        return oemId;
    }
    public void setOemId(String oemId) {
        this.oemId = oemId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }
    public String getImageURL() {
        return imageURL;
    }
    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
    public BigDecimal getPrice() {
        return price;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    public BigDecimal getLength() {
        return length;
    }
    public void setLength(BigDecimal length) {
        this.length = length;
    }
    public BigDecimal getWidth() {
        return width;
    }
    public void setWidth(BigDecimal width) {
        this.width = width;
    }
    public BigDecimal getHeight() {
        return height;
    }
    public void setHeight(BigDecimal height) {
        this.height = height;
    }
    public BigDecimal getWeight() {
        return weight;
    }
    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }
 
    public Integer getStockQty() {
        return stockQty;
    }
 
    public void setStockQty(Integer stockQty) {
        this.stockQty = stockQty;
    }
     
}
