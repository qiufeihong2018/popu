package com.bopu.pojo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
    private Integer id;

    private Integer articleid;

    private Integer userid;

    private Date time;

    private Integer flag;

    private String content;

    public Comment(Integer id, Integer articleid, Integer userid, Date time, Integer flag, String content) {
        this.id = id;
        this.articleid = articleid;
        this.userid = userid;
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

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getTime() {
        DateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        String t = df.format(time);
        return t;
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

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", articleid=" + articleid +
                ", userid=" + userid +
                ", time=" + getTime() +
                ", flag=" + flag +
                ", content='" + content + '\'' +
                '}';
    }
}