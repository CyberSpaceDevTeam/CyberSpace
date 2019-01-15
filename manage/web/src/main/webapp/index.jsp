<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/static/css/index.css"/>">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/footstyle.css">
    <link rel="stylesheet" href="/static/css/animate.min.css">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/static/img/favicon.ico"/>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery-1.4.2.js"></script>
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#myCarousel').carousel({interval: 2000});
        });
    </script>
</head>
<body>
<!--nav-->
<div class="index_nav navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid title">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.jsp">
                <img alt="logo" src="/static/img/logo.png">
            </a>
        </div>
    </div>
    <ul class="nav nav-pills navbar-right">
        <li class="index_nav_li1" role="presentation"><a href="/user_sign_in">登录</a></li>
        <li class="index_nav_li2" role="presentation"><a href="/user_register">注册</a></li>
    </ul>
</div>
<!--carousel-->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="/static/img/register1.JPG" alt="First slide"/>
        </div>
        <div class="item">
            <img src="/static/img/bg1.jpg" alt="Second slide"/>
        </div>
        <div class="item">
            <img src="/static/img/bg3.jpg" alt="Third slide"/>
        </div>
    </div>
</div>
<div style="margin-bottom: 300px">
    <!--class="infinite"-->
    <div class="sec-area animated slideInRight">
        <span>Resource Sharing Platform</span>
    </div>
    <div>
        <div class="thi-area col-lg-4 col-md-4 col-xs-12">
            <span class="icon fa fa-file-code-o fa-4x"></span>
            <div>
                <h3>Resource Exchange</h3>
                <p>依托于开源精神，实现资源分享</p>
            </div>
        </div>
        <div class="thi-area col-lg-4 col-md-4 col-xs-12">
            <span class="icon fa fa-chevron-circle-down fa-4x"></span>
            <h3>TF-IDF</h3>
            <p>算法加成，推荐给你最爱的</p>
        </div>
        <div class="thi-area col-lg-4 col-md-4 col-xs-12">
            <span class="icon fa fa-heartbeat fa-4x"></span>
            <h3>Exclusive Customization</h3>
            <p>根据兴趣爱好，打造专属收藏</p>
        </div>
    </div>
    <div class="sec-area animated slideInRight">
        <span>Technical Construction</span>
    </div>
    <div>
        <div class="pic-area col-lg-4 col-md-4 col-xs-12">
            <span class="fa fa-battery-three-quarters fa-4x"></span>
            <div>
                <h3>Elasticsearth</h3>
                <p>从古老的酋长，到大数据时代的检索</p>
            </div>
        </div>
        <div class="pic-area col-lg-4 col-md-4 col-xs-12">
            <span class="fa fa-edge fa-4x"></span>
            <div>
                <h3></h3>
                <p>We use our iOs mobile app with our in-house tech to connect you to the nearest supplier of services.
                    We are the ‘uber’ for waste. No more flicking through google or worrying if the guy picking up your
                    goods is &nbsp;licensed.</p>
            </div>
        </div>
        <div class="pic-area col-lg-4 col-md-4 col-xs-12">
            <span class="fa fa-xing fa-4x"></span>
            <div>
                <h3>Redis</h3>
                <p>逃离雪崩</p>
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
