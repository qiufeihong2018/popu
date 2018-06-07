package com.bopu.service;

import com.bopu.pojo.Article;
import com.bopu.utils.PageBean;

import java.util.List;

public interface ArticleService {
    Article getArticleById(Integer i);

    void saveArticle(Article article);

    List<Article> getArticleList(PageBean pb);

    void deleteArticle(Integer articleId);
}
