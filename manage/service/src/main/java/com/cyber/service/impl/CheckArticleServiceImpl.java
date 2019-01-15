package com.cyber.service.impl;

import com.cyber.mapper.ArticleMapper;
import com.cyber.pojo.Article;
import com.cyber.service.CheckArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

@Service
public class CheckArticleServiceImpl implements CheckArticleService {

    /**
     * 需要更改到service层
     */
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public String showArtiById(Integer articleId) {
        // 读取服务器保存的文件，需要考虑保存后直接查看与文章列表中查看
        Article article = articleMapper.showArticleById(articleId);

        StringBuilder sb = new StringBuilder();

        try (FileInputStream fis = new FileInputStream(new File(article.getArticlePath()))) {
            int len = 0;
            byte[] buff = new byte[1024];
            while ((len = fis.read(buff)) != -1) {
                sb.append(new String(buff, 0, len));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sb.toString();
    }

    @Override
    public Article getArticle(Integer articleId) {
        Article article = articleMapper.showArticleById(articleId);
        return article;
    }

    @Override
    public List<Article> selectTop() {
        List<Article> topList = articleMapper.selectTop();
        return topList;
    }

}
