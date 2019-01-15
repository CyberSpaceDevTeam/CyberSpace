<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文章详情</title>
    <link rel="stylesheet" href="/static/css/article_res.css">
    <%--
    <link rel="stylesheet" href="/static/css/footstyle.css">--%>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="/static/css/font-awesome.min.css">--%>
    <link rel="shortcut icon" href="/static/img/favicon.ico"/>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery-1.4.2.js"></script>
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /*.bg {
            width: 100%;
            height: 140em;
            position: relative;
            background: url("/static/img/b4.jpg") no-repeat fixed;
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
        }*/
        .container {
            width: 1000px;
        }

        .commentbox {
            width: 900px;
            margin: 20px auto;
        }

        .mytextarea {
            width: 100%;
            overflow: auto;
            word-break: break-all;
            height: 100px;
            color: #000;
            font-size: 1em;
            resize: none;
        }

        .comment-list {
            width: 900px;
            margin: 20px auto;
            clear: both;
            padding-top: 20px;
        }

        .comment-list .comment-info {
            position: relative;
            margin-bottom: 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid #ccc;
        }

        .comment-list .comment-info header {
            width: 10%;
            position: absolute;
        }

        .comment-list .comment-info header img {
            width: 100%;
            border-radius: 50%;
            padding: 5px;
        }

        .comment-list .comment-info .comment-right {
            padding: 5px 0px 5px 11%;
        }

        .comment-list .comment-info .comment-right h3 {
            margin: 5px 0px;
        }

        .comment-list .comment-info .comment-right .comment-content-header {
            height: 25px;
        }

        .comment-list .comment-info .comment-right .comment-content-header span,
        .comment-list .comment-info .comment-right .comment-content-footer span {
            padding-right: 2em;
            color: #aaa;
        }

        .comment-list .comment-info .comment-right .comment-content-header span,
        .comment-list .comment-info .comment-right .comment-content-footer span.reply-btn,
        .send, .reply-list-btn {
            cursor: pointer;
        }

        .comment-list .comment-info .comment-right .reply-list {
            border-left: 3px solid #ccc;
            padding-left: 7px;
        }

        .comment-list .comment-info .comment-right .reply-list .reply {
            border-bottom: 1px dashed #ccc;
        }

        .comment-list .comment-info .comment-right .reply-list .reply div span {
            padding-left: 10px;
        }

        .comment-list .comment-info .comment-right .reply-list .reply p span {
            padding-right: 2em;
            color: #aaa;
        }
    </style>
