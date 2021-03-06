package com.bopu.mapper;

import com.bopu.pojo.Article;
import com.bopu.pojo.ArticleExample;

import java.util.List;

import com.bopu.utils.PageBean;
import org.apache.ibatis.annotations.Param;

public interface ArticleMapper {
    long countByExample(ArticleExample example);

    int deleteByExample(ArticleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    List<Article> selectByExampleWithBLOBs(ArticleExample example);

    List<Article> selectByExample(ArticleExample example);

    Article selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByExampleWithBLOBs(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByExample(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    int testInsert(Article article);

    Article testSelectByPrimaryKey(Integer id);

    int countByCondition(@Param("type") List<Integer> type);

    int updateArticleCount(Integer id);

    List<Article> findAllArticlePage(PageBean pageBean);

    List<Article> selectTitleAndId(@Param("type") List<Integer> type);

    String getTitleById(Integer id);

    void updateRefByPK(Integer id, Integer referenced);
}