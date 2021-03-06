<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主界面</title>
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="/static/css/footstyle.css">
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
<body class="main_body">
<!--nav-->
<div class="main_nav navbar navbar-inverse navbar-fixed-top">
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
<!--hot-->
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
<!--menu-->
<!--<div class="main_menu navbar navbar-default navbar-static-top">-->
<!--<ul class="nav navbar-nav">-->
<!--<li class="main_menu_li1"><a>文章</a></li>-->
<!--<li class="main_menu_li2"><a>视频</a></li>-->
<!--</ul>-->
<!--<div class="col-xs-4 col-sm-4 col-md-4 col-lg-2 ">-->
<!--<div class="input-group">-->
<!--<input type="text" class="form-control" placeholder="Search for...">-->
<!--<span class="input-group-btn">-->
<!--<button class="btn btn-default" type="button">Go!</button>-->
<!--</span>-->
<!--</div>&lt;!&ndash; /input-group &ndash;&gt;-->
<!--</div>&lt;!&ndash; /.col-lg-6 &ndash;&gt;-->
<!--</div>&lt;!&ndash; /.row &ndash;&gt;-->

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
            <a class="navbar-brand" href="#">分类</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#">文章 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">视频</a></li>
                <li><a href="#">图片</a></li>
                <li><a href="#">音频</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">其他 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">书籍</a></li>
                        <li><a href="#">文档</a></li>
                        <li><a href="#">软件</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search...">
                </div>
                <button type="submit" class="btn btn-default">
                    <i class="fa fa-search"></i>
                </button>
            </form>
            <!--<ul class="nav navbar-nav navbar-right">-->
            <!--<li><a href="#">Link</a></li>-->
            <!--<li class="dropdown">-->
            <!--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"-->
            <!--aria-expanded="false">Dropdown <span class="caret"></span></a>-->
            <!--<ul class="dropdown-menu">-->
            <!--<li><a href="#">Action</a></li>-->
            <!--<li><a href="#">Another action</a></li>-->
            <!--<li><a href="#">Something else here</a></li>-->
            <!--<li role="separator" class="divider"></li>-->
            <!--<li><a href="#">Separated link</a></li>-->
            <!--</ul>-->
            <!--</li>-->
            <!--</ul>-->
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!--secHot-->
<div class="row">
    <div class="col-sm-12 col-md-6 col-lg-6">
        <a href="#" class="thumbnail">
            <img src="/static/img/redis.jpg" style="height: 100% ;width:100%">
        </a>
    </div>
    <div class="col-xs-6 col-md-3 col-lg-6">
        <a href="#" class="thumbnail">
            <img src="/static/img/redis.jpg" style="height: 100% ;width:100%">
        </a>
    </div>
</div>
<!--thiHot-->
<div class="main_hot_thi">
    <div class="main_hot_thi_area1">
        <div class="main_hot_thi_area1_a1 col-xs-12 col-lg-6 col-md-6">
            <ul class="list-group">
                <c:forEach items="${resourceList}" var="resource" varStatus="Status">
                    <li class="list-group-item"><i class="fa fa-weibo" style="margin-right: 10px"></i>
                        视频
                        <a href="#">${resource.resourceName}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="main_hot_thi_area1_a2 col-xs-12 col-lg-6 col-md-6">
            <ul class="list-group">
                <li class="list-group-item"><i class="fa fa-apple" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-apple" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-apple" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-apple" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-apple" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-apple" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-apple" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-apple" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-apple" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-apple" style="margin-right: 10px"></i>111</li>
            </ul>
        </div>
    </div>
    <!--<div class="main_hot_thi_area2">
        <div class="main_hot_thi_area2_a1 col-xs-12 col-lg-6 col-md-6">
            <ul class="list-group">
                <li class="list-group-item"><i class="fa fa-safari" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-safari" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-safari" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-safari" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-safari" style="margin-right: 10px"></i>111</li>
            </ul>
        </div>
        <div class="main_hot_thi_area2_a2 col-xs-12 col-lg-6 col-md-6">
            <ul class="list-group">
                <li class="list-group-item"><i class="fa fa-whatsapp" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-whatsapp" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-whatsapp" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-whatsapp" style="margin-right: 10px"></i>111</li>
                <li class="list-group-item"><i class="fa fa-whatsapp" style="margin-right: 10px"></i>111</li>
            </ul>
        </div>
    </div>-->
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
<script>
    $('li.dropdown').mouseover(function () {
        $(this).addClass('open');
    }).mouseout(function () {
        $(this).removeClass('open');
    });

</script>
</html>