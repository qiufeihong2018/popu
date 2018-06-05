package com.bopu.controller;

import com.bopu.pojo.Article;
import com.bopu.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
        article.setTitle("微软官方正式宣布：75亿美金收购Github！新任CEO同时产生");
        articleService.saveArticle(article);
        return "";
    }

    @RequestMapping(value = "article/test")
    public String testShow(Model model) {
        Article articleById = articleService.getArticleById(1);
        model.addAttribute("article", articleById);
        return "seeArticle";
    }

    /**
     * 根据文章id显示文章
     *
     * @param articleId
     * @return
     */
    @RequestMapping(value = "article/show")
    public String showArticle(String articleId, Model model) {
        Article article = articleService.getArticleById(Integer.parseInt(articleId));
        // 文章不存在
        /*if (article == null) {
        // 跳转到错误页面
        return "";
        } else*/
        model.addAttribute("article", article);
        return "";
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }
}
