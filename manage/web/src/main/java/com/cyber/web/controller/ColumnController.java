package com.cyber.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyber.pojo.Article;
import com.cyber.pojo.Column;
import com.cyber.service.CheckArticleService;
import com.cyber.service.ColumnService;

@Controller
public class ColumnController {

    @Autowired
    private CheckArticleService checkArticleService;
    @Autowired
    private ColumnService columnService;

    /**
     * href="/checkColumn?columnId=${column.columnId }"
     */
    @RequestMapping("/checkColumn")
    public String checkColumn(Integer columnId, Model model) {


        Column columnArticle = columnService.columnArticle(columnId);
        List<Article> articleList = columnArticle.getArticleList();
        model.addAttribute("articleList", articleList);

        // 需要将文章按点击量排出顺序
        // 阅读排行
        List<Article> topList = checkArticleService.selectTop();
        model.addAttribute("topList", topList);

        // 专栏管理
        List<Column> columnList = columnService.columnList();
        model.addAttribute("columnList", columnList);
        return "more_article";
    }

}
