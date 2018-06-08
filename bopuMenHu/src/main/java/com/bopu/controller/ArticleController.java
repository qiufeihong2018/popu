package com.bopu.controller;

import com.bopu.pojo.Article;
import com.bopu.service.ArticleService;
import com.bopu.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;

/**
 * 文章管理
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    /**
     * 文章上传
     *
     * @param article
     * @return
     */
    @RequestMapping(value = "article/upload")
    public String uploadArticle(Article article) {
//        article.setTitle("微软官方正式宣布：75亿美金收购Github！新任CEO同时产生");
        System.out.println(article);
        articleService.saveArticle(article);
        return "";
    }

    /**
     * 功能测试
     *
     * @param model
     * @return
     */
    @Autowired
    private JedisPool jedisPool;

    @RequestMapping(value = "article/test")
    public String testShow(Model model) {
        Jedis jedis = jedisPool.getResource();
        jedis.set("key4", "111");
        System.out.println(jedis.get("key4"));
        // spring 帮助控制
//        jedis.close();
        return "";
    }

    /**
     * 根据文章id显示文章
     *
     * @param articleId
     * @return
     */
    @RequestMapping(value = "article/show")
    public String showArticle(Integer articleId, Model model) {
        Article articleById = articleService.getArticleById(articleId);
        if (null != articleById) {
            model.addAttribute("article", articleById);
            return "seeArticle";
        }
        // TODO: return error
        return "";
    }

    /**
     * 获取文章列表
     *
     * @param currentPage
     * @param model
     * @return
     */
    @RequestMapping(value = "article/list")
    public String showArticleList(String currentPage, Model model) {
        int page;
        if (null == currentPage || "".equals(currentPage) || "null".equals(currentPage)) {
            page = 1;
        } else {
            page = Integer.parseInt(currentPage);
        }
        PageBean pb = new PageBean();
        pb.setCurrentPage(page);
        pb.setPageSize(9);
        articleService.getArticleList(pb);
        model.addAttribute("pageBean", pb);
        return "admin/ArticleManage";
    }

    /**
     * 文章删除  交由list刷新当前页Integer currentPage
     *
     * @return
     */
    @RequestMapping(value = "article/delete")
    public String deleteArticle(String articleId, Integer currentPage) {
        articleService.deleteArticle(Integer.parseInt(articleId));
        return "redirect:list?currentPage=" + currentPage;
    }

    /**
     * 文章更新
     *
     * @return
     */
    @RequestMapping(value = "article/update")
    public String updateArticle(Article article) {
        return "redirect:show?articleId=" + article.getId();
    }

    /**
     * 文章评论
     * @return
     */

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public JedisPool getJedisPool() {
        return jedisPool;
    }

    public void setJedisPool(JedisPool jedisPool) {
        this.jedisPool = jedisPool;
    }
}
