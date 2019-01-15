<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.cyber.pojo.User" %>
<% User user = (User) session.getAttribute("user");
    if (user != null) {%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="/static/css/user_fav.css">
    <link rel="stylesheet" href="/static/css/footstyle.css">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/static/img/favicon.ico"/>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery-1.4.2.js"></script>
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .bg {
            width: 100%;
            height: 1350px;
            position: relative;
            background: url("/static/img/b2.jpg") no-repeat fixed;
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
<body class="fav_body">
<!--nav-->
<div class="fav_nav navbar navbar-inverse">
    <div class="container-fluid title">
        <div class="navbar-header">
            <a class="navbar-brand" href="/tomain">
                <img alt="logo" src="/static/img/logo.png">
            </a>
        </div>
    </div>
    <ul class="nav nav-pills navbar-right">
        <!--<li class="upload_nav_li1 active" role="presentation">主页</li>-->
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
    <!--userInfo-->
    <div class="drag" style="width: 90%;margin-left: 5%;margin-top: 2%">
        <div class="fav_user_info_area1 fav_user_info">
            <!--<i class="fa fa-user fa-4x"></i>-->
            <div>
                <div style="text-align:center;">
                    <img src="/static/img/fav1.jpg" class="img-rounded img-thumbnail shadow_effect">
                </div>
                <div class="panel panel-default col-lg-9 center-block" style="margin-top: 5%;float: none">
                    <!-- Default panel contents -->
                    <div class="panel-heading">个人资料</div>
                    <!-- List group -->
                    <ul class="list-group">
                        <li class="list-group-item">用户名：${userone.userName}</li>
                        <li class="list-group-item">性别：${userInfo.sex}</li>
                        <li class="list-group-item">年龄：22</li>
                        <li class="list-group-item">用户邮箱：${userone.email}</li>
                        <li class="list-group-item">个人简介：${userInfo.userDesc}</li>
                    </ul>
                </div>
                <p style="margin-left: 185px">
                    <a href=""
                       class="btn btn-primary to_small" role="button">完善信息</a>
                    <!-- <a href="#" class="btn btn-default to_small" role="button">编辑</a> -->
                </p>

            </div>
        </div>
        <div class="fav_user_info_area2">
            <div>
                <div class="fav_user_info_area2_fav1">
                    <div class="to_small col-xs-12 col-sm-6 col-md-6 col-lg-3 shadow_effect">
                        <div class="thumbnail">
                            <img src="/static/img/fav1.jpg" alt="..." class="stackone to_small">
                            <div class="caption">
                                <h3>文 章</h3>
                                <!-- <p>xx</p> -->
                                <p>
                                    <a href="/moreArticle?userId=${sessionScope.user.userId}"
                                       class="btn btn-primary to_small" role="button">进入</a>
                                    <!--  <a href="#" class="btn btn-default to_small" role="button">编辑</a> -->
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="to_small col-xs-12 col-sm-6 col-md-6 col-lg-3 shadow_effect">
                        <div class="thumbnail">
                            <img src="/static/img/fav1.jpg" alt="..." class="stackone to_small">
                            <div class="caption">
                                <h3>资 源</h3>
                                <!-- <p>xx</p> -->
                                <p>
                                    <a href="/moreResource?userId=${sessionScope.user.userId}&currPage=1"
                                       class="btn btn-primary to_small" role="button">进入</a>
                                    <!-- <a href="#" class="btn btn-default to_small" role="button">编辑</a> -->
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="to_small col-xs-12 col-sm-6 col-md-6 col-lg-3 shadow_effect">
                        <div class="thumbnail">
                            <img src="/static/img/fav1.jpg" alt="..." class="stackone to_small">
                            <div class="caption">
                                <h3>专 栏</h3>
                                <!-- <p>xx</p> -->
                                <p>
                                    <a href="#" class="btn btn-primary to_small" role="button">进入</a>
                                    <!--  <a href="#" class="btn btn-default to_small" role="button">编辑</a> -->
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="to_small col-xs-12 col-sm-6 col-md-6 col-lg-3 shadow_effect">
                        <div class="thumbnail">
                            <img src="/static/img/fav1.jpg" alt="..." class="stackone to_small">
                            <div class="caption">
                                <h3>清 单</h3>
                                <!-- <p>xx</p> -->
                                <p>
                                    <a href="/tolist/${sessionScope.user.userId}" class="btn btn-primary to_small"
                                       role="button">进入</a>
                                    <!-- <a href="#" class="btn btn-default to_small" role="button">编辑</a> -->
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="add_fav_title">
                    <h2 style="color: #fff">收藏文章列表</h2>
                </div>
                <div class="add_fav_cate1">
                    <c:forEach items="${favoriteArticleList }" var="article">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 10px">
                            <div class="panel panel-default">
                                <div class="panel-heading"><a
                                        href="/showArtiById?articleId=${article.articleId }">${article.articleName }</a>
                                </div>
                                <div class="panel-body">
                                        ${article.articleContent }
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <%-- <div class="add_fav_cate2">
                     <div class=" col-xs-12 col-lg-12 col-md-6">
                         <div class="list-group">
                             <a href="#" class="list-group-item active">
                                 Cras justo odio
                             </a>
                             <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                             <a href="#" class="list-group-item">Morbi leo risus</a>
                             <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                             <a href="#" class="list-group-item">Vestibulum at eros</a>
                         </div>
                     </div>
                     <div class=" col-xs-12 col-lg-12 col-md-6">
                         <div class="list-group">
                             <a href="#" class="list-group-item active">
                                 Cras justo odio
                             </a>
                             <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                             <a href="#" class="list-group-item">Morbi leo risus</a>
                             <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                             <a href="#" class="list-group-item">Vestibulum at eros</a>
                         </div>
                     </div>
                 </div>--%>
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
<%} else { %>
<%response.sendRedirect("index.jsp"); %>
<%} %>