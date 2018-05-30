package com.bopu.pojo;

public class BoPuResult {

    private Integer status;
    private String message;
    private Object obj;

    public static BoPuResult ok(){
        return new BoPuResult(200, "ok");
    }

    public static BoPuResult build(Integer status,String message){
        return new BoPuResult(status, message);
    }

    public BoPuResult(Integer status, String message) {
        this.status = status;
        this.message = message;
    }


    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }
}
