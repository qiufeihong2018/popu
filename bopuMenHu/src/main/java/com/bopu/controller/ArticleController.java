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
import sun.misc.JavaNioAccess;

import java.lang.annotation.ElementType;
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
    public String showArticleList(String currentPage, Integer type, Model model) {
        int page;
        if (null == currentPage || "".equals(currentPage) || "null".equals(currentPage)) {
            page = 1;
        } else {
            page = Integer.parseInt(currentPage);
        }
        PageBean pb = new PageBean();
        List<Integer> i = new ArrayList<Integer>();
        // 添加查询条件
        if (type != null) {
            i.add(type);
        } else {
            i.add(1);
            i.add(2);
            i.add(3);
            i.add(4);
        }
        pb.setType(i);

        pb.setCurrentPage(page);
        pb.setPageSize(9);
        articleService.getArticleList(pb);
        model.addAttribute("pageBean", pb);
        return "admin/articleManage";
    }

    /**
     * 获取文章列表 用于后台选择文章id
     *
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "article/getlist")
    @ResponseBody
    public BoPuResult showList(String currentPage) {
        int page;
        if (null == currentPage || "".equals(currentPage) || "null".equals(currentPage)) {
            page = 1;
        } else {
            page = Integer.parseInt(currentPage);
        }
        List<Integer> i = new ArrayList<Integer>();
        PageBean pb = new PageBean();
        // 验证url查4
        // 如果type为空只查询 1 2 3 不查询 内部通知4
        i.add(1);
        i.add(2);
        i.add(3);
        i.add(4);
        pb.setType(i);
        pb.setCurrentPage(page);
        pb.setPageSize(10);
        articleService.getArticleList(pb);
        BoPuResult boPuResult = new BoPuResult(200, "");
        boPuResult.setObj(pb);
        return boPuResult;
    }

    /**
     * 文章删除  交由list刷新当前页Integer currentPage
     *
     * @return
     */
    @RequestMapping(value = "article/delete")
    @ResponseBody
    public BoPuResult deleteArticle(Integer articleId) {
        if (articleService.deleteArticle(articleId)) {
            return BoPuResult.build(200, "true");
        } else {
            return BoPuResult.build(200, "false");
        }
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
    public BoPuResult update(Article article) {
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
            currentPage = 1;
        }
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
        pb.setCurrentPage(currentPage);
        pb.setPageSize(10);
        articleService.getArticleList(pb);
        model.addAttribute("pageBean", pb);
        return "articleList";
    }

    /**
     * 首页 文章id title ajax加载
     *
     * @return
     */
    @RequestMapping(value = "article/newArticle")
    @ResponseBody
    public BoPuResult showFirstArticle(Integer category) {
        List<Integer> type = new ArrayList<Integer>();
        if (null == category) {
            type.add(1);
            type.add(2);
            type.add(3);
        } else {
            type.add(category);
        }
        List<Article> titleAndIdList = articleService.getTitleAndIdList(type);
        BoPuResult boPuResult = new BoPuResult(200, "success");
        boPuResult.setObj(titleAndIdList);
        return boPuResult;
    }

    @RequestMapping(value = "article/projectContent")
    @ResponseBody
    public BoPuResult showProjectDetail() {
        PageBean pb = new PageBean();
        List<Integer> i = new ArrayList<Integer>();
        // 添加查询条件
        i.add(2);    // 内部通知
        pb.setType(i);
        pb.setCurrentPage(1);
        pb.setPageSize(8);
        articleService.getArticleList(pb);
        BoPuResult boPuResult = new BoPuResult(200, "");
        boPuResult.setObj(pb);
        return boPuResult;
    }

    /**
     * 获取简介
     *
     * @return
     */
    @RequestMapping("/article/introduction")
    @ResponseBody
    public BoPuResult getIntroduction() {
        Article article = articleService.getIntroduction(5);
        BoPuResult result = new BoPuResult(200, "");
        result.setObj(article);
        return result;
    }

    /**
     * 简介修改
     *
     * @return
     */
    @RequestMapping("/article/updateIntro")
    @ResponseBody
    public BoPuResult updateIntroduction(String content) {
        articleService.updateIntro(content);
        return BoPuResult.build(200, "");
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
