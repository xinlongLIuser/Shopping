<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        Cookie[] cookies = request.getCookies();
        String username = "";
        String password = "";
        if(cookies!=null && cookies.length>0){
            for (Cookie cookie : cookies){
                if("username".equals(cookie.getName())){
                    username = cookie.getValue();
                }else if("password".equals(cookie.getName())){
                    password = cookie.getValue();
                }
            }
        }
        String path = request.getContextPath();
    %>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/index.css">
    <style>
        body {
            background: url("<%=path%>/images/a.jpg");
        }
    </style>
    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //cookie中保存的用户名和密码
            <%--var username = $("#username").val();--%>
            <%--var password = $("#password").val();--%>
            <%--if(username!="" && password!=""){--%>
            <%--    $.post("<%=path%>/admin/login.action",{username:username,password:password},function (result) {--%>
            <%--        if(result=='Y'){--%>
            <%--            $(location).attr("href","<%=path%>/jsp/index/home.jsp")--%>
            <%--        }--%>
            <%--    })--%>
            <%--}--%>
            $("#login").click(function () {
                var username = $("#username").val();
                var password = $("#password").val();
                if(!username){
                    $("#error").html("用户名不能为空!");
                    return false;
                }
                if(!password){
                    $("#error").html("密码不能为空!");
                    return false;
                }
                $.ajax({
                    type: "post",
                    url: "<%=path%>/admin/login.action",
                    data: {username:username,password:password},
                    dataType: "text",
                    success: function(result){
                        if(result=='Y'){
                            $(location).attr("href","<%=path%>/jsp/index/home.jsp")
                        }else{
                            $("#error").html("用户名或者密码不正确");
                        }
                    },
                    error:function (result) {
                        $("#error").html(result);
                    }
                });

            })

            $("#register").click(function () {
                $(location).attr("href","<%=path%>/jsp/admin/register.jsp")
            })
        })
    </script>
</head>

<body>
<div class="login">
    <!--图片 -->
    <%--<div class="photo"></div>--%>

    <div class="form">
        <span style="text-align: center;display: block">用户登录</span>
        <div class="content">
            <span>用户名：</span>
            <input type="text" id="username" value="<%=username%>" placeholder="请输入用户名" >
        </div>
        <div class="content">
            <span>密码：</span>
            <input type="password" id="password" value="<%=password%>" placeholder="请输入密码">
        </div>
        <!--错误提示 -->
        <div id="error"></div>
        <!-- 按钮-->
        <div class="btn">
            <button id="register">注册</button>
            <button id="login">登录</button>
        </div>
    </div>
</div>
</body>
</html>
