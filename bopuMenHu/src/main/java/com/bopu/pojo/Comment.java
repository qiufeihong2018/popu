package com.bopu.pojo;

import java.util.Date;

public class Comment {
    private Integer id;

    private Integer articleid;

    private String username;

    private Date time;

    private Integer flag;

    private String content;

    public Comment(Integer id, Integer articleid, String username, Date time, Integer flag, String content) {
        this.id = id;
        this.articleid = articleid;
        this.username = username;
        this.time = time;
        this.flag = flag;
        this.content = content;
    }

    public Comment() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getArticleid() {
        return articleid;
    }

    public void setArticleid(Integer articleid) {
        this.articleid = articleid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}