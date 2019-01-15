package com.cyber.web.controller.resourceSysController;

import com.cyber.pojo.resourceSysPojo.ResourceScore;
import com.cyber.service.resourceSysService.InterationService;
import com.cyber.service.resourceSysService.RscoreService;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AjaxResController {
    @Autowired
    private RscoreService rscoreService;

    @RequestMapping(value = "/ResourceScore", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject toRscore(@RequestParam(value = "score") String score, @RequestParam(value = "resourceId") String resourceId, Model model) {
        JSONObject jsonObject = new JSONObject();

        Float sc = Float.valueOf(score);
        Integer s = Math.round(sc);
        Integer id = Integer.valueOf(resourceId);
        Integer userId = 1;
        System.out.println(sc);
        ResourceScore rlist = rscoreService.findRscore(userId, id);

        if (rlist == null) {
            rscoreService.saveRscore(s, id, userId);
            jsonObject.put("msg", "您已评分");
            return jsonObject;
        } else {
            jsonObject.put("msg", "您已评分，请勿再次评分");
        }
        return jsonObject;
    }

    @Autowired
    private InterationService interationService;

    @RequestMapping(value = "/interaction/{resourcelistId}", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject toInteract(@RequestParam(value = "state") Integer state, @RequestParam(value = "id") Integer id, @PathVariable(value = "resourcelistId") Integer resourcelistId, Model model) {
        JSONObject jsonObject = new JSONObject();


        if (state == 1) {
            interationService.saveResourceToList(id, resourcelistId);
            jsonObject.put("msg", "已添加");

        } else {
            interationService.deleteResourceToList(id, resourcelistId);
            jsonObject.put("msg", "已删除");
        }
        return jsonObject;
    }
}
