package com.cyber.web.controller.resourceSysController;

import com.cyber.pojo.User;
import com.cyber.pojo.resourceSysPojo.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Controller
public class MainConller {
    @RequestMapping(value = "/tomain")
    public String toMain(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");
        System.out.println(user.getUserId());
        model.addAttribute("userId", user.getUserId());
        // 这里需要一个list

        return "main";
    }

}
