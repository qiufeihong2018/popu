package com.bopu.service.impl;

import com.bopu.mapper.ArticleMapper;
import com.bopu.mapper.ContentMapper;
import com.bopu.pojo.Article;
import com.bopu.pojo.ArticleExample;
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

    /**
     * 保存文章
     *
     * @param article
     */
    public void saveArticle(Article article) {
        // 设置作者 从session中获得 user.name
        Date date = new Date();
        article.setCount(0);
        article.setTime(date);
        article.setReferenced(0);    // 文章未被引用
        if (article.getType() != 2) {
            article.setLimitdata(date);
            article.setLook("none");
        }
        articleMapper.insert(article);
    }

    /**
     * 根据pb获取文章列表
     *
     * @param pb
     */
    public void getArticleList(PageBean pb) {
        pb.setTotal(articleMapper.countByCondition(pb.getType()));
        pb.setTotalPage((int) Math.ceil(pb.getTotal() * 1.0 / pb.getPageSize()));
//        System.out.println("total:" + pb.getTotal() + "totalPage:" + pb.getTotalPage() + "type:" + pb.getType());
        List<Article> articles = articleMapper.findAllArticlePage(pb);
        pb.setRows(articles);
    }


    /**
     * 删除文章
     * 文章被引用不可删除 修改为ajax请求
     *
     * @param articleId
     */
    public boolean deleteArticle(Integer articleId) {
        Article article = articleMapper.selectByPrimaryKey(articleId);
        if (article ==null ||article.getReferenced() >0 ) {
            return false;
        } else {
            articleMapper.deleteByPrimaryKey(articleId);
            return true;
        }
    }

    public void update(Article article) {
        articleMapper.updateByPrimaryKey(article);
    }

    /**
     * 返回文章链接 名称
     *
     * @param type 类别集
     */
    public List<Article> getTitleAndIdList(List<Integer> type) {
        List<Article> articles = articleMapper.selectTitleAndId(type);
        return articles;
    }

    /**
     * 获取简介
     *
     * @param type 简介的类型 5
     * @return
     */
    public Article getIntroduction(int type) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andTypeEqualTo(type);
        List<Article> articles = articleMapper.selectByExampleWithBLOBs(example);
        if (articles != null && articles.size() > 0) {
            return articles.get(0);
        }
        return null;
    }

    /**
     * 更新简介
     * @param content
     */
    public void updateIntro(String content) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andTypeEqualTo(5);
        List<Article> articles = articleMapper.selectByExampleWithBLOBs(example);
        if (articles != null && articles.size() > 0) {
            Article article = articles.get(0);
            article.setContent(content);
            articleMapper.updateByPrimaryKeySelective(article);
        } else {
            // 不存在文章
            Article article = new Article();
            article.setContent(content);
            article.setType(5);
            article.setTitle("简介");
            article.setTime(new Date());
            article.setLimitdata(new Date());
            article.setCount(0);
            article.setAuthor("admin");
            article.setFlag(1);
            article.setLook("none");
            articleMapper.insert(article);
        }
    }


    public ArticleMapper getArticleMapper() {
        return articleMapper;
    }

    public void setArticleMapper(ArticleMapper articleMapper) {
        this.articleMapper = articleMapper;
    }
}
