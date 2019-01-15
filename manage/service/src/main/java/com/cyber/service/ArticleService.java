package com.cyber.service;

import com.cyber.common.util.PageUtils;
import com.cyber.pojo.Article;
import com.cyber.pojo.Category;
import com.cyber.pojo.ImgInfo;
import com.cyber.pojo.User;
import net.minidev.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


/**
 * 有关文章的Service
 *
 * @author li
 */
public interface ArticleService {

    /**
     * 用于保存写文章中上传的图片-服务器目录：/home/img
     *
     * @param file
     * @return
     * @throws Exception
     */
    ImgInfo setImgUrl(MultipartFile file);

    /**
     * 保存文章
     *
     * @param articleContent
     * @param category
     * @param article-文章内容
     * @return
     */
    JSONObject saveArticle(String article, String articleContent, Category category, User user, String title);

    List<Article> moreArticle();

    List<Article> moreArticleDesc();

    PageUtils<Article> pageArticle(Integer currPage);

}
