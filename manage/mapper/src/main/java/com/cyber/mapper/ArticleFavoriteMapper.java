package com.cyber.mapper;

import com.cyber.pojo.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleFavoriteMapper {

    void articleFavorite(@Param("userId") Integer userId, @Param("articleId") Integer articleId);

    List<Article> showFavoriteArticle(Integer userId);

}
