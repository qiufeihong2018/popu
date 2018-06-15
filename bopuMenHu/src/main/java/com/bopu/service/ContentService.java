package com.bopu.service;

import com.bopu.pojo.Content;

import java.util.List;

/**
 * 静态资源操作
 */

public interface ContentService {

    void test();

    List<Content> getInformation();

    void findPicSort(Integer sort);
}
