package com.bopu.pojo;

import java.util.Date;

public class Letter {
    private Integer id;

    private String receiver;

    private String sender;

    private Date time;

    private Boolean readed;

    private String content;

    public Letter(Integer id, String receiver, String sender, Date time, Boolean readed, String content) {
        this.id = id;
        this.receiver = receiver;
        this.sender = sender;
        this.time = time;
        this.readed = readed;
        this.content = content;
    }

    public Letter() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender == null ? null : sender.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Boolean getReaded() {
        return readed;
    }

    public void setReaded(Boolean readed) {
        this.readed = readed;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}