package com.bopu.controller;

import com.bopu.pojo.Article;
import com.bopu.service.ArticleService;
import com.bopu.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
//        articleService.saveArticle(article);
        return "";
    }

    @RequestMapping(value = "article/test")
    public String testShow(Model model) {
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
        return "";
    }

    @RequestMapping(value = "article/list")
    public String showArticleList(Integer currentPage, Model model) {
        System.out.println(currentPage);
        if (null == currentPage || "".equals(currentPage)) {
            currentPage = 1;
        }
        PageBean pb = new PageBean();
        pb.setCurrentPage(currentPage);
        pb.setPageSize(9);
        List<Article> articles = articleService.getArticleList(currentPage, pb);
        model.addAttribute("articles", articles);
        return "ArticleManage";
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }
}
