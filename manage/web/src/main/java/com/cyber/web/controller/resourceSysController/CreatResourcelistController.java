package com.cyber.web.controller.resourceSysController;

import com.cyber.pojo.resourceSysPojo.PicUploadResult;
import com.cyber.pojo.resourceSysPojo.ResourceList;
import com.cyber.service.resourceSysService.UploadResourceListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.management.ValueExp;

@Controller
public class CreatResourcelistController {

    //跳转创建清单页面
    @RequestMapping("/tocreatResourcelist")
    public String tocreatResourcelist() {
        return "resourcelist_creat";
    }

    //创建清单
    @Autowired
    private UploadResourceListService uploadResourceListService;

    @RequestMapping("/creatResourcelist/{id}")
    public String creatResourcelist(@RequestParam("fileName") MultipartFile file, ResourceList resourcelist, Model model, @PathVariable(value = "id") Integer id) {
        PicUploadResult result = uploadResourceListService.saveResourcelist(file, resourcelist, id);
        Integer error = result.getError();
        model.addAttribute("error", error);
        return "creatResourcelistSkip";
    }
}
