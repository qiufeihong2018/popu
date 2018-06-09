package com.bopu.service.impl;

import com.bopu.mapper.ArticleMapper;
import com.bopu.pojo.Article;
import com.bopu.service.ArticleService;
import com.bopu.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

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
        Date date = new Date();
        article.setCount(0);
        article.setTime(date);
        if (article.getType() == 2) {

        } else {
            article.setLimitdata(date);
            article.setLook("none");
        }
        System.out.println(article);
        articleMapper.insert(article);
    }

    /**
     * 根据bp获取文章列表
     *
     * @param pb
     */
    public void getArticleList(PageBean pb) {
        pb.setTotal(articleMapper.countByCondition(pb.getType()));
        pb.setTotalPage((int) Math.ceil(pb.getTotal() *1.0/ pb.getPageSize()));
//        System.out.println("total:" + pb.getTotal() + "totalPage:" + pb.getTotalPage() + "type:" + pb.getType());
        List<Article> articles = articleMapper.findAllArticlePage(pb);
        pb.setRows(articles);
    }

    /**
     * 删除文章
     *
     * @param articleId
     */
    public void deleteArticle(Integer articleId) {
        articleMapper.deleteByPrimaryKey(articleId);
    }

    public void update(Article article) {
        articleMapper.updateByPrimaryKey(article);
    }

    public ArticleMapper getArticleMapper() {
        return articleMapper;
    }

    public void setArticleMapper(ArticleMapper articleMapper) {
        this.articleMapper = articleMapper;
    }
}
