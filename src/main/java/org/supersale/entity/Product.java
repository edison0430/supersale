package org.supersale.entity;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import javax.validation.constraints.NotNull;
import java.util.Date;

public class Product {

    private int productId;

    @NotEmpty(message = "{product.name}")
    private String name;

    @NotNull(message = "{product.number}")
    @Range(min=0, max=999999, message = "{product.number.range}")
    private Integer number;

    @NumberFormat(pattern = "#,###,###")
    @NotNull(message = "{product.price}")
    @Range(min=0, max=999999999, message = "{product.price.range}")
    private Integer price;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @NotNull(message = "{product.time}")
    private Date startTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @NotNull(message = "{product.time}")
    private Date endTime;

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

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", name='" + name + '\'' +
                ", number=" + number +
                ", price=" + price +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }
}
