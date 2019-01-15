package com.cyber.service.impl;

import com.cyber.mapper.ArticleFavoriteMapper;
import com.cyber.pojo.Article;
import com.cyber.service.ArticleFavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleFavoriteServiceimpl implements ArticleFavoriteService {

    @Autowired
    private ArticleFavoriteMapper articleFavoriteMapper;

    @Override
    public void articleFavorite(Integer userId, Integer articleId) {
        articleFavoriteMapper.articleFavorite(userId, articleId);
    }

    @Override
    public List<Article> showFavoriteArticle(Integer userId) {
        List<Article> favoriteArticleList = articleFavoriteMapper.showFavoriteArticle(userId);
        return favoriteArticleList;
    }

}
