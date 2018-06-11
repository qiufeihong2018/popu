package com.bopu.pojo;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

    private String look;

    private String content;

    public Article(Integer id, String title, Date time, Integer count, String author, Integer type, Integer flag, Date limitdata, String look, String content) {
        this.id = id;
        this.title = title;
        this.time = time;
        this.count = count;
        this.author = author;
        this.type = type;
        this.flag = flag;
        this.limitdata = limitdata;
        this.look = look;
        this.content = content;
    }

    public Article() {
        super();
    }

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

    public String getTime() {
        if (time == null) {
            return "";
        }
        DateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        String t = df.format(time);
        return t;
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

    public String getLimitdata() {
        if (limitdata == null) {
            return "";
        }
        DateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        String t = df.format(limitdata);
        return t;
    }

    public void setLimitdata(Date limitdata) {
        this.limitdata = limitdata;
    }

    public String getLook() {
        return look;
    }

    public void setLook(String look) {
        this.look = look == null ? null : look.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", time=" + time +
                ", count=" + count +
                ", author='" + author + '\'' +
                ", type=" + type +
                ", flag=" + flag +
                ", limitdata=" + limitdata +
                ", look='" + look + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}