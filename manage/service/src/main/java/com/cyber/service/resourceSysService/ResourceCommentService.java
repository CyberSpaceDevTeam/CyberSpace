package com.cyber.service.resourceSysService;

import com.cyber.mapper.resourceSysMapper.ResourceCommentMapper;
import com.cyber.pojo.resourceSysPojo.ResourceComment;
import com.cyber.pojo.resourceSysPojo.ResourceCommentTemp;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceCommentService {

    @Autowired
    private ResourceCommentMapper resourceCommentMapper;


    public List<ResourceComment> selectAll(Integer resourceId) {
        return resourceCommentMapper.selectList(resourceId);

    }

    public Integer insert(ResourceComment resourceComment) {
        return resourceCommentMapper.insertResourceComment(resourceComment);
    }

    public JSONObject saveResourceComment(ResourceComment resourceComment) {
        // 保存数据到mysql中
//		comment.setArticleReviewCtime(new Date());
        int insert = resourceCommentMapper.insertResourceComment(resourceComment);

        resourceComment = resourceCommentMapper.selectResourceComment();

        ResourceCommentTemp resourceCommentTemp = new ResourceCommentTemp();
        resourceCommentTemp.setUserName(resourceComment.getUser().getUserName());
        resourceCommentTemp.setResourceReviewCtime(resourceComment.getResourceReviewCtime());
        resourceCommentTemp.setResourceReview(resourceComment.getResourceReview());

        //创建一个json对象，用于结果的封装
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("resourceComment", resourceCommentTemp);
        if (insert > 0) {
            jsonObject.put("result", "true");
        } else {
            jsonObject.put("result", "false");
        }
        // 将该评论返回给浏览器-有评论时间
        return jsonObject;

    }

}
