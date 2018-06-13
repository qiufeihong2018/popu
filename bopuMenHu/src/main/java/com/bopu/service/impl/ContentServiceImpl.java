package com.bopu.service.impl;

import com.bopu.mapper.ContentMapper;
import com.bopu.pojo.Content;
import com.bopu.pojo.ContentExample;
import com.bopu.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.security.auth.login.CredentialException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author Exler
 * @create 2018/6/10
 * @time 15:47
 * @describe:
 **/

@Service
public class
ContentServiceImpl implements ContentService {

    @Autowired
    private ContentMapper contentMapper;
    @Autowired
    private JedisPool jp;

    /**
     * 测试方法
     */
    public void test() {
        Jedis jedis = jp.getResource();
        jedis.set("key4", "111");
        System.out.println(jedis.get("key4"));
    }

    /**
     * 获取首页 3 篇置顶 文章 以及轮播图
     *
     * @return
     */
    public List<Content> getInformation() {
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        //  文章 图片
        criteria.andCategoryIdIn(Arrays.asList(1,2));
        List<Content> contents = contentMapper.selectByExample(example);
        // 获取图片信息
        for (Content c : contents) {
            System.out.println(c);
        }
        return contents;
    }


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
