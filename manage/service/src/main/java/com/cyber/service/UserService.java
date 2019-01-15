package com.cyber.service;


import com.cyber.common.redis.RedisService;
import com.cyber.mapper.UserMapper;
import com.cyber.pojo.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

//    //校验参数
//    public String checkParam(String param, String type) {
//        //判断type的值
//        if (type == "1") {
//            //查用户名
//            User user = userMapper.selectUserByName(param);
//            //如果查到返回用户名已经被使用
//            if (user != null) {
//                return "用户名已存在";
//            } else {
//                //查不到，返回空值,说明用户名可用
//                return "";
//            }
//        }
//        if (type == "2") {
//            //查email
//            User user = userMapper.selectUserByEmail(param);
//            //如果查到返回email已经被使用
//            if (user != null) {
//                return "邮箱已存在";
//            } else {
//                //查不到，返回空值
//                return "1";
//            }
//        }
//        return "1";
//    }

    public String checkParam(String param, String type) {
        //判断type的值
        if ("1".equals(type)) {
            //查用户名
            User user = userMapper.selectUserByName(param);
            //如果查到返回用户名已经被使用
            if (user != null) {
                return "用户名已存在";
            }
        }
        if ("2".equals(type)) {
            //查email
            User user = userMapper.selectUserByEmail(param);
            //如果查到返回email已经被使用
            if (user != null) {
                return "邮箱已存在";
            }
        }
        return "";
    }


    //发送验证码
    @Value("596820632@qq.com")
    private String from;
    @Autowired
    private JavaMailSender mailSender;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public void sendMail(String to, HttpServletRequest request) {
        System.out.println(to);
        System.out.println(from);
        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom(from);
        message.setTo(to);
        message.setSubject("欢迎您注册xxx论坛");
        String yzm = createRandomVcode();
        message.setText("您的验证码是：" + yzm + ",有效期为三分钟");
        try {
            mailSender.send(message);
            logger.info("简单邮件已经发送。");
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(3 * 60);//session有效时间为3分钟
            session.setAttribute("yzm", yzm);

        } catch (Exception e) {
            logger.error("发送简单邮件时发生异常！", e);
        }
    }

    //生成验证码
    public String createRandomVcode() {
        //验证码
        String vcode = "";
        for (int i = 0; i < 6; i++) {
            vcode = vcode + (int) (Math.random() * 9);
        }
        return vcode;
    }

    //注册
    public String doRegister(HttpServletRequest request, String username, String password, String password2, String email, String secCode) {

        if (username == null || "".equals(username)) {
            return "用户名不能为空";
        }
        if (userMapper.selectUserByName(username) != null) {
            return "用户名已存在";
        }
        if (password == null || "".equals(password)) {
            return "密码不能为空";
        }
        if (password2 == null || "".equals(password2)) {
            return "确认密码不能为空";
        }

        if (email == null || "".equals(email)) {
            return "邮箱不能为空";
        }
        if (userMapper.selectUserByEmail(email) != null) {
            return "邮箱已存在";
        }
        if (secCode == null || "".equals(secCode)) {
            return "验证码不能为空";
        }
        if (!password.equals(password2)) {
            return "两次密码不一致";
        }
        String YZM = (String) request.getSession().getAttribute("yzm");
        if (!secCode.equals(YZM)) {
            return "验证码输入有误";
        }


        //后台验证完成，然后将用户加入到数据库中
        User user = new User();
        user.setUserName(username);
        user.setUserPwd(DigestUtils.md5Hex(password));
        user.setEmail(email);
        userMapper.insertUser(user);
        request.getSession().setAttribute("yzm", "qw5de5");
        return "";

    }


    //登录逻辑
    @Autowired
    private RedisService redisService;

    /* public String doLogin(String name, String password, HttpServletRequest request) throws JsonProcessingException {

     *//* User user1 = new User();
        user1.setUserName(name);
        user1.setUserPwd((DigestUtils.md5Hex(password)));
        User user = userMapper.selectUserByNameAndPwd(name, password);
        if (user == null) {
            User user2 = new User();
            user2.setEmail(name);
            user2.setUserPwd((DigestUtils.md5Hex(password)));
            user = (User) userMapper.selectUserByEmailAndPwd(name, password);
            if (user == null) {
                return null;
            }
        }*//*

       // 先验证用户输入的用户名还是邮箱
        // 密码加密
        password = DigestUtils.md5Hex(password);
        // 邮箱查询
        User user = userMapper.selectUserByEmailAndPwd(name, password);
        if(user == null) {
            // 密码查询
            user = userMapper.selectUserByNameAndPwd(name, password);
        }
        if(user == null) {
            return null;
        }


        //登录成功

        //将user信息json存储到redis中，避免session共享
        String ticket = DigestUtils.md5Hex("CYBER_TICKET" + System.currentTimeMillis() + user.getUserName());
        *//*        String userJson = ObjectUtils.mapper.writeValueAsString(user);*//*
     *//*  redisService.set(ticket, userJson);*//*
        return ticket;
    }*/

    public User doLogin(String loginName, String password) {
        User user = null;
        // 密码加密
        password = DigestUtils.md5Hex(password);
        user = userMapper.selectUserByEmailAndPwd(loginName, password);
        if (user == null) {
            user = userMapper.selectUserByNameAndPwd(loginName, password);
        }
        return user;
    }

}

