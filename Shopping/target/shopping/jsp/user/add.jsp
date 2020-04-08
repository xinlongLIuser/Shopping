<%-- 
  Created by IntelliJ IDEA. 
  2018/08/13 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page isELIgnored="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<% 
    String path = request.getContextPath(); 
%> 
<html> 
<head> 
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/home.css"> 
    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script> 
    <script type="text/javascript"> 
        $(function () { 
            $("#ok").click(function () { 
                var data = {}; 
                var username = $("#username").val(); 
                data["username"] = username; 
                var password = $("#password").val(); 
                data["password"] = password; 
                var name = $("#name").val(); 
                data["name"] = name; 
                var email = $("#email").val(); 
                data["email"] = email; 
                var phone = $("#phone").val(); 
                data["phone"] = phone; 
                var addr = $("#addr").val(); 
                data["addr"] = addr; 

                $.post("<%=path%>/user/UserInsert.action",data,function(data){
                    //跳转到列表
                    console.log(data);
                    if(data=='Y'){
                        $(location).attr("href","<%=path%>/user/UserList.action");
                    }else{ 
                        $("#error").html("添加失败").css("color","red"); 
                    } 
                }) 
            }) 
        }) 
    </script> 
</head> 

<body class="main"> 
    <h1>添加前台用户</h1> 
    <div class="update">
        <div class="left">
            <span>用户名</span> 
            <input type="text" id="username"> 
        </div> 
        <div class="right">
            <span>密码</span> 
            <input type="text" id="password"> 
        </div> 
        <div class="left">
            <span>姓名</span> 
            <input type="text" id="name"> 
        </div> 
        <div class="right">
            <span>邮箱</span> 
            <input type="text" id="email"> 
        </div> 
        <div class="left">
            <span>电话号码</span> 
            <input type="text" id="phone"> 
        </div> 
        <div class="right">
            <span>地址</span> 
            <input type="text" id="addr"> 
        </div> 

        <div id="error"></div> 
        <div class="buttons"> 
            <button id="ok">确定</button> <button onclick="history.back()">返回</button> 
        </div> 
    </div> 
</body> 
</html> 
 
