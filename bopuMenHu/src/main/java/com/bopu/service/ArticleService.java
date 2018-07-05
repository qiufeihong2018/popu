package com.bopu.service;

import com.bopu.pojo.Article;
import com.bopu.utils.PageBean;

import java.util.List;

public interface ArticleService {
    Article getArticleById(Integer i);

    void saveArticle(Article article);

    void getArticleList(PageBean pb);

    boolean deleteArticle(Integer articleId);

    void update(Article article);

    List<Article> getTitleAndIdList(List<Integer> type);

    Article getIntroduction(int type);

    void updateIntro(String content);
}
