package com.cyber.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyber.pojo.Article;
import com.cyber.pojo.Comment;
import com.cyber.service.CheckArticleService;
import com.cyber.service.CommentService;

@Controller
public class CheckArtiController {

    @Autowired
    private CheckArticleService checkArticleService;

    @Autowired
    private CommentService commentService;

    /**
     * 模拟显示文章-利用文章id:1、保存后直接查看-；2、从文章列表中查看
     *
     * @return
     */
    @RequestMapping("/showArtiById")
    public String showArti(Integer articleId, String articleName, Model model) {
        String showArti = checkArticleService.showArtiById(articleId);
        // 用于显示文章具体内容
        model.addAttribute("articleContent", showArti);

        Article article = checkArticleService.getArticle(articleId);

//		// 用于显示文章题目
//		model.addAttribute("articleName", articleName);
//		// 用于可能收藏的动作
//		model.addAttribute("articleId", articleId);

        model.addAttribute("article", article);
        // 评论相关
        List<Comment> commentList = commentService.getCommentList(articleId);
        model.addAttribute("commentList", commentList);

        return "article_resource";
    }

}
