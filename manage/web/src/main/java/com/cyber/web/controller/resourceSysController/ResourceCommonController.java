package com.cyber.web.controller.resourceSysController;

import com.cyber.pojo.resourceSysPojo.ResourceComment;
import com.cyber.service.resourceSysService.ResourceCommentService;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;


@Controller
public class ResourceCommonController extends BaseController {

    @Autowired
    private ResourceCommentService resourceCommentService;

    @RequestMapping("/saveResourceComment/{resourceId}")
    @ResponseBody
    public JSONObject saveComment(@RequestBody ResourceComment rescomment) {
        JSONObject jsonObject = resourceCommentService.saveResourceComment(rescomment);
        // 将该评论返回给浏览器-有评论时间
        return jsonObject;
    }

}
