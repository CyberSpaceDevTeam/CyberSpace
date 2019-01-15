<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Details</title>
    <link rel="stylesheet" href="/css/css.css">
    <link rel="stylesheet" href="/static/css/article_res.css">
    <link rel="stylesheet" href="/static/css/footstyle.css">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/static/img/favicon.ico"/>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery-1.4.2.js"></script>
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .b1, .b2, .b3, .b4, .b1b, .b2b, .b3b, .b4b, .b {
            display: block;
            overflow: hidden;
        }

        .b1, .b2, .b3, .b1b, .b2b, .b3b {
            height: 1px;
        }

        .b2, .b3, .b4, .b2b, .b3b, .b4b, .b {
            border-left: 1px solid #999;
            border-right: 1px solid #999;
        }

        .b1, .b1b {
            margin: 0 5px;
            background: #999;
        }

        .b2, .b2b {
            margin: 0 3px;
            border-width: 2px;
        }

        .b3, .b3b {
            margin: 0 2px;
        }

        .b4, .b4b {
            height: 2px;
            margin: 0 1px;
        }

        .d1 {
            background: #F7F8F9;
        }

        .k {
            height: 300px;
        }

        #round img {
            border-radius: 15px;
        }

        .font1 {
            color: #6E7B8B;
            font-size: 20px;
            font-family: 楷体;
        }

        .font2 {
            color: #000000;
            font-size: 20px;
            font-family: 微软雅黑;
        }

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

        .bg {
            width: 100%;
            height: 1280px;
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
        }
    </style>
