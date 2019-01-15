package com.cyber.web.controller;

import java.util.List;

import com.cyber.common.util.PageUtils;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cyber.pojo.Article;
import com.cyber.pojo.Category;
import com.cyber.pojo.Column;
import com.cyber.pojo.ImgInfo;
import com.cyber.pojo.User;
import com.cyber.service.ArticleService;
import com.cyber.service.CheckArticleService;
import com.cyber.service.ColumnService;

import javax.servlet.http.HttpServletRequest;


/**
 * 有关文章的Controller
 *
 * @author li
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private CheckArticleService checkArticleService;
    @Autowired
    private ColumnService columnService;

    /**
     * 访问写文章的页面
     *
     * @return 写文章页面
     */
    @RequestMapping("/article")
    public String upload() {
        return "user_upload";
    }

    /**
     * 访问所有文章显示页
     */
    @RequestMapping("/moreArticle")
    public String moreArticle(Model model, Integer currPage) {

        // 需要进行判断，若携带参数有columnId，则不查所有的文章，现在的我无法实现controller之间带参访问

        // 查到所有的文章信息
//		List<Article> articleList = articleService.moreArticle();
        PageUtils<Article> pageUtils = articleService.pageArticle(currPage);
        model.addAttribute("pageUtils", pageUtils);

        // 需要将文章按点击量排出顺序
        // 阅读排行
        List<Article> topList = checkArticleService.selectTop();
        model.addAttribute("topList", topList);

        // 专栏管理
        List<Column> columnList = columnService.columnList();
        model.addAttribute("columnList", columnList);

        return "more_article";
    }

    /**
     * 用于保存写文章中上传的图片-服务器目录：/home/img
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveImg")
    @ResponseBody
    public ImgInfo setImgUrl(@RequestParam("imgFile") MultipartFile file) throws Exception {
        ImgInfo imgInfo = articleService.setImgUrl(file);
        return imgInfo;
    }

    /**
     * 保存文章
     *
     * @param article-文章内容
     * @return
     */
    @RequestMapping("/saveArticle")
    @ResponseBody
    public JSONObject saveArticle(String article, String articleContent, String title, HttpServletRequest request) {
        // 此处需要页面传参
        Category category = new Category();
        category.setCategoryId(1);
        User user = (User) request.getSession().getAttribute("user");
        JSONObject json = articleService.saveArticle(article, articleContent, category, user, title);
        return json;
    }

}
