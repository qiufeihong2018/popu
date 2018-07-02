package com.bopu.service.impl;

import com.bopu.mapper.ContentMapper;
import com.bopu.pojo.Content;
import com.bopu.pojo.ContentExample;
import com.bopu.service.ContentService;
import com.bopu.utils.RandomCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.security.auth.login.CredentialException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

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
        criteria.andCategoryIdIn(Arrays.asList(1, 2));
        // 排序输出
        example.setOrderByClause("category_id");
        List<Content> contents = contentMapper.selectByExample(example);
        return contents;
    }

    /**
     * 检查当前序号的图片是否存在
     * 不存在就插入一条数据
     *
     * @param sort
     * @return 文件路径
     */
    public String findPicSort(Integer sort) {
        String name = null;
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        // 图片类别及其序号
        criteria.andCategoryIdEqualTo(2);
        criteria.andSortEqualTo(sort);
        List<Content> contents = contentMapper.selectByExample(example);
        if (contents.size() == 0) {
            // 该序号没有图片
            example.clear();
            ContentExample.Criteria c = example.createCriteria();
            c.andCategoryIdEqualTo(2);
            long l = contentMapper.countByExample(example);
            // 在当前数据库中的图片计数下+1
            Content content = new Content();
            content.setTitle("picture" + (l + 1));
            content.setCategoryId(2);
            content.setCreated(new Date());
            name = RandomCode.getUUID() + ".jpg";
            content.setPic("/file/picture/" + name);
            content.setSort((int) l + 1);
            contentMapper.insertSelective(content);
        }
        return name;
    }

    /**
     * 删除轮播图片
     *
     * @param sort 图片的序号
     */
    public Content deletePic(Integer sort) {
        // 获取count
        Content content = null;
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryIdEqualTo(2);    // 图片
        long l = contentMapper.countByExample(example);
        if (sort > 3) {
            criteria.andSortEqualTo(sort);
            List<Content> contents = contentMapper.selectByExample(example);
            content = contents.get(0);
            contentMapper.deleteByExample(example);
            if (l > sort) {
                // count > sort计数比想要删除图片的id大,修改之后的id
                for (int i = sort + 1; i <= l; i++) {
                    contentMapper.updatePicSort(i);
                    // 修改文件名
                }
            }
        }
        return content;
    }

    public String getPic(Integer sort, Integer category) {
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryIdEqualTo(category);
        criteria.andSortEqualTo(sort);
        List<Content> contents = contentMapper.selectByExample(example);
        if (contents != null && contents.size() > 0) {
            return contents.get(0).getPic();
        }
        return null;
    }

    public String updatePic(Integer sort, Integer category) {
        String name = "/file/picture/" + RandomCode.getUUID() + ".jpg";
        Content content = new Content();
        content.setCategoryId(category);
        content.setSort(sort);
        content.setPic(name);
        contentMapper.updatePic(content);
        return name;
    }

    /**
     * 删除文章
     *
     * @param sort
     */
    public void deleteArt(Integer sort) {
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryIdEqualTo(1);    // 文章
        long l = contentMapper.countByExample(example);
        if (sort <= 3) {
            criteria.andSortEqualTo(sort);
            contentMapper.deleteByExample(example);
        }
    }

    /**
     * 添加文章
     *
     * @param articleId 文章id
     * @param sort      排序
     * @param path      图片路径
     */
    public void addArt(Integer articleId, Integer sort, String path) {
        Content c = new Content();
        c.setCategoryId(1);
        c.setSort(sort);
        c.setCreated(new Date());
        c.setPic(path);    // 图片路径
        c.setUrl("/article/show/?articleId=" + articleId);
        contentMapper.insert(c);
    }

    /**
     * 更新首页文章
     *
     * @param articleId 修改的文章id
     * @param sort      利用查找已存在文章的序号
     * @param path      图片路径
     */
    public void updateArt(Integer articleId, Integer sort, String path) {
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        criteria.andSortEqualTo(sort);
        criteria.andCategoryIdEqualTo(1);
        List<Content> contents = contentMapper.selectByExample(example);
        if (contents != null) {
            if (articleId != null) {
                contents.get(0).setUrl("/article/show/?articleId=" + articleId);
            }
            if (path != null) {
                contents.get(0).setPic(path);
            }
            contentMapper.updateByPrimaryKey(contents.get(0));
        }
    }

    /**
     * 设置关于我们(前端暂时只提供邮箱与电话)
     *
     * @param key   中文 如地址
     * @param value 具体值 如温州XXXXXX
     */
    @Deprecated
    public void setabout(String key, String value) {
        // 用Content 的title 为 key， url为value
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryIdEqualTo(3);    // 关于我们
        criteria.andTitleEqualTo(key);
        List<Content> contents = contentMapper.selectByExample(example);
        if (contents.size() != 0) {
            // 更新
            contents.get(0).setUrl(value);
            contentMapper.updateByPrimaryKeySelective(contents.get(0));
        } else {
            // 添加
            Content c = new Content();
            c.setCategoryId(3);
            c.setTitle(key);
            c.setUrl(value);
            c.setCreated(new Date());
            contentMapper.insertSelective(c);
        }
    }

    /**
     * 查询关于我们
     *
     * @return
     */
    public List<Content> findAbout() {
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryIdEqualTo(3);
        List<Content> contents = contentMapper.selectByExample(example);
        return contents;
    }

}
