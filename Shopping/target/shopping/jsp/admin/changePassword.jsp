<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/3 0003
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp"%>
<html>
<head>
    <title>Title</title>
    <style>
        span{
            display: inline-block;
            width: 30%;
        }
        input[type='text'],input[type='datetime']{
            margin-top: 20px;
        }
    </style>
    <script>
        $(function () {
            $("#oldPassword").blur(function () {
                var oldPassword = $("#oldPassword").val();
                $.get("${path}/user/oldPassword.action",{password:oldPassword,uid:"${sessionUser.uid}"},function (data) {
                    console.log(${sessionUser.uid});
                    if(data=='N'){
                        $("#oldPasswordError").html("旧密码错误");
                    }else{
                        $("#oldPasswordError").html("");
                    }
                })
            })
            $("#repeatPassword").blur(function () {
                var password= $("#password").val();
                var repeatPassword= $("#repeatPassword").val();
                if(password!=repeatPassword){
                    $("#repeatPasswordError").html("两次密码不一致");
                }else{
                    $("#repeatPasswordError").html("");
                }
            })
        })

        function submit() {
            var oldPassword = $("#oldPassword").val();
            var repeatPassword = $("#repeatPassword").val();
            var oldPasswordError = $("#oldPasswordError").html();
            var repeatPasswordError = $("#repeatPasswordError").html();
            var password = $("#password").val();
                if(!oldPassword||!repeatPassword||oldPasswordError||repeatPasswordError){
                    alert("您没有通过验证，请检查输入");
                    return false;
            }else{
                    $.get("${path}/user/updatePassword.action",{password:password,uid:"${sessionUser.uid}"},function (data) {
                    if(data=='Y'){
                        alert("密码更改成功");
                        window.close();
                    }
                })
            }

        //        $.get("URl","data",functiin({
            //
            //
            //        },'json')

        }

    </script>
</head>

<body class="main">
    <h1>修改密码</h1>
        <div class="update">
            <div class="left">
                <span>请输入旧密码</span>
                <input type="text" id="oldPassword"><span id="oldPasswordError"></span>
            </div>
            <div class="right">
            </div>
            <div class="left">
                <span>新密码</span>
                <input type="password" name="password" id="password">
            </div>
            <div class="right">
            </div>
            <div class="left">
                <span>确认密码</span>
                <input type="password" id="repeatPassword"><span id="repeatPasswordError"></span>
            </div>
            <div class="buttons">
                <input type="button" value="提交" onclick="submit()">
                <input type="button" onclick="history.back()" value="返回">
            </div>
        </div>
</body>

</html>