</head>
<body class="article_body">
<!--nav-->
<div class="article_nav navbar navbar-inverse">
    <div class="container-fluid title">
        <div class="navbar-header">
            <a class="navbar-brand" href="/tomain">
                <img alt="logo" src="/static/img/logo.png">
            </a>
        </div>
    </div>
    <ul class="nav nav-pills navbar-right">
        <!--<li class="upload_nav_li1 active" role="presentation">主页</li>-->
        <!--<li class="upload_nav_li2" role="presentation"><a>发布新资源</a></li>
        <li class="upload_nav_li3" role="presentation"><a>收藏</a></li>
        <li class="upload_nav_li4" role="presentation"><a>个人中心</a></li>
        <li class="upload_nav_li4" role="presentation"><a>注销</a></li>-->

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
    <div class="drag" style="margin-left: 5%;margin-top: 2%; height: 1400px;width: 90%">
        <div>
            <!--details-->
            <div class="article_details">
                <div class="page-header">
                    <h1>${article.articleName }
                        <!-- <small>内容</small> -->
                        <h5 style="float: left"><fmt:formatDate value="${article.articleCtime}" type="both"/></h5>
                        <h3 class="text-right" style="float: none;font-size: 20px">阅读数：${article.clickCount }</h3>
                    </h1>
                </div>
                <!-- <div style="height:600px;weight:500px"> -->
                <div style="margin-top: 5%">
                    <span>${articleContent }</span>
                </div>

            </div>
            <div class="article_area2" style="margin-top: 3%">
                <!--tag-->
                <div class="article_tag">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                       aria-expanded="true" aria-controls="collapseOne">
                                        一级
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                                 aria-labelledby="headingOne">
                                <!--<div class="list-group">-->
                                <!--aaa-->
                                <!--</div>-->
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <span class="badge">55</span>
                                        aaa
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge"></span>
                                        aaa
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge"></span>
                                        aaa
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">55</span>
                                        aaa
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        一级
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingTwo">
                                <!--<div class="list-group">-->
                                <!--bbb-->
                                <!--</div>-->
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <span class="badge">99</span>
                                        bbb
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">99</span>
                                        bbb
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">99</span>
                                        bbb
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        一级
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree">
                                <!--<div class="list-group">-->
                                <!--ccc-->
                                <!--</div>-->
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <span class="badge">8</span>
                                        ccc
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">8</span>
                                        ccc
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">8</span>
                                        ccc
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <span class="label label-default">111</span>
                    <span class="label label-primary">222</span>
                    <span class="label label-success">333</span>
                    <span class="label label-info">444</span>
                    <span class="label label-warning">555</span>
                    <span class="label label-danger">666</span>
                </div>
                <!--recommend-->
                <div class="article_recommend">
                    <div class="col-xs-12 col-lg-12 col-md-6">
                        <ul class="list-group">
                            <li class="list-group-item"><i class="fa fa-weibo" style="margin-right: 10px"></i>111</li>
                            <li class="list-group-item"><i class="fa fa-weibo" style="margin-right: 10px"></i>111</li>
                            <li class="list-group-item"><i class="fa fa-weibo" style="margin-right: 10px"></i>111</li>
                            <li class="list-group-item"><i class="fa fa-weibo" style="margin-right: 10px"></i>111</li>
                            <li class="list-group-item"><i class="fa fa-weibo" style="margin-right: 10px"></i>111</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--comment-->
            <div class="article_comment">

                <div class="container">
                    <div class="commentbox">
			<textarea cols="80" rows="50" placeholder="来说几句吧......"
                      class="mytextarea" id="content"></textarea>
                        <%-- <div class="btn btn-info pull-right" id="comment" value="${articleId }">评论</div> --%>
                        <button class="pull-right" type="button" onclick="clickComment(${article.articleId})">评论
                        </button>
                    </div>
                    <div class="comment-list">
                        <c:forEach items="${commentList }" var="comment" varStatus="status">
                            <div class="comment-info">
                                <header>
                                    <img src="/static/img/img.jpg">
                                </header>
                                <div class="comment-right">
                                    <div style="height: 50px">
                                        <div style="float: left">
                                            <h3>${comment.user.userName}</h3>
                                        </div>
                                        <div style="float: right">
                                            <h2>#${status.index+1}</h2>
                                        </div>
                                    </div>
                                    <div class="comment-content-header">
								<span><i class="glyphicon glyphicon-time"></i><fmt:formatDate
                                        value="${comment.articleReviewCtime}" type="both"/>
                                        <%-- new Date() : ${comment.articleReviewCtime} --%></span><!-- <span><i
									class="glyphicon glyphicon-map-marker"></i>深圳</span> -->
                                    </div>
                                    <p class="content">${comment.articleReview }</p>
                                    <!-- <div class="comment-content-footer">
                                        <div class="row">
                                            <div class="col-md-10">
                                                <span><i class="glyphicon glyphicon-pushpin"></i>
                                                    来自:win10 </span><span><i class="glyphicon glyphicon-globe"></i>
                                                    chrome 55.0.2883.87</span>
                                            </div>
                                            <div class="col-md-2">
                                                <span class="reply-btn">回复</span>
                                            </div>
                                        </div>
                                    </div> -->
                                    <div class="reply-list"></div>
                                </div>
                            </div>
                        </c:forEach>
                        <div id="before"></div>
                    </div>

                </div>
                <div class="comment-list">
                    <!-- <div class="comment-info">
                        <header><img src="./images/img.jpg"></header>
                        <div class="comment-right">
                            <h3>匿名</h3>
                            <div class="comment-content-header"><span><i class="glyphicon glyphicon-time"></i> 2017-10-17 11:42:53</span><span><i class="glyphicon glyphicon-map-marker"></i>深圳</span></div>
                            <p class="content">mongodb 副本集配置副本集概念：就我的理解就是和主从复制 差不多，就是在主从复制的基础上多加了一个选举的机制。
                            复制集 特点：数据一致性 主是唯一的，没有Mysql 那样的双主结构大多数原则，集群存活节点小于二分之一是集群不可写，
                            只可读从库无法写入数据自动容灾通过下面的一个图来简单的了解下
                             配置过程：一、安装mongodb安装过程略，不懂得可以看前面的教程二、创建存储目录与配置文件创...</p>
                            <div class="comment-content-footer">
                                <div class="row">
                                    <div class="col-md-10">
                                        <span><i class="glyphicon glyphicon-pushpin"></i> 来自:win10 </span><span><i class="glyphicon glyphicon-globe"></i> chrome 55.0.2883.87</span>
                                    </div>
                                    <div class="col-md-2"><span class="reply-btn">回复</span></div>
                                </div>
                            </div>
                            <div class="reply-list"></div>
                        </div>
                    </div> -->

                </div>
            </div>
        </div>
    </div>
