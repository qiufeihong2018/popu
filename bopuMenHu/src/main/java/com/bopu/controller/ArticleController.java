package com.bopu.controller;

import com.bopu.pojo.Article;
import com.bopu.pojo.BoPuResult;
import com.bopu.service.ArticleService;
import com.bopu.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.ArrayList;
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
    @ResponseBody
    public BoPuResult uploadArticle(Article article) {
//        article.setTitle("微软官方正式宣布：75亿美金收购Github！新任CEO同时产生");
        articleService.saveArticle(article);
        return BoPuResult.build(200, article.getId().toString());
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
     * 根据文章id 显示阅读文章
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
     * 获取文章列表 返回给后台管理员
     *
     * @param currentPage
     * @param model
     * @return
     */
    @RequestMapping(value = "article/list")
    public String showArticleList(String currentPage, String type, Model model) {
        int page;
        if (null == currentPage || "".equals(currentPage) || "null".equals(currentPage)) {
            page = 1;
        } else {
            page = Integer.parseInt(currentPage);
        }
        PageBean pb = new PageBean();
        List<Integer> i = new ArrayList<Integer>();
        // 添加查询条件
        try {
            i.add(Integer.parseInt(type));
            pb.setType(i);
        } catch (NumberFormatException e) {
            pb.setType(null);
        }
        pb.setCurrentPage(page);
        pb.setPageSize(9);
        articleService.getArticleList(pb);
        model.addAttribute("pageBean", pb);
        return "admin/articleManage";
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
     * 根据文章id 显示更新文章
     *
     * @param articleId
     * @return
     */
    @RequestMapping(value = "article/updateShow")
    public String showUpdateArticle(Integer articleId, Model model) {
        Article articleById = articleService.getArticleById(articleId);
        if (null != articleById) {
            model.addAttribute("article", articleById);
            return "admin/updateArticle";
        }
        // TODO: return error
        return "";
    }

    /**
     * 文章修改
     *
     * @return
     */
    @RequestMapping(value = "article/update")
    @ResponseBody
    public BoPuResult update(Article article, Model model) {
        articleService.update(article);
        return BoPuResult.build(200, article.getId().toString());
    }

    /**
     * 前台文章类别跳转
     *
     * @return
     */
    @RequestMapping(value = "article/detailList")
    public String showList(Integer currentPage, Integer type, Model model) {
        if (null == currentPage) {
            System.out.println(currentPage + "    " + type);
            currentPage = 1;
        }
        System.out.println("-------" + type);
        PageBean pb = new PageBean();
        List<Integer> i = new ArrayList<Integer>();
        if (null == type) {
            // 验证url查4
            // 如果type为空只查询 1 2 3 不查询 内部通知4
            i.add(1);
            i.add(2);
            i.add(3);
            pb.setType(i);
        } else {
            i.add(type);
            pb.setType(i);
        }
        System.out.println(pb.getType());
        pb.setCurrentPage(currentPage);
        pb.setPageSize(10);
        articleService.getArticleList(pb);
        model.addAttribute("pageBean", pb);
        return "articleList";
    }

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
