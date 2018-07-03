package com.bopu.service;

import com.bopu.pojo.Content;

import java.util.List;

/**
 * 静态资源操作
 */

public interface ContentService {

    void test();

    List<Content> getInformation();

    String  findPicSort(Integer sort, Integer category, Integer articleId);

    Content deletePic(Integer sort);

    void updateArt(Integer articleId, Integer sort, String path);

    void setabout(String email, String phone);

    String getPic(Integer sort, Integer category);

    List<Content> findAbout();

    Content findContentBySC(Integer sort, Integer category);
}
