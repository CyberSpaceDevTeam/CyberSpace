<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>register</title>
    <link rel="stylesheet" href="/static/css/user_register.css">
    <link rel="stylesheet" href="/static/css/footstyle.css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/static/img/favicon.ico"/>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
    <style>
        .bg {
            width: 100%;
            height: 1280px;
            position: relative;
            background: url("/static/img/b22.jpg") no-repeat fixed;
            padding: 1px;
            box-sizing: border-box;
        }

        .bg:after {
            content: "";
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            background: inherit;
            filter: blur(3px);
            z-index: 1;
        }

    </style>
    <script>
        //校验邮箱是否为空。格式是否正确，正确开启点击按钮，进行验证码发送
        /*function check(param,msg1,msg2) {
            //alert( document.getElementById("yzm").getElementsByTagName("a")[0].innerText)
            var em = document.getElementById(param).value;
            var reg = /^\w+@\w+(\.\w+)+$/;  //邮箱的正则匹配式
            if($.trim(em)==""){
                this.setMsg(param,msg1)
                return
            }
            if(reg.test(em)){
                document.getElementById("yzm").disabled = false;
                this.setMsg(param,"")
            }else{
                document.getElementById("yzm").disabled = true;
                this.setMsg(param,msg2)
            }
        }*/

        //验证邮箱。非空，格式。是否存在，然后开启点击验证码功能
        function check(param, msg1, msg2) {
            //alert( document.getElementById("yzm").getElementsByTagName("a")[0].innerText)
            var em = document.getElementById(param).value;
            var reg = /^\w+@\w+(\.\w+)+$/;  //邮箱的正则匹配式
            this.checkNull(param, msg1)
            if (reg.test(em)) {
                this.isExists(param, 2)
                this.setMsg(param, "")
            } else {
                this.setMsg(param, msg2)
            }
        }

        //验证码倒计时
        var oldertime = 20
        var timeleft = oldertime;

        function timeCount() {
            timeleft -= 1
            if (timeleft > 0) {
                document.getElementById("yzm").disabled = true;
                document.getElementById("yzm").getElementsByTagName("a")[0].innerText = "请在" + timeleft + "秒后再次获取";
                setTimeout(timeCount, 1000)
            } else {
                //document.getElementById("yzm").disabled =
                document.getElementById("yzm").getElementsByTagName("a")[0].innerText = "请重新发送";
                timeleft = oldertime   //重置等待时间
                document.getElementById("yzm").disabled = false;
            }
        }

        //发送验证码
        function sendMsg() {
            var to = document.getElementById("inputEmail").value

            //ajax的异步请求
            $.ajax({
                url: "/sendYZM",
                data: {to: to},//data中存放的为deptId的key 和 value
                //contentType:'application/json;charset=utf-8',
                type: "post",//请求的发送方式
                dataType: 'json',//结果的返回值类型
                success: function (data) {

                }
            })
        }

        /*  //验证验证码是否正确
          function checkYZM(param){
              alert(112)
              yzm = document.getElementById(param).value
              $.ajax({
                  url:"/indexmain",
                  data:{yzm:yzm},
                  type:"post",
                  dataType:"json",
                  success:function () {
                      if(data.msg == null ||"".equals(data.msg)){
                          this.msgSet(data.msg)
                      }
                  }
              })
          }
  */
        //判断用户名，密码，确认密码，邮箱。
        function checkNull(param, msg) {
            var value = document.getElementById(param).value
            if ($.trim(value) == "") {
                this.setMsg(param, msg)
            } else {
                this.setMsg(param, "")
            }
        }

        //前台验证发送消息到页面
        function setMsg(param, msg) {
            $("input[id='" + param + "']").nextAll("span").html(msg).css("color", "red");
        }


        //后台验证发送消息到页面
        function msgSet(msg) {
            //更换span标签中的值
            document.getElementById("msg").innerHTML = msg

        }

        //注册
        function doRegister() {
            email = document.getElementById("inputEmail").value
            username = document.getElementById("inputUserName").value
            password = document.getElementById("inputPwd").value
            passwrpd2 = document.getElementById("inputPwd2").value
            secCode = document.getElementById("inputSecCode").value

            $.ajax({
                url: "/doRegister",
                data: {username: username, email: email, password: password, password2: passwrpd2, secCode: secCode},
                type: "post",
                dataType: 'json',
                success: function (data) {
                    alert(lalala)
                    if (data.msg == null) {
                        //注册成功
                        window.location.href = "${pageContext.request.contextPath}/user_sign_in.jsp"

                        // TO-DO
                    } else {
                        //注册失败
                        $("#msg").html("<font style='color:darkblue;font-size: 18px'>" + data.msg + "</font>");
                        //window.location.href="/user_register"

                    }
                }
            })
        }


        //验证用户名和邮箱是否存在
        function isExists(param, type) {
            //验证用户名
            if ("inputUserName" == param) {
                this.checkNull(param, '用户名不可以为空')
                var username = document.getElementById(param).value
                if ("" != username) {
                    $.ajax({
                        url: "/checkParam",
                        //param代表当前属性的id值
                        data: {param: username, type: type},
                        type: "post",
                        dataType: 'json',
                        success: function (data) {

                            if (data.msg == "用户名已存在") {
                                $("input[id='" + param + "']").nextAll("span").html(data.msg).css("color", "red");


                            }
                        }
                    })
                }
            }
            if ("inputEmail" == param) {
                email = document.getElementById(param).value
                if ("" != email) {
                    $.ajax({
                        url: "/checkParam",
                        data: {param: email, type: type},
                        type: "post",
                        dataType: 'json',
                        success: function (data) {
                            if (data.msg == "邮箱已存在") {
                                $("input[id='" + param + "']").nextAll("span").html(data.msg).css("color", "red");
                                document.getElementById("yzm").disabled = true;
                            } else {
                                document.getElementById("yzm").disabled = false;

                            }
                        }

                    })
                }
            }
        }


    </script>