</head>
<body class="article_body">
<!--nav-->
<div class="article_nav navbar navbar-inverse">
    <div class="container-fluid title">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.html">
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
    <div class="drag" style="margin-left: 5%;margin-top: 2%; height: 1200px;width: 90%">
        <div>
            <!--details-->
            <div class="article_details">
                <div class="page-header">
                    <h1>${one.resourceName}
                        <small></small>
                    </h1>

                    <div id="round" class="img">
                        <img src="${one.resourcePicture}" alt="" style="width: 100%; height:30em; "
                             name="resourcePicture">
                    </div>
                    <article style="margin-top: 20px">
                        <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
                        <div class="b d1 k">
                            <table style="font-size: 20px ;margin-left:25px;margin-right: 25px;margin-bottom: 25px;">

                                <tr>
                                    <td class="font2">作者：</td>

                                    <td class="font1"><a href="#" class="">${one.user.userName}</a></td>
                                </tr>
                                <tr>
                                    <td class="font2">描述：</td>
                                    <td class="font1">
                                        <div style="font-size: 18px">${one.resourceDesc}</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="font2">评分：</td>
                                    <td class="font1"><font style="font-size: 18px ;color: #de4414"><c:if
                                            test="${score!=null}">${score}分</c:if><c:if
                                            test="${score==null}">未评分</c:if></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="font2">资源类型:</td>
                                    <td class="font1"><a href="#" class="">${one.type.typeName}</a></td>
                                </tr>
                                <tr>
                                    <td class="font2">资源分类:</td>
                                    <td class="font1"><a href="#" class="">${one.category.categoryName}</a></td>
                                </tr>
                                <tr>
                                    <td class="font2">资源地址:</td>
                                    <td class="font1"><a href="#" class="">${one.resourcePath}</a></td>
                                </tr>
                                <tr>
                                    <td class="font2">资源密码:</td>
                                    <td class="font1">
                                        <div>${one.resourcePwd}</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="font2">上传时间:</td>
                                    <td class="font1"><fmt:formatDate value="${one.resourceCtime}" type="both"/></td>
                                </tr>
                                <tr>
                                    <td class="font2">更改时间:</td>
                                    <td class="font1"><fmt:formatDate value="${one.resourceCtime}" type="both"/></td>
                                </tr>
                                <tr>
                                    <td class="font2">阅读量:</td>
                                    <td class="font1">${one.resourceCount}</td>
                                </tr>

                            </table>
                        </div>
                        <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b"></b>
                    </article>
                    <input type="button" class="btn btn-default navbar-btn"
                           onclick="location.href=('/toUpdate/${one.resourceId}')" value="修改信息">
                    <input type="button" class="btn btn-default navbar-btn"
                           onclick="location.href=('/toDelete/${one.resourceId}')" value="删除信息">


                    <%--<button onclick="Window.location.href('./toUpdate/${one.id}')" >修改信息</button>--%>


                    <div>
                        <h3>评分部分</h3>
                    </div>
                    <div id="starRating">
                        <p class="photo">
                            <span><i class="high"></i><i class="nohigh"></i></span>
                            <span><i class="high"></i><i class="nohigh"></i></span>
                            <span><i class="high"></i><i class="nohigh"></i></span>
                            <span><i class="high"></i><i class="nohigh"></i></span>
                            <span><i class="high"></i><i class="nohigh"></i></span>
                        </p>
                        <p class="starNum">0.0分</p>

                        <div class="bottoms">
                            <a class="btn sureStar btn-default navbar-btn">确认</a><span id="msg"></span>
                        </div>
                    </div>

                    <div><h4>评论部分</h4></div>

                    <div class="container">
                        <div class="commentbox">
			        <textarea cols="80" rows="50" placeholder="来说几句吧......"
                              class="mytextarea" id="content"></textarea>
                            <button class="btn pull-right" type="button" onclick="clickComment(${one.resourceId})">评论
                            </button>
                        </div>
                        <div class="comment-list">
                            <c:forEach items="${resourcecommentList }" var="comment" varStatus="status">
                                <div class="comment-info">
                                    <header>
                                        <img src="/images/img.jpg">
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
                                        value="${comment.resourceReviewCtime}" type="both"/>

                                        </div>
                                        <p class="content">${comment.resourceReview }</p>

                                        <div class="reply-list"></div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="comment-list">
                        <div id="before"></div>
                    </div>
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
<script>
    $(function () {
        //评分
        var starRating = 0;
        $('.photo span').on('mouseenter', function () {
            var index = $(this).index() + 1;
            $(this).prevAll().find('.high').css('z-index', 1)
            $(this).find('.high').css('z-index', 1)
            $(this).nextAll().find('.high').css('z-index', 0)
            $('.starNum').html((index * 2).toFixed(1) + '分')
        })
        $('.photo').on('mouseleave', function () {
            $(this).find('.high').css('z-index', 0)
            var count = starRating / 2
            if (count == 5) {
                $('.photo span').find('.high').css('z-index', 1);
            } else {
                $('.photo span').eq(count).prevAll().find('.high').css('z-index', 1);
            }
            $('.starNum').html(starRating.toFixed(1) + '分')
        })
        $('.photo span').on('click', function () {
            var index = $(this).index() + 1;
            $(this).prevAll().find('.high').css('z-index', 1)
            $(this).find('.high').css('z-index', 1)
            starRating = index * 2;
            $('.starNum').html(starRating.toFixed(1) + '分');
        })
        //确定评分
        $('.sureStar').on('click', function () {
            if (starRating === 0) {
                alert('最低一颗星！');
            } else {
                alert('评分：' + (starRating.toFixed(1) + '分'))
                var url = "/ResourceScore"
                $.ajax({
                    url: url,
                    data: {"score": starRating.toFixed(1), "resourceId":${one.resourceId}},
                    type: "POST",
                    dataType: "json",
                    "success": function (json) {
                        $("#msg").html("<font style='color:red'>" + json.msg + "</font>");
                    }
                });
            }

        })
    })
</script>
<script type="text/javascript">
    // 保存评论

    function clickComment(resourceId) {

        var obj = new Object();

        var resource = new Object();
        resource.resourceId = resourceId;

        obj.resource = resource;

        var user = new Object();
        // user.userId = articleId;
        user.userId = 2;
        obj.user = user;
        obj.resourceReview = $("#content").val();
        ajaxCon("/saveResourceComment/${one.resourceId}", obj)
        alert(obj)
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
                    addComment(data.resourceComment)
                }

            }
        })
    }

    function addComment(resourceComment) {
        var before = document.getElementById("before");
        var time = resourceComment.resourceReviewCtime;

        /* resourceComment.resourceReviewCtime.year + 1900 + "-" + resourceComment.resourceReviewCtime.month + 1 + "-" + resourceComment.resourceReviewCtime.date
            + " " + resourceComment.resourceReviewCtime.hours + ":" + resourceComment.resourceReviewCtime.minutes + ":" + resourceComment.resourceReviewCtime.seconds*/

        var el = '';
        el += "<div class='comment-info'>"
        el += "	<header>"
        el += "		<img src='/images/img.jpg'>"
        el += "	</header>"
        el += "	<div class='comment-right'>"
        el += "		<div style='height: 50px'>"
        el += "			<div style='float: left'>"
        el += "				<h3>" + resourceComment.userName + "</h3>"
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
        el += "		<p class='content'>" + resourceComment.resourceReview + "</p>"
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


        $(el).insertBefore(before)
    }
</script>
</html>