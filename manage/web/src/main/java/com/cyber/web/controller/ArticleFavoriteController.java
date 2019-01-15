package com.cyber.web.controller;

import java.util.List;

import com.cyber.pojo.User;
import com.cyber.pojo.UserInfo;
import com.cyber.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyber.pojo.Article;
import com.cyber.service.ArticleFavoriteService;


@Controller
public class ArticleFavoriteController {

    @Autowired

    private ArticleFavoriteService articleFavoriteService;

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping("favorite")
    public String favorite(Integer userId, Model model) {
        // 查询文章收藏的列表
        List<Article> favoriteArticleList = articleFavoriteService.showFavoriteArticle(userId);
        model.addAttribute("favoriteArticleList", favoriteArticleList);
        UserInfo userInfo = userInfoService.selectUserInfoById(userId);
        User user = userInfoService.selectUserById(userId);

        model.addAttribute("userInfo", userInfo);
        model.addAttribute("userone", user);
        return "user_fav";
    }

}
