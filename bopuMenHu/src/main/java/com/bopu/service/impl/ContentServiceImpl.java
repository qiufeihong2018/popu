package com.bopu.service.impl;

import com.bopu.mapper.ContentMapper;
import com.bopu.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author Exler
 * @create 2018/6/10
 * @time 15:47
 * @describe:
 **/

@Service
public class ContentServiceImpl implements ContentService {
    @Autowired
    private ContentMapper contentMapper;

    /**
     * @param sort      指定文章的顺序 修改的是第几张图片
     * @param articleId 文章id
     * @param file      图片
     */
    @RequestMapping(value = "content/setArticle")
    public void set(Integer sort, Integer articleId, MultipartFile file) {

    }

    /**
     * 修改轮播图 的图片
     */
    @RequestMapping(value = "content/setImg")
    public void setPic(Integer sort, MultipartFile file) {

    }

    /**
     * 设置关于我们
     */
    @RequestMapping(value = "content/setOur")
    public void setOur() {

    }
}
