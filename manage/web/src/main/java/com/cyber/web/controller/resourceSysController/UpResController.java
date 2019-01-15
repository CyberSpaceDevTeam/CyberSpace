package com.cyber.web.controller.resourceSysController;


import com.cyber.pojo.Category;
import com.cyber.pojo.resourceSysPojo.PicUploadResult;
import com.cyber.pojo.resourceSysPojo.Resource;
import com.cyber.pojo.resourceSysPojo.Type;
import com.cyber.service.resourceSysService.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class UpResController {

    @Autowired
    private ResourceService resourceService;

    /*
     * 获取file.html页面
     */
    @RequestMapping("file")
    public String file(Model model) {
        List<Type> typeList = resourceService.findTypeAll();
        List<Category> categorylist = resourceService.findCategoryAll();
        model.addAttribute("typeList", typeList);
        model.addAttribute("categorylist", categorylist);
        return "resource_upload";
    }

    /**
     * 实现文件上传
     */
    @RequestMapping("fileUpload/{userId}")
    public String fileUpload(@RequestParam("fileName") MultipartFile file, Resource resource, Model model, @PathVariable(value = "userId") Integer userId) {
        PicUploadResult result = resourceService.saveResource(file, resource, userId);
        Integer error = result.getError();
        model.addAttribute("error", error);
        return "uploaded";
    }
}
