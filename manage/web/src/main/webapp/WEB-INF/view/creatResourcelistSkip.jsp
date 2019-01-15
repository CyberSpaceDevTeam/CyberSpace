<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/css/footstyle.css">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/static/img/favicon.ico"/>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery-1.4.2.js"></script>
    <c:if test="${error==null}">
        <meta http-equiv="refresh" content="3;url=/tolist/${sessionScope.user.userId}">
    </c:if>
    <c:if test="${error==1}">
        <meta http-equiv="refresh" content="3;url=/tocreatResourcelist">
    </c:if>

    <style>
        .bg {
            width: 100%;
            height: 1280px;
            position: relative;
            background: url("/static/img/b3.jpeg") no-repeat fixed;
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

        .draw {
            position: absolute;
            left: 50%;
            top: 30%;
            transform: translate(-50%, -50%);
            width: 200px;
            height: 400px;
            text-align: center;

            background: inherit;
            z-index: 11;

            box-shadow: 0 0 10px 6px rgba(0, 0, 0, .5);
        }
    </style>
</head>
<body>
<div class="bg">
    <div class="draw" style="text-align: center ;tecolor: #fff;font-size: 30px;float: none ;height: 50px;width: 350px">
        <c:if test="${error==null}">
            <span style="margin-top: 5% ;color: #400000">创建成功，3秒后跳转</span>
        </c:if>
        <c:if test="${error==1}">
            <span style="margin-top: 5% ;color: #400000">创建失败，3秒后返回</span>
        </c:if>

    </div>
</div>
</body>
</html>
