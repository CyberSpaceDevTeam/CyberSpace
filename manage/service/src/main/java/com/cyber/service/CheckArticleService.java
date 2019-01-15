package com.cyber.service;

import com.cyber.pojo.Article;

import java.util.List;

public interface CheckArticleService {

    Article getArticle(Integer articleId);

    /**
     * 模拟显示文章-利用文章id:1、保存后直接查看-；2、从文章列表中查看
     *
     * @return
     */
    String showArtiById(Integer articleId);

    List<Article> selectTop();

}
