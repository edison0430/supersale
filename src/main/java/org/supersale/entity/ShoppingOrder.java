package org.supersale.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import java.util.Date;

public class ShoppingOrder {


    public interface step1Validation {};

    public interface step2Validation {};

    private int orderId; //訂單編號

    private String productName; //商品名稱

    private int number;  //數量

    private int price;   //單價

    @NotNull(groups = {step1Validation.class}, message = "{payment}")
    private String payment; //付款方式

    private int memberId; //會員編號

    @NotEmpty(groups = {step2Validation.class}, message = "{name}")
    private String buyerName; //訂購人姓名

    @NotEmpty(groups = {step2Validation.class}, message = "{phone}")
    private String buyerPhone;  //訂購人手機

    @NotEmpty(groups = {step2Validation.class}, message = "{address}")
    private String buyerAddress;  //訂購人地址

    @NotEmpty(groups = {step2Validation.class}, message = "{name}")
    private String receiverName; //收件人姓名

    @NotEmpty(groups = {step2Validation.class}, message = "{phone}")
    private String receiverPhone; //收件人手機

    @NotEmpty(groups = {step2Validation.class}, message = "{address}")
    private String receiverAddress; //收件人地址

    private String remark; //備注

    private Date createTime; //購買時間


    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPayment() {
        return payment;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }

    public String getBuyerPhone() {
        return buyerPhone;
    }

    public void setBuyerPhone(String buyerPhone) {
        this.buyerPhone = buyerPhone;
    }

    public String getBuyerAddress() {
        return buyerAddress;
    }

    public void setBuyerAddress(String buyerAddress) {
        this.buyerAddress = buyerAddress;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "ShoppingOrder{" +
                "orderId=" + orderId +
                ", productName='" + productName + '\'' +
                ", number=" + number +
                ", price=" + price +
                ", payment='" + payment + '\'' +
                ", memberId=" + memberId +
                ", buyerName='" + buyerName + '\'' +
                ", buyerPhone='" + buyerPhone + '\'' +
                ", buyerAddress='" + buyerAddress + '\'' +
                ", receiverName='" + receiverName + '\'' +
                ", receiverPhone='" + receiverPhone + '\'' +
                ", receiverAddress='" + receiverAddress + '\'' +
                ", remark='" + remark + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
