package com.bopu.service.impl;

import com.bopu.mapper.ArticleMapper;
import com.bopu.pojo.Article;
import com.bopu.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    /**
     * 根据id显示文章
     *
     * @param id
     * @return
     */
    public Article getArticleById(Integer id) {
        // 不存在
        // 存在
        // 文章访问量+1
        articleMapper.updateArticleCount(id);
        Article article = articleMapper.selectByPrimaryKey(id);
        return article;
    }

    // 所有人能看到的就是1 实验项目就是2 内部通知就是3    1可评论 2 不可评论

    public void saveArticle(Article article) {
        // 设置作者 从session中获得 user.name
        if (null == article.getAuthor() || "" == article.getAuthor()) {
            article.setAuthor("admin");
        }
        article.setTime(new Date("YYYY-MM-dd hh:mm:ss"));
        article.setType(1);
        if (article.getType() == 2) {
            article.setLimitdata(new Date("YYYY-MM-dd hh:mm:ss"));
        }
        // 是否可评论
        article.setFlag(1);
        // url
        article.setLook("<a href='http://www.baidu.com'>http://www.baidu.com<a>");
        article.setCount(0);
        articleMapper.insert(article);
    }

    public ArticleMapper getArticleMapper() {
        return articleMapper;
    }

    public void setArticleMapper(ArticleMapper articleMapper) {
        this.articleMapper = articleMapper;
    }
}
