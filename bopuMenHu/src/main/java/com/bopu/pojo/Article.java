package com.bopu.pojo;

import java.util.Date;

public class Article {
    private Integer id;

    private String title;

    private Date time;

    private Integer count;

    private String author;

    private Integer type;

    private Integer flag;

    private Date limitdata;

    private String check;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Date getLimitdata() {
        return limitdata;
    }

    public void setLimitdata(Date limitdata) {
        this.limitdata = limitdata;
    }

    public String getCheck() {
        return check;
    }

    public void setCheck(String check) {
        this.check = check == null ? null : check.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}