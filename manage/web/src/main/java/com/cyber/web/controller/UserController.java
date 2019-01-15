package com.cyber.web.controller;

import com.cyber.common.util.CookieUtils;
import com.cyber.pojo.User;
import com.cyber.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    //注册登陆页面的跳转,restful风格
    @RequestMapping("/{pageName}")
    public String goRegister(@PathVariable String pageName, Model model) {

        return pageName;
    }

    @Autowired
    private UserService userService;


   /* //发送验证码
    @RequestMapping("/sendYZM")
    @ResponseBody
    public String sendMail(HttpServletRequest request,  String to){
        System.out.println(to);
        userService.sendMail(to,request);
        return "{'result':'发送成功'}";
    }*/

    //发送验证码
    @RequestMapping("/sendYZM")
    @ResponseBody
    public Map<String, Object> sendMail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String to = request.getParameter("to");
        userService.sendMail(to, request);
        Map<String, Object> map = new HashMap<>();
        return map;
    }

   /* //核对验证码
    @RequestMapping("/checkYZM")
    @ResponseBody
    public String checkYZM(HttpServletRequest request) {
        String yzm = request.getParameter("yzm");
        System.out.println(yzm);
        String YZM = (String) request.getSession().getAttribute("yzm");
        System.out.println(YZM);
        if (yzm.equals(YZM)) {
            return "{'result':''}";

        } else {
            return "{'result':'验证码输入有误'}";
        }
    }*/

/*
    //校验数据
    @RequestMapping("/checkParam")
    @ResponseBody
    public String checkParam(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String param = request.getParameter("param");
        String type = request.getParameter("type");
        String msg = userService.checkParam(param, type);
        System.out.println(msg);
        if ("".equals(msg)) {
            return "{'result':''}";
        } else {
            return "{'result':'msg'}";
        }
    }*/

    //数据校验，校验用户名和邮箱
    @RequestMapping("/checkParam")
    @ResponseBody
    public Map<String, Object> checkParam(HttpServletRequest request) throws Exception {
        String param = request.getParameter("param");
        String type = request.getParameter("type");
        String msg = userService.checkParam(param, type);
        Map<String, Object> map = new HashMap<>();
        map.put("msg", msg);
        return map;
    }

   /* //注册
    @RequestMapping("/doRegister")
    public String doRegister( HttpServletRequest request,HttpServletResponse response) throws Exception {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String secCode = request.getParameter("secCode");
        String email = request.getParameter("email");
        System.out.println(username);
        System.out.println(password);
        System.out.println(password2);
        System.out.println(secCode);
        System.out.println(email);
        String msg = userService.doRegister(username, password, password2, email);
        System.out.println(msg);
        request.setAttribute("msg", msg);
        if ("".equals(msg)) {

            //注册成功，3秒后跳转首页
            return "/index";
        } else {
            //注册失败，将后台的数据发送到注册页面.返回注册页面
            return "/user_register";
        }
    }*/


    //注册
    @RequestMapping("/doRegister")
    @ResponseBody

    public Map<String, Object> doRegister(HttpServletRequest request) throws Exception {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String secCode = request.getParameter("secCode");
        String email = request.getParameter("email");
        String msg = userService.doRegister(request, username, password, password2, email, secCode);
        Map<String, Object> map = new HashMap<>();
        map.put("msg", msg);
        return map;
    }



   /* //登陆
    @RequestMapping("/doLogin")
    @ResponseBody
    public String doLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        String password = request.getParameter("pwd");

        if("".equals(name)){
            return "{'result':'账号不能为空'}";
        }else{
            if("".equals(password)){
                return "{'result':'密码不能为空'}";
            }
        }
        String ticket = userService.doLogin(name,password);


        //判断
        if("".equals(ticket)||"null".equals(ticket)||ticket==null){
            //登录失败，ajax提交。返回失败信息
            return "{'result':'登陆失败'}";
        }else{
            CookieUtils.setCookie(request,response,"JT_TICKET",ticket);
            return "{'result':'登录成功'}";
        }
        return "";
    }*/


   /* //登陆
    @RequestMapping("/doLogin")
    @ResponseBody
    public Map<String, Object> doLogin (String account,HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        String password = request.getParameter("pwd");
        Map<String,Object> map = new HashMap<>();
        if ("".equals(name)) {
            map.put("msg","账号不能为空");
        } else {
            if ("".equals(password)) {
                map.put("msg", "密码不能为空");
            } else {
                String ticket = userService.doLogin(name, password,request);
                if ("".equals(ticket) || "null".equals(ticket) || ticket == null) {
                    //登录失败，ajax提交。返回失败信息
                    map.put("msg", "登陆失败");
                } else {
                    HttpSession session = request.getSession();
                    session.setMaxInactiveInterval(30 * 60);
                    System.out.println(name);
                    session.setAttribute("userName",name);
                    Cookie c = new Cookie("JSESSIONID", session.getId());
                    c.setMaxAge(60 * 30);
                    response.addCookie(c);
                    map.put("msg", "true");
                }
            }
        }

        return map;
    }*/

    @RequestMapping("/doLogin")
    public String doLogin(String loginName, String password, Model model, HttpServletRequest request, HttpServletResponse response) {

        if ("".equals(loginName)) {
            model.addAttribute("msg", "登录名不能为空");
            return "user_sign_in";
        }
        if ("".equals(password)) {
            model.addAttribute("msg", "密码不能为空");
            return "user_sign_in";
        }

        User user = userService.doLogin(loginName, password);
        if (user != null) {
            // 将用户登录信息加入cookie中
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(30 * 60);

            session.setAttribute("user", user);
            Cookie c = new Cookie("JSESSIONID", session.getId());
            c.setMaxAge(60 * 30);
            response.addCookie(c);
            return "redirect:/tomain";
        }

        model.addAttribute("msg", "登录名或密码错误");

        return "user_sign_in";
    }


    @RequestMapping("/doLogout")
    public String doLogout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();

        }
        return "redirect:/index.jsp";
    }

}