</div>
<!--foot-->
<%--
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
--%>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    // 保存评论

    $("#comment").click(function () {
        /* var dataObj = JSON.parse(data.content);
        var Datetemp= new Date(dataObj.createTime);// 这里必须是整数，毫秒
        var dateStr = Datetemp.format("yyyy-MM-dd hh:mm:ss"); */
        alert("=" + $("#comment").val())
        var obj = new Object();
        obj.articleId = 2;
        obj.userId = 2;
        obj.articleReview = $("#content").val();
        ajaxCon("/saveComment", obj)
    });

    function clickComment(articleId) {
        var obj = new Object();

        var article = new Object();
        article.articleId = articleId;

        obj.article = article;

        var user = new Object();
        // user.userId = articleId;
        user.userId = 2;

        obj.user = user;
        obj.articleReview = $("#content").val();
        ajaxCon("/saveComment", obj)
        // window.location.href="/showArti?articleId="+articleId
    }

    function ajaxCon(url, obj) {
        var json = JSON.stringify(obj);
        // 添加到数据库中，需要修改
        //ajax的异步请求
        $.ajax({
            url: url,
            contentType: "application/json",
            data: JSON.stringify(obj),
            type: "post",//请求的发送方式
            dataType: "json",//结果的返回值类型
            success: function (data) {

                if (data.result == "true") {
                    // 显示到评论区：简单实现-刷新页面，较为麻烦-利用DOM添加到评论上方
                    // window.location.href="/comment";
                    addComment(data.comment)
                }

            }
        })
    }

    function addComment(comment) {
        var before = document.getElementById("before");
        /* alert(comment.articleReviewCtime.year + 1900)
        alert(comment.articleReviewCtime.month + 1)
        alert(comment.articleReviewCtime.date)
        alert(comment.articleReviewCtime.hours)
        alert(comment.articleReviewCtime.minutes)
        alert(comment.articleReviewCtime.seconds) */

        // 以下三列时间需要自行调试
        /* var time = comment.articleReviewCtime.year + 1900 + "-" + comment.articleReviewCtime.month + 1 + "-" + comment.articleReviewCtime.date
            + " " + comment.articleReviewCtime.hours + ":" + comment.articleReviewCtime.minutes + ":" + comment.articleReviewCtime.seconds */

        /*var time = timestampToTime(comment.articleReviewCtime.time)*/
        var time = timestampToTime(comment.articleReviewCtime)

        alert(time)

        var el = '';
        el += "<div class='comment-info'>"
        el += "	<header>"
        el += "		<img src='/static/img/img.jpg'>"
        el += "	</header>"
        el += "	<div class='comment-right'>"
        el += "		<div style='height: 50px'>"
        el += "			<div style='float: left'>"
        el += "				<h3>" + comment.userName + "</h3>"
        el += "			</div>"
        el += "			<div style='float: right'>"
        el += "				<h2>#" + 213 + "</h2>"
        el += "			</div>"
        el += "		</div>"
        el += "		<div class='comment-content-header'>"
        el += "			<span><i class='glyphicon glyphicon-time'></i>"
        el += "				" + time + "</span><!-- <span><i"
        el += "				class='glyphicon glyphicon-map-marker'></i>深圳</span> -->"
        el += "		</div>"
        el += "		<p class='content'>" + comment.articleReview + "</p>"
        el += "		<!-- <div class='comment-content-footer'>"
        el += "			<div class='row'>"
        el += "				<div class='col-md-10'>"
        el += "					<span><i class='glyphicon glyphicon-pushpin'></i>"
        el += "						来自:win10 </span><span><i class='glyphicon glyphicon-globe'></i>"
        el += "						chrome 55.0.2883.87</span>"
        el += "				</div>"
        el += "				<div class='col-md-2'>"
        el += "					<span class='reply-btn'>回复</span>"
        el += "				</div>"
        el += "			</div>"
        el += "		</div> -->"
        el += "	</div>"
        el += "</div>"

        /* alert(el) */

        $(el).insertBefore(before)

        // 输入编辑框为空
        $("#content").val("")
    }

    function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = (date.getMinutes() < 10 ? '0' + (date.getMinutes()) : date.getMinutes()) + ':';
        s = (date.getSeconds() < 10 ? '0' + (date.getSeconds()) : date.getSeconds());
        return Y + M + D + h + m + s;
    }

</script>

</body>
</html>