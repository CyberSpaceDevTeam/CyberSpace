package com.cyber.service.impl;

import com.cyber.mapper.CommentMapper;
import com.cyber.pojo.Comment;
import com.cyber.pojo.CommentTemp;
import com.cyber.service.CommentService;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> getCommentList(Integer articleId) {
        List<Comment> commentList = commentMapper.selectList(articleId);
        return commentList;
    }

    @Override
    public JSONObject saveComment(Comment comment) {
        // 保存数据到mysql中
//		comment.setArticleReviewCtime(new Date());
        int insert = commentMapper.insertComment(comment);

        comment = commentMapper.selectComment();

        CommentTemp commentTemp = new CommentTemp();
        commentTemp.setUserName(comment.getUser().getUserName());
        commentTemp.setArticleReviewCtime(comment.getArticleReviewCtime());
        commentTemp.setArticleReview(comment.getArticleReview());

        //创建一个json对象，用于结果的封装
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("comment", commentTemp);
        if (insert > 0) {
            jsonObject.put("result", "true");
        } else {
            jsonObject.put("result", "false");
        }
        // 将该评论返回给浏览器-有评论时间
        return jsonObject;

    }

}
