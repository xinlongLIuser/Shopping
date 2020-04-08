<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/12 0012
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"></jsp:include>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/frontindex.css">
    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        var code;
        $(function () {


            $("#username").blur(function () {
                var username = $("#username").val();
                if (!username) {
                    $("#usernameNotice").html("用户名不能为空").css("color","red");
                }else{
                    $("#usernameNotice").html("");
                }
            })
            $("#password").blur(function () {
                var password = $("#password").val();
                if (!password) {
                    $("#passwordNotice").html("密码不能为空").css("color","red");
                }
                else{
                    $("#passwordNotice").html("");
                }
            })
            $("#login").click(function () {
                var username = $("#username").val();
                var password = $("#password").val();
                $.post("<%=path%>/user/login.action", {username: username, password: password}, function (result) {
                    if (result = "Y") {
                        $(location).attr("href", "<%=path%>/jsp/index.jsp")

                    } else {
                        alert("用户名密码错误！");
                    }
                })
            })
            <%--$("#wenzi").html("${SessionUser.username}");--%>
            //创建验证码
            createCode();
            $("#inputCode").blur(function () {
                checkCode();
            })
            $("#imgCode").click(function () {
                createCode();
            })

        })

        var createCode = function () {
            code = "";
            var codeLength = 4; //验证码的长度
            var imgCode = $("#imgCode");
            var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9); //所有候选组成验证码的字符，当然也可以用中文的
            for (var i = 0; i < codeLength; i++) {
                var charNum = Math.floor(Math.random() * 10);
                code += codeChars[charNum];
            }
            imgCode.html(code);
        }
        var checkCode = function () {
            var inputCode = $("#inputCode").val();
            if (!inputCode) {
                $("#codeNotice").html("请输入验证码").css("color", "red");
                createCode();
            } else if (inputCode.toUpperCase() != code.toUpperCase()) {
                $("#codeNotice").html("验证码输入有误").css("color", "red");
                createCode();
            } else {
                $("#codeNotice").html("")
            }
        }
    </script>
</head>
<body>
<!-- 注册 -->
<div class="login">
    <div class="form">
        <div class="title">会员登录</div>
        <hr/>
        <div class="content">
            <span><label>*</label>用户名:</span>
            <input type="text" name="" id="username">
            <div class="notice" id="usernameNotice"></div>
        </div>
        <div class="content">
            <span><label>*</label>密码:</span>
            <input type="password" name="" id="password">
            <div class="notice" id="passwordNotice"></div>
        </div>
        <div class="content">
            <span><label>*</label>验证码:</span>
            <input type="text" name="" style="width: 120px" id="inputCode"><span class="code" id="imgCode"></span>
            <div class="notice" id="codeNotice"></div>
        </div>
        <button id="login">立即登录</button>
    </div>
</div>

</body>
</html>
