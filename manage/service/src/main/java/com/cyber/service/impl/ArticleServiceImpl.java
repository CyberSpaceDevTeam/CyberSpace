package com.cyber.service.impl;

import com.cyber.common.util.PageUtils;
import com.cyber.mapper.ArticleMapper;
import com.cyber.pojo.Article;
import com.cyber.pojo.Category;
import com.cyber.pojo.ImgInfo;
import com.cyber.pojo.User;
import com.cyber.service.ArticleService;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;


@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
public class ArticleServiceImpl implements ArticleService {

    /**
     * 保存文章内容中图片的磁盘路径
     */
    @Autowired
    private String imgPath;
    /**
     * 对外开放的访问图片的路径，实际上是文章中访问
     */
    @Autowired
    private String serverImgPath;
    /**
     * 保存文章内容的磁盘路径
     */
    @Autowired
    private String articlePath;

    /**
     * 需要更改到service层
     */
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public ImgInfo setImgUrl(MultipartFile file) {
        // 图片二进制数组
        byte[] bytes = null;
        try {
            bytes = file.getBytes();
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        File imgFile = new File(imgPath);
        if (!imgFile.exists()) {
            imgFile.mkdirs();
        }
        // 保存文件名
        String fileName = file.getOriginalFilename();// 文件名称

        // 写入到磁盘
        try (FileOutputStream fos = new FileOutputStream(new File(imgPath + fileName))) {
            fos.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 图片保存位置 http://.../img/fileName
        String value = serverImgPath + fileName;
        String[] values = {value};

        // 封装图片保存信息，json返回
        ImgInfo imgInfo = new ImgInfo();
        imgInfo.setError(0);
        imgInfo.setUrl(values);
        return imgInfo;
    }

    /**
     * 保存文章
     *
     * @param article-文章内容
     * @return
     */
    @Override
    public JSONObject saveArticle(String article, String articleContent, Category category, User user, String title) {
        // 此处应该是用户输入的文件名
        // 保存文章名
        String fileName = title;

        try (FileOutputStream fos = new FileOutputStream(articlePath + fileName)) {
            fos.write(article.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 存入数据库-表_article
        Article article2 = new Article();
        article2.setArticleName(fileName);
        article2.setArticlePath(articlePath + fileName);
        article2.setCategory(category);
        article2.setUser(user);
        article2.setArticleContent(articleContent.substring(1, 42) + "...");

        articleMapper.saveArticle(article2);

        article2 = articleMapper.showArticle();

        JSONObject json = new JSONObject();
        json.put("result", "true");
        json.put("articleId", article2.getArticleId());
        return json;
    }

    @Override
    public List<Article> moreArticle() {
        List<Article> articleList = articleMapper.selectAllArticle();
        return articleList;
    }

    @Override
    public PageUtils<Article> pageArticle(Integer currPage) {
        if (currPage == null || currPage <= 0) {
            currPage = 1;
        }

        PageUtils<Article> pageUtils = new PageUtils<>();

        pageUtils.setCurrPage(currPage);

        int pageSize = pageUtils.getPageSize();
        List<Article> articleList = articleMapper.pageArticle((currPage - 1) * pageSize, pageSize);

        pageUtils.setPageList(articleList);

        Integer articleCount = articleMapper.articleCount();
        pageUtils.setTotalCount(articleCount);

        Integer totalPage = articleCount % pageSize == 0 ? articleCount / pageSize : (articleCount / pageSize) + 1;

        pageUtils.setTotalPage(totalPage);

        return pageUtils;
    }

    @Override
    public List<Article> moreArticleDesc() {
        return null;
    }

}
