package com.bopu.service;

import com.bopu.pojo.Content;

import java.util.List;

/**
 * 静态资源操作
 */

public interface ContentService {

    void test();

    List<Content> getInformation();

    String findPicSort(Integer sort);

    Content deletePic(Integer sort);

    void deleteArt(Integer sort);

    void addArt(Integer articleId, Integer sort, String path);

    void updateArt(Integer articleId, Integer sort, String path);

    void setabout(String email, String phone);

    String getPic(Integer sort, Integer category);

    String updatePic(Integer sort, Integer category);
}