</head>
<body class="register_body">
<!--nav-->

<div class="register_nav navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.html">

                <img alt="logo" src="/static/img/logo.png">
            </a>
        </div>
    </div>
</div>

<div class="bg">
    <div class="register_h drag" style="width: 40%;margin-top: 5%;margin-left: 31%">
        <div class="container" style="margin-left: -27%;margin-top: -10%;">
            <div class="row">
                <div class="col-md-offset-3 col-md-6">

                    <form class="form-horizontal">
                        <span class="heading">用户注册</span><br>
                        <span id="msg"></span>
                        <div class="form-group">

                            <input type="text" class="form-control" id="inputUserName"
                                   placeholder="用户名" onblur="isExists('inputUserName',1)">
                            <span></span>
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="form-group help">
                            <input type="password" class="form-control" id="inputPwd"
                                   placeholder="密 码" onblur="checkNull('inputPwd','密码不能为空')">
                            <span></span>
                            <i class="fa fa-lock">

                            </i>
                            <a href="#" class="fa fa-question-circle"></a>
                        </div>
                        <div class="form-group help">
                            <input type="password" class="form-control" id="inputPwd2"
                                   placeholder="确认密码" onblur="checkNull('inputPwd2','确认密码不能为空')">
                            <span></span>
                            <i class="fa fa-lock"></i>
                            <a href="#" class="fa fa-question-circle"></a>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" id="inputEmail"
                                   placeholder="邮箱" onblur="check('inputEmail','邮箱不能为空','邮箱格式不正确')">
                            <span></span>
                            <i class="fa fa-at"></i>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="inputSecCode"
                                   placeholder="验证码">
                            <span></span>
                            <i class="fa fa-code">
                                <span></span>
                            </i>
                        </div>
                        <div class="form-group">
                            <!--<div class="main-checkbox">-->
                            <!--<input type="checkbox" value="None" id="checkbox1"-->
                            <!--name="check">-->
                            <!--<label for="checkbox1"></label>-->
                            <!--</div>-->
                            <!--<span class="text">获取验证码</span>-->

                            <button type="submit" class="re-btn btn-default" onclick="msgSet()">
                                <a href="user_sign_in.html">返回</a>
                            </button>
                            <button type="submit" class="btn btn-default" onclick="doRegister()">
                                <a href="#">注册</a>
                            </button>
                            <button type="submit" class="btn btn-default" onclick="sendMsg();timeCount()"
                                    disabled="disabled" id="yzm">
                                <a>验证码</a>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<!--foot-->
