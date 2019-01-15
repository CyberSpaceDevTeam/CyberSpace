package com.cyber.web.controller.resourceSysController;

import com.cyber.common.util.PageUtils;
import com.cyber.pojo.Article;
import com.cyber.pojo.Category;
import com.cyber.pojo.Column;
import com.cyber.pojo.User;
import com.cyber.pojo.resourceSysPojo.*;
import com.cyber.service.resourceSysService.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ViewResController extends BaseController {

    //查询所有
    @Autowired
    private InfoResourceService infoResourceService;

    @RequestMapping("/toviewRes")
    public String goViewResource(Model model, HttpServletRequest req) {

        List<Resource> resourceList = infoResourceService.getInfoSource();

        model.addAttribute("resourceList", resourceList);

        return "main";
    }


    @Autowired
    private CheckResourceService checkResourceService;

    @RequestMapping("/moreResource")
    public String moreResource(Model model, @RequestParam(value = "currPage") Integer currPage, @RequestParam(value = "userId") Integer id) {
        // 需要进行判断，若携带参数有columnId，则不查所有的文章，现在的我无法实现controller之间带参访问

        // 查到所有的文章信息
//		List<Article> articleList = articleService.moreArticle();

        PageUtils<Resource> pageUtils = infoResourceService.pageResource(currPage, id);
        model.addAttribute("pageUtils", pageUtils);


        List<Resource> topList = checkResourceService.selectTop();
        model.addAttribute("topList", topList);




     /*   // 专栏管理
        List<Column> columnList = columnService.columnList();
        model.addAttribute("columnList", columnList);*/

        return "more_resource";
    }

    @Autowired
    private ResourceCommentService resourceCommentService;

    //查询单个
    @RequestMapping("/toviewOne/{id}")
    public String toViewResource(@PathVariable Integer id, Model model) {
        Resource one = infoResourceService.getInfoResOne(id);
        Float score = infoResourceService.avgRscore(id);
        List<ResourceComment> resourcecommentList = resourceCommentService.selectAll(id);
        model.addAttribute("resourcecommentList", resourcecommentList);

        if (score != null) {
            Float scores = (float) (Math.round(score * 10)) / 10;
            model.addAttribute("score", scores);
        } else {
            model.addAttribute("score", score);
        }
        model.addAttribute("one", one);
        return "resource_Info";
    }

    @Autowired
    private ResourceService resourceService;

    //跳转修改页面并且带有回显
    @RequestMapping("/toUpdate/{id}")
    public String toupdateResource(@PathVariable Integer id, Model model) {
        Resource one = infoResourceService.getInfoResOne(id);
        List<Type> typeList = resourceService.findTypeAll();
        List<Category> categorylist = resourceService.findCategoryAll();

        System.out.println(one);
        model.addAttribute("one", one);
        model.addAttribute("typeList", typeList);
        model.addAttribute("categorylist", categorylist);
        return "resource_Update";
    }

    @Autowired
    private UpdateService updateResource;

    // 修改信息
    @RequestMapping("/update/{id}")
    public String updateResource(@RequestParam("fileName") MultipartFile file, Resource resource, @PathVariable Integer id, Model model, HttpServletRequest request) {
        PicUploadResult result = updateResource.updateResource(file, resource, id, request);
        Integer error = result.getError();
        model.addAttribute("error", error);
        model.addAttribute("id", id);
        return "updated";
    }

    @Autowired
    private DeleteResService deleteResService;

    // 删除信息
    @RequestMapping("/toDelete/{id}")
    public String toDeleteResource(@PathVariable Integer id) {
        deleteResService.deleteResource(id);
        return "deleted";
    }


    //分类查询
    @Autowired
    private TypeAndCategoryService typeAndCategoryService;

    @RequestMapping(value = "/toview", method = RequestMethod.GET)
    public String toTypeAndCategory(@RequestParam(value = "typeId") Integer typeId, @RequestParam(value = "categoryId") Integer categoryId, Model model) {
        System.out.println(typeId + "****" + categoryId);
        List<Resource> resourceList = typeAndCategoryService.findTypeAndCategory(typeId, categoryId);

        model.addAttribute("resourceList", resourceList);
        return "resourceView";
    }

}
