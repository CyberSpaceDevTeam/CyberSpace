<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:if test="${error==null}">
        <meta http-equiv="refresh" content="3;url=/toviewRes">
    </c:if>
    <c:if test="${error==1}">
        <meta http-equiv="refresh" content="3;url=/file">
    </c:if>
</head>
<body>
<c:if test="${error==null}">
    <h4>上传成功，3秒后跳转</h4>
</c:if>
<c:if test="${error==1}">
    <h4>上传失败，3秒后返回</h4>
</c:if>
</body>
</html>
