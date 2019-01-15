package com.cyber.service;

import com.cyber.pojo.Comment;
import net.minidev.json.JSONObject;

import java.util.List;


public interface CommentService {

    List<Comment> getCommentList(Integer articleId);

    JSONObject saveComment(Comment comment);

}
