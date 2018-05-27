package com.bopu.pojo;

import java.util.Date;

public class Content {
    private Integer id;

    private Integer categoryId;

    private String title;

    private String url;

    private String pic;

    private Date created;

    public Content(Integer id, Integer categoryId, String title, String url, String pic, Date created) {
        this.id = id;
        this.categoryId = categoryId;
        this.title = title;
        this.url = url;
        this.pic = pic;
        this.created = created;
    }

    public Content() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }
}