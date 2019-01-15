package com.cyber.web.controller;

import java.util.Date;

import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cyber.pojo.Comment;
import com.cyber.service.CommentService;


@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/saveComment")
    @ResponseBody
    public JSONObject saveComment(@RequestBody Comment comment) {
        JSONObject jsonObject = commentService.saveComment(comment);
        // 将该评论返回给浏览器-有评论时间
        return jsonObject;

    }

}
