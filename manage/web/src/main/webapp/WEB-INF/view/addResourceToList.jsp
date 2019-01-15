<%@ page import="com.cyber.pojo.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% User user = (User) session.getAttribute("user");
    if (user != null) {%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta charset="utf-8"/>
    <script src="/js/jquery.js"></script>
    <style contenttype="text/css">
        body {
            background-color: #e7ecef;
            text-align: center;
            margin: auto 0;
            filter: alpha(opacity=50, style=0)
        }

        td {
            border-radius: 10px;
            border: 0px;
        }

        table {
            margin: auto;
            margin-top: 5em;
            background-color: #e7ecef;
            filter: Alpha(Opacity=50)
        }

        .button {
            background-color: white;
            color: black;
            width: 200px;
            border-radius: 10px;
        }

        .button:hover {
            background-color: black;
            color: white;
        }

        #title {
            margin-top: 3em;
        }

        form {
            filter: alpha(opacity=50, Style=0)
        }
    </style>
</head>
<body background="/img/3.jpg">
<h1 id="title">
    开启集体智慧力量
</h1>
<form method="post" name="myform">
    <table border="0" width="70%" height="600" style="filter:alpha(opacity=50,style=0)">
        <tr>
            <td width="40%">
                <select id="save" style="WIDTH:100% ;height: 100%" multiple name="list2" size="12"
                        ondblclick="moveOption(document.myform.list1, document.myform.list2)">

                    <c:forEach items="${resourceInfo}" var="r" varStatus="Status">
                        <option value="${r.resourceId}">${r.resourceName}</option>
                    </c:forEach>

                </select>
            </td>
            <td width="20%" align="center" style="background:#DEB887">
                <input type="button" value="添加" onclick="moveOption(document.myform.list1, document.myform.list2,1)"
                       class="button">
                <br/>
                <br/>
                <input type="button" value="删除" onclick="moveOption(document.myform.list2, document.myform.list1,-1)"
                       class="button">
                <br/>
                <br/>
                <input type="button" value="保存" onclick="location.href=('/onelistView/${id}')" class="button">
            </td>

            <td width="40%">
                <select style="WIDTH:100%;height: 100%" multiple name="list1" size="12"
                        ondblclick="moveOption(document.myform.list2, document.myform.list1)">
                    <c:forEach items="${infoSource}" var="is" varStatus="Status">
                        <option value="${is.resourceId}">${is.resourceName}</option>
                    </c:forEach>

                </select>
            </td>

            <!--<td>
                <button onclick="changepos(list2,-1)" type="button">上移</button>
                <br/>
                <button onclick="changepos(list2,1)" type="button">下移</button>
            </td>-->
        </tr>
    </table>
    <span id="msg"></span>
</form>
<script language="JavaScript">

    function moveOption(e1, e2, state) {
        try {
            for (var i = 0; i < e1.options.length; i++) {
                if (e1.options[i].selected) {
                    var e = e1.options[i];
                    e2.options.add(new Option(e.text, e.value));
                    e1.remove(i);
                    i = i - 1
                    // 插或删
                    if (state == 1) {
                        alert("插入")
                    } else {
                        alert("删除")
                    }
                    alert(e.value)
                    var url = "/interaction/${id}"
                    var ids = e.value
                    alert(url)
                    $.ajax({
                        url: url,
                        data: {"state": state, "id": ids},
                        type: "POST",
                        dataType: "json",
                        "success": function (json) {
                            $("#msg").html("<font style='color:red'>" + json.msg + "</font>");
                        }
                    });
                }
            }
            document.myform.city.value = getvalue(document.myform.list2);
        }
        catch (e) {
        }

    }

    function getvalue(geto) {
        var allvalue = "";
        for (var i = 0; i < geto.options.length; i++) {
            allvalue += geto.options[i].value + ",";
        }
        return allvalue;
    }

    function changepos(obj, index) {
        if (index == -1) {
            if (obj.selectedIndex > 0) {
                obj.options(obj.selectedIndex).swapNode(obj.options(obj.selectedIndex - 1))
            }
        } else if (index == 1) {
            if (obj.selectedIndex < obj.options.length - 1) {
                obj.options(obj.selectedIndex).swapNode(obj.options(obj.selectedIndex + 1))
            }
        }
    }

</script>
</body>
</html>

<%} else { %>
<%response.sendRedirect("index.jsp"); %>
<%} %>