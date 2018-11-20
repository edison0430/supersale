package org.supersale.dto;

//AJAX Request所返回的JSON Result
public class SuperSaleResult<T> {

    private boolean success;

    private T data;

    private String error;

    //成功時回傳JSON結果
    public SuperSaleResult(boolean success, T data) {
        this.success = success;
        this.data = data;
    }

    //失敗時回傳錯誤訊息
    public SuperSaleResult(boolean success, String error) {
        this.success = success;
        this.error = error;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
