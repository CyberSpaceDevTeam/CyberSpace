package com.cyber.mapper;

import com.cyber.pojo.Comment;

import java.util.List;

public interface CommentMapper {

    List<Comment> selectList(Integer articleId);

    Integer insertComment(Comment comment);

    Comment selectComment();

}
