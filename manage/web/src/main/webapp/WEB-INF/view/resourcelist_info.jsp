<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>资源清单列表</title>
    <link rel="stylesheet" href="/static/css/more_article.css">
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
            background: url("/static/img/b1.jpeg") no-repeat fixed;
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
<body class="more_art_body">
<!--nav-->
<div class="more_art_nav navbar navbar-inverse">
    <div class="container-fluid title">
        <div class="navbar-header">
            <a class="navbar-brand" href="/tomain">
                <img alt="logo" src="/static/img/logo.png">
            </a>
        </div>
    </div>
    <ul class="nav nav-pills navbar-right">
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
    <div class="drag" style="margin-left: 3%;margin-top: 2%">
        <!--main-->
        <div>
            <div class="more_art_main">
                <div class="page-header shadow_effect">
                    <h1>${rlist.resourcelistName}
                        <br>
                        <small>清单描述：${rlist.resourcelistDesc}</small>
                    </h1>
                    <table style="font-size:x-small">
                        <tr>
                            <td>作者：</td>
                            <td>${rlist.user.userName}</td>
                            <td>&nbsp;&nbsp;</td>
                            <td>创建时间：</td>
                            <td><fmt:formatDate value="${rlist.resourcelistCtime}" type="both"/></td>
                            <td>&nbsp;&nbsp;</td>
                            <td>点击量：</td>
                            <td>${rlist.resourcelistCount}</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="button" onclick="location.href=('/toAddResource/${rlist.resourcelistId}')"
                                       value="添加资源"></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="button" onclick="location.href=('/toUpdateList/${rlist.resourcelistId}')"
                                       value="修改清单"></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="button" onclick="location.href=('/toDeleteList/${rlist.resourcelistId}')"
                                       value="删除清单"></td>
                        </tr>
                    </table>

                </div>
                <c:forEach items="${resourceInfo}" var="r" varStatus="status">
                    <div class="panel panel-default">
                        <div class="panel-heading"><a href="/toviewOne/${r.resourceId}">${r.resourceName}</a></div>
                        <div class="panel-body shadow_effect">
                            content
                        </div>
                    </div>
                </c:forEach>
                <!--page-->
                <nav aria-label="Page navigation" style="text-align: center">
                    <ul class="pagination pagination-lg">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#" class="to_small">1</a></li>
                        <li><a href="#" class="to_small">2</a></li>
                        <li><a href="#" class="to_small">3</a></li>
                        <li><a href="#" class="to_small">4</a></li>
                        <li><a href="#" class="to_small">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="more_art_area">
                <div style="float: left">
                    <div>
                        <div class="to_small col-xs-12 col-sm-12 col-md-12 col-lg-6 shadow_effect">
                            <div class="thumbnail">
                                <img src="../static/img/fav1.jpg" alt="..." class="shadow_effect to_small">
                                <div class="caption">
                                    <h3>xx专题</h3>
                                    <p>xx</p>
                                    <p>
                                        <a href="#" class="btn btn-primary to_small" role="button">进入</a>
                                        <a href="#" class="btn btn-default to_small" role="button">收藏</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="to_small col-xs-12 col-sm-12 col-md-12 col-lg-6 shadow_effect">
                            <div class="thumbnail">
                                <img src="../static/img/fav1.jpg" alt="..." class="shadow_effect to_small">
                                <div class="caption">
                                    <h3>xx专题</h3>
                                    <p>xx</p>
                                    <p>
                                        <a href="#" class="btn btn-primary to_small" role="button">进入</a>
                                        <a href="#" class="btn btn-default to_small" role="button">收藏</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="to_small col-xs-12 col-sm-12 col-md-12 col-lg-6 shadow_effect">
                            <div class="thumbnail">
                                <img src="../static/img/fav1.jpg" alt="..." class="shadow_effect to_small">
                                <div class="caption">
                                    <h3>xx专题</h3>
                                    <p>xx</p>
                                    <p>
                                        <a href="#" class="btn btn-primary to_small" role="button">进入</a>
                                        <a href="#" class="btn btn-default to_small" role="button">收藏</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="to_small col-xs-12 col-sm-12 col-md-12 col-lg-6 shadow_effect">
                            <div class="thumbnail">
                                <img src="../static/img/fav1.jpg" alt="..." class="shadow_effect to_small">
                                <div class="caption">
                                    <h3>xx专题</h3>
                                    <p>xx</p>
                                    <p>
                                        <a href="#" class="btn btn-primary to_small" role="button">进入</a>
                                        <a href="#" class="btn btn-default to_small" role="button">收藏</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="float: left;padding-top: 50px" class="list-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <a href="#" class="list-group-item active">
                        阅读排行
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">14</span>111
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">14</span>222
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">14</span>333
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">14</span>444
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--foot-->
<footer style="float: left;width: 100%" class="container-fluid foot-wrap">
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
