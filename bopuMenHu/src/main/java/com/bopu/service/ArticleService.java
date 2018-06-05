package com.bopu.service;

import com.bopu.pojo.Article;

public interface ArticleService {
    Article getArticleById(Integer i);

    void saveArticle(Article article);
}