<footer class="container-fluid foot-wrap">
    <!--采用container，使得页尾内容居中 -->
    <div class="container">
        <div class="row">
            <div class="row-content col-lg-2 col-sm-4 col-xs-6">
                <h3>Subscribe</h3>
                <ul>
                    <li><a href="#">Newsletter</a></li>
                    <li><a href="#">RSS feed</a></li>
                    <li><a href="#">RSS to Email</a></li>
                    <li><a href="#">Product Hunt</a></li>
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Pinterest</a></li>
                    <li><a href="#">Google+</a></li>
                </ul>
            </div>
            <div class="row-content col-lg-2 col-sm-4 col-xs-6">
                <h3>BROWSE</h3>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Gallery</a></li>
                    <li><a href="#">Templates</a></li>
                    <li><a href="#">Resources</a></li>
                    <li><a href="#">OPL Themes</a></li>
                </ul>
            </div>
            <div class="row-content col-lg-2 col-sm-4 col-xs-6">
                <h3>INFORMATION</h3>
                <ul>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Why One Page?</a></li>
                    <li><a href="#">OPL Blog</a></li>
                    <li><a href="#">Product Hunt</a></li>
                    <li><a href="#">Advertise</a></li>
                    <li><a href="#">Submit</a></li>
                    <li><a href="#">Award Ribbons</a></li>
                    <li><a href="#">Roadmap</a></li>
                </ul>
            </div>

            <div class="row-content col-lg-2 col-sm-4 col-xs-6">
                <h3>RESOURCES</h3>
                <ul>
                    <li><a href="#">Browse All</a></li>
                    <li><a href="#">Design</a></li>
                    <li><a href="#">Development</a></li>
                    <li><a href="#">Hosting</a></li>
                    <li><a href="#">Round Ups</a></li>
                    <li><a href="#">Tutorials</a></li>
                </ul>

            </div>
            <div class="row-content col-lg-2 col-sm-4 col-xs-6">
                <h3>TRENDING</h3>
                <ul>
                    <li><a href="#">Big Typography</a></li>
                    <li><a href="#">Free Templates</a></li>
                    <li><a href="#">Most Loved</a></li>
                    <li><a href="#">Centrally Divided</a></li>
                    <li><a href="#">Skrollr.js</a></li>
                    <li><a href="#">Parallax Scrolling</a></li>
                    <li><a href="#">Off-Canvas Menu</a></li>
                    <li><a href="#">Molecules</a></li>
                </ul>
            </div>
            <div class="row-content col-lg-2 col-sm-4 col-xs-6">
                <h3>OPL THEMES</h3>
                <ul>
                    <li><a href="#">Browse All</a></li>
                    <li><a href="#">East Java</a></li>
                    <li><a href="#">Clutterless</a></li>
                    <li><a href="#">Mapped</a></li>
                </ul>
            </div>

        </div><!--/.row -->
    </div><!--/.container-->

    <!-- 社交图标列表，其中图标采用的是Font Awesome图标字体库-->
    <ul class="social">
        <li>
            <a href="#" title="Twitter Profile">
                <twitter><span class="icon fa fa-twitter fa-2x to_rotate"></span></twitter>
            </a>
        </li>
        <li>
            <a href="#" title="Facebook Page">
                <span class="icon fa fa-facebook fa-2x to_rotate"></span>
            </a>
        </li>
        <li>
            <a href="#" title="LinkedIn Profile">
                <linkedIn><span class="icon fa fa-linkedin fa-2x to_rotate"></span></linkedIn>
            </a>
        </li>
        <li>
            <a href="#" title="Goole+ Profile">
                <google><span class="icon fa fa-google fa-2x to_rotate"></span></google>
            </a>
        </li>
        <li>
            <a href="#" title="Github Profile">
                <github><span class="icon fa fa-github fa-2x to_rotate"></span></github>
            </a>
        </li>
    </ul>
    <p align="center" style="margin-top: 20px;color:#878B91;">
        Copyright &copy;2018 CyberSpace
    </p>
</footer>
</body>
</html>