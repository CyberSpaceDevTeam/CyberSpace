package com.cyber.web.controller.resourceSysController;

import com.cyber.pojo.resourceSysPojo.PicUploadResult;
import com.cyber.pojo.resourceSysPojo.Resource;
import com.cyber.pojo.resourceSysPojo.ResourceList;
import com.cyber.service.resourceSysService.DeleteResourceListService;
import com.cyber.service.resourceSysService.InterationService;
import com.cyber.service.resourceSysService.ResourceListService;
import com.cyber.service.resourceSysService.UpdateResourceListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ViewResourcelistController {

    @Autowired
    private ResourceListService resourceListService;

    //跳转清单页面
    @RequestMapping("/tolist/{id}")
    public String goViewList(Model model, @PathVariable(value = "id") Integer id) {
        List<ResourceList> listInfo = resourceListService.findListAllById(id);
        model.addAttribute("listInfo", listInfo);
        return "resourcelist_view";
    }

    @RequestMapping("/onelistView/{resourcelistId}")
    public String goOnelistView(Model model, @PathVariable Integer resourcelistId) {
        ResourceList rList = resourceListService.findListOne(resourcelistId);
        List<Resource> resourceInfo = resourceListService.findListResource(resourcelistId);
        model.addAttribute("rlist", rList);
        model.addAttribute("resourceInfo", resourceInfo);
        return "resourcelist_info";
    }

    //跳转修改页面
    @RequestMapping("toUpdateList/{resourcelistId}")
    public String toUpdateList(Model model, @PathVariable Integer resourcelistId) {
        ResourceList rList = resourceListService.findListOne(resourcelistId);
        System.out.println(rList);
        model.addAttribute("rlist", rList);
        return "resourcelist_update";
    }

    @Autowired
    private UpdateResourceListService updateResourceListService;

    //修改清单实现
    @RequestMapping("updateResourcelist/{resourcelistId}")
    public String updateResourceList(@RequestParam("fileName") MultipartFile file, ResourceList resourceList, @PathVariable Integer resourcelistId, Model model, HttpServletRequest request) {
        PicUploadResult result = updateResourceListService.updateResourceList(file, resourceList, resourcelistId, request);
        Integer error = result.getError();
        model.addAttribute("error", error);
        model.addAttribute("id", resourcelistId);
        return "updatelist";
    }

    //删除清单逻辑实现
    @Autowired
    private DeleteResourceListService deleteResourceListService;

    @RequestMapping("toDeleteList/{resourcelistId}")
    public String deleteResourcelist(@PathVariable Integer resourcelistId) {
        deleteResourceListService.deleteResourcelist(resourcelistId);
        return "deletelist";
    }

    @Autowired
    private InterationService interationService;

    //跳转增加资源页面
    @RequestMapping("/toAddResource/{resourcelistId}")
    public String AddResourcelist(@PathVariable Integer resourcelistId, Model model) {
        List<Resource> resourceInfo = resourceListService.findListResource(resourcelistId);
        model.addAttribute("resourceInfo", resourceInfo);
        List<Resource> infoSource = interationService.findNotResource(resourcelistId);
        model.addAttribute("infoSource", infoSource);
        model.addAttribute("id", resourcelistId);
        return "addResourceToList";
    }


}
