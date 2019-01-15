<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>资源修改</title>
    <link rel="stylesheet" href="/static/css/user_upload.css">
    <link rel="stylesheet" href="/css/main.css"/>
    <link rel="stylesheet" href="/static/css/footstyle.css">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/static/img/favicon.ico"/>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery-1.4.2.js"></script>
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/tbdValidate.js"></script>
    <script type="text/javascript" src="/js/upload.js"></script>
    <style>
        .bg {
            width: 100%;
            height: 1280px;
            position: relative;
            background: url("/static/img/b20.jpg") no-repeat fixed;
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
</head>
<body class="upload_body">
<!--nav-->
<div class="upload_nav navbar navbar-inverse">
    <div class="container-fluid title">
        <div class="navbar-header">
            <a class="navbar-brand" href="/tomain">
                <img alt="logo" src="/static/img/logo.png">
            </a>
        </div>
    </div>
    <!--<ul class="nav nav-pills">
        <li class="upload_nav_li2" role="presentation"><a>发布新资源</a></li>
        <li class="upload_nav_li3" role="presentation"><a>收藏</a></li>
        <li class="upload_nav_li4" role="presentation"><a>个人中心</a></li>
        <li class="upload_nav_li4" role="presentation"><a>注销</a></li>
    </ul>-->
    <ul class="nav nav-pills " style="margin-top: 15px">
        <li class="upload_nav_li2 dropdown" role="presentation">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                发布<b class="caret"></b>
            </a>
            <ul class="nav dropdown-menu ">
                <li style="text-align: center"><a href="/article">文章发表</a></li>
                <li style="text-align: center"><a href="/file/">资源分享</a></li>
            </ul>
        </li>
        <li class="upload_nav_li4" role="presentation"><a href="/favorite?userId=${sessionScope.user.userId}">个人中心</a>
        </li>
        <li class="upload_nav_li4" role="presentation"><a href="/doLogout">注销</a></li>

    </ul>
</div>
<div class="bg">
    <div class="drag" style="width: 90%;margin-top: 3%;margin-left: 5%">
        <!--menu-->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Brand</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <!--<button type="submit" class="btn btn-default">Submit</button>-->
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <!--editArea-->
        <div class="upload_edit_area">

            <form method="post" action="/update/${one.resourceId}" enctype="multipart/form-data"
                  style="margin-left:100px;margin-top:10px">
                <div class="content">
                    <div class="register-box">
                        <div class="wrap">
                            <div class="register-box-con2">
                                <div class="register-box-con2-box clearfix mar-bottom20">
                                    <label class="register-box-con2-box-left"><em class="bitian">*</em>资源名称</label>
                                    <div class="register-box-con2-box-right">
                                        <input type="text" class="login-box-cen-form-input w358"
                                               placeholder="请输入资源名称，不超过20个字" id="reg_info_company" name="resourceName"
                                               value="${one.resourceName}"/>
                                        <label id="reg_info_company_text" class="err err-top40">请输入资源名称，不超过20个字</label>
                                    </div>
                                </div>
                                <div class="register-box-con2-box clearfix mar-bottom20">
                                    <label class="register-box-con2-box-left"><em class="bitian">*</em>粗略图</label>
                                    <div class="register-box-con2-box-right">
                                        <label class="register-box-con2-box-upload">
                                            <input type="file" name="fileName" id="reg_info_file"/>
                                            <div class="register-box-con2-box-upload-ti"><em
                                                    id="reg_info_file_w"></em><img src="${one.resourcePicture}"
                                                                                   id="reg_info_file_base64"
                                                                                   width="200px" height="100px"/></div>
                                        </label>
                                        <p class="register-box-con2-box-pw">1.支持图片格式JPG/PNG，图片大小不超过2M</p>
                                        <label class="err err-top160"
                                               id="reg_info_file_text">支持图片格式JPG/PNG，图片大小不超过2M</label>
                                    </div>
                                </div>
                                <div><input type="text" name="resourcePicture" value="${one.resourcePicture}"
                                            hidden="hidden"></div>
                                <div class="register-box-con2-box clearfix mar-bottom20">
                                    <label class="register-box-con2-box-left"><em class="bitian"></em>资源类型</label>
                                    <div class="register-box-con2-box-right">

                                        <select name="type.typeId" style="width: auto; min-width: 100px; height:30px;">
                                            <c:forEach items="${typeList}" var="t" varStatus="status">
                                                <option value="${t.typeId}">${t.typeName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="register-box-con2-box clearfix mar-bottom20">
                                    <label class="register-box-con2-box-left"><em class="bitian"></em>资源分类</label>
                                    <div class="register-box-con2-box-right">
                                        <select name="category.categoryId"
                                                style="width: auto; min-width: 100px; height: 30px;">
                                            <c:forEach items="${categorylist}" var="cl" varStatus="status">
                                                <option value="${cl.categoryId}">${cl.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="register-box-con2-box clearfix mar-bottom20">
                                    <label class="register-box-con2-box-left"><em class="bitian"></em>资源链接</label>
                                    <div class="register-box-con2-box-right">
                                        <input type="text" class="login-box-cen-form-input w358" placeholder="请输入正确的网址"
                                               id="reg_info_www" name="resourcePath" value="${one.resourcePath}"/>
                                        <label class="err err-top40" id="reg_info_www_text">请输入正确的网址</label>
                                    </div>
                                </div>
                                <div class="register-box-con2-box clearfix mar-bottom20">
                                    <label class="register-box-con2-box-left"><em class="bitian"></em>资源密码</label>
                                    <div class="register-box-con2-box-right">
                                        <input type="text" class="login-box-cen-form-input w358"
                                               placeholder="请输入资源密码，如百度网盘，无密码请略过" id="reg_info_address"
                                               name="resourcePwd" value="${one.resourcePwd}"/>
                                    </div>
                                </div>
                                <div class="register-box-con2-box clearfix mar-bottom20">
                                    <label class="register-box-con2-box-left"><em class="bitian"></em>资源描述</label>
                                    <div class="register-box-con2-box-right">
                                    <textarea class="login-box-cen-form-textarea w358 h88" id="reg_info_textarea"
                                              placeholder="描述不超过200个字....."
                                              name="resourceDesc">${one.resourceDesc}</textarea>
                                        <label class="err err-top90" id="reg_info_textarea_text">描述不超过200个字</label>
                                    </div>
                                </div>
                                <div class="register-box-con2-box clearfix mar-bottom20 mar-top50">
                                    <label class="register-box-con2-box-left"></label>
                                    <div class="register-box-con2-box-right">
                                        <input type="submit" value="确认修改" class="login-box-cen-form-button w380"
                                               id="reg_info_submit"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
<script type="text/javascript" src="/js/tbdValidate.js"></script>
<script type="text/javascript" src="/js/upload.js"></script>
<script type="text/javascript">
    $(function () {
        //demo2
        var regconfig = [
            {
                eleinput: "reg_info_company",
                eletext: "reg_info_company_text",
                rule: [{reg: /^.+$/, text: "资源名称不能为空"}, {reg: /^.{1,20}$/, text: "资源名称不超过20个字"}]
            }
        ];
        tbdValidate(
            regconfig,
            {
                elesubmit: "reg_info_submit",//提交按钮
                funsubmit: function () {//验证通过可提交回调
                    if ($("#reg_info_file_base64").attr("src")) {
                        $("#reg_info_file_text").hide();
                    } else {
                        $("#reg_info_file_text").html('请上传图片').show();
                        return false;
                    }
                    ;
                    //信息提交接口
                    alert("成功");
                },
                funerr: function () {//不可提交回调
                    if ($("#reg_info_file_base64").attr("src")) {
                        $("#reg_info_file_text").hide();
                    } else {
                        $("#reg_info_file_text").html('请上传图片').show();
                        return false;
                    }
                    ;
                },
                funerrlist: function (errlist) {
                    $('#' + errlist[0]).focus();
                }
            }
        );
        var noregconfig = [
            {
                eleinput: "reg_info_www",
                eletext: "reg_info_www_text",
                rule: [{
                    reg: /(^(((^https?:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)$)|(^$)/,
                    text: "请输入正确的连接"
                }]
            },
            {
                eleinput: "reg_info_textarea",
                eletext: "reg_info_textarea_text",
                rule: [{reg: /^.{0,200}$/, text: "描述不超过200个字"}]
            }
        ];
        tbdnoValidate(noregconfig);

    });
</script>
</html>