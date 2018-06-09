package com.bopu.utils;

import java.util.List;

/**
 * @Auther: Exler
 * @Date: 2018/5/19 21:03
 * @Description: 封装分页属性
 */
public class PageBean {
    private int currentPage;   // 当前页码
    private int pageSize;   // 每页显示记录数
    private int total;  // 总记录数
    private int totalPage;    // 总页数
    private List rows;  // 当前页所需要展示的数据集合
    private Integer type; // 查询条件 文章类型

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
