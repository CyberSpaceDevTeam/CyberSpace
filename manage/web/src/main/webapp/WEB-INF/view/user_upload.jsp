<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文章发布</title>
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

        .toolbar {
            border: 1px solid #fff;
        }

        .text {
            border: 1px solid #fff;
            height: 700px;
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

        <div class="col-lg-7 col-md-2" style="float: left;margin-left: 9%">
            <input class="form-control" id="title" type="text" placeholder="请输入标题...">
        </div>


        <!--editArea-->
        <div class="upload_edit_area" style="margin-top: 5%">
            <div id="div1" class="toolbar" style="color: #fff"></div>
            <div style="padding: 5px 0; color: #fff">请在下方编辑区输入文章内容，提示：可利用外部文本编辑器编辑好之后直接粘贴放入，图片需要上传~~。</div>
            <div id="div2" class="text" style="color: #fff;font-size: 20px;font-family: Arial, serif">
                <!--可使用 min-height 实现编辑区域自动增加高度-->
            </div>

            <!-- 初步想法，通过submit参数区分是提交还是查看 -->
            <button style="margin-top: 1%;float: right;color: #000;font-family: 'Microsoft YaHei',serif"
                    class="btn btn-default to_small" type="button" onclick="submit()"
                    id="checkArt">提交文章
            </button>


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
<!-- 修改.js目录位置 -->
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/wangEditor.js"></script>
<script type="text/javascript">
    // 关于wangEditor的设置
    var E = window.wangEditor
    var editor = new E('#div1', '#div2') // 两个参数也可以传入 elem 对象，class 选择器
    // editor.customConfig.uploadImgShowBase64 = true // 使用 base64 保存图片
    // 配置服务器端地址
    editor.customConfig.uploadImgServer = '/saveImg'
    // 将图片大小限制为 3M
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
    // 自定义上传参数
    editor.customConfig.uploadFileName = 'imgFile'
    // 忽略粘贴内容中的图片
    // editor.customConfig.pasteIgnoreImg = true

    editor.customConfig.uploadImgHooks = {
        before: function (xhr, editor, files) {
            // 图片上传之前触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件

            // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
            // return {
            //     prevent: true,
            //     msg: '放弃上传'
            // }
        },
        success: function (xhr, editor, result) {
            // 图片上传并返回结果，图片插入成功之后触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
        },
        fail: function (xhr, editor, result) {
            // 图片上传并返回结果，但图片插入错误时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
        },
        error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
        },
        timeout: function (xhr, editor) {
            // 图片上传超时时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
        },

        // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
        // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            var url = result.url
            insertImg(url)

            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    }
    editor.create()

    // 提交文章
    function submit() {

        alert(editor.txt.text())
        var title = document.getElementById("title").value
        //ajax的异步请求
        $.ajax({
            url: "/saveArticle",
            data: {
                "title": title,
                "article": editor.txt.html(),
                "articleContent": editor.txt.text()
            },//data中存放的为deptId的key 和 value
            type: "post",//请求的发送方式
            dataType: "json",//结果的返回值类型
            success: function (data) {

                // 跳转成功页面，仿CSDN
                if (data.result == "true") {
                    // 禁用编辑功能
                    /* editor.$textElem.attr('contenteditable', false)
                    $("#checkArt").html('查看文章'); */
                    // alert(data.articlePath)

                    var articleName = '文章名输入';

                    window.location.href = "/showArtiById?articleId=" + data.articleId + "&articleName=" + articleName;
                    // post("/checkArti",data.articlePath)
                }

            }
        })
    }

</script>
</body>

</html>