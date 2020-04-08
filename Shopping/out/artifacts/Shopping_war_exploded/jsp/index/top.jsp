<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
   String path = request.getContextPath();
    Date date = new Date();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd E");
    String sdate = format.format(date);
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/home.css">
    <script src="${path}/js/jquery-3.3.1.min.js"></script>
    <script>
        $(function () {
            $("#logout").click(function () {
                window.parent.location.href="<%=path%>/admin/logout.action";
            })
            $("#changePassword").click(function () {
                window.parent.open('${path}/jsp/admin/changePassword.jsp', '修改密码', 'height=600, width=800, top=200, left=300');
            })
        })
    </script>
</head>
<body class="logo">
    <img src="<%=path%>/images/logo.jpg">
    <div class="top">
        <span>${sessionUser.username}</span>
        <span><%=sdate%></span><span><a href="#" id="logout">退出</a></span>
        <span><a href="#" id="changePassword">修改密码</a></span>
    </div>

</body>
</html>
