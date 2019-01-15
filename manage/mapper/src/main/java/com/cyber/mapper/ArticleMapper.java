package com.cyber.mapper;

import com.cyber.pojo.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleMapper {

    void saveArticle(Article article);

    List<Article> moreArticleDesc();

    Article showArticle();

    Article showArticleById(Integer articleId);

    List<Article> selectAllArticle(/*Integer pageStart,Integer pageSize*/);

    List<Article> selectTop();

    List<Article> pageArticle(@Param("pageStart") Integer pageStart, @Param("pageSize") Integer pageSize);

    Integer articleCount();


}
