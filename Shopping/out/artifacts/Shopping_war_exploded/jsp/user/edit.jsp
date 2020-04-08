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
                var uid = $("#uid").val(); 
                data["uid"] = uid;  
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
                var state = $("#state").val();
                data["state"] = state;
                var code = $("#code").val();
                data["code"] = code;

                $.post("<%=path%>/UserUpdate",data,function(data){ 
                    //跳转到列表 
                    if(data=='Y'){ 
                        $(location).attr("href","<%=path%>/UserList"); 
                    }else{ 
                        $("#error").html("更新失败").css("color","red"); 
                    } 
                }) 
            }) 
        }) 
    </script> 
</head> 

<input type="hidden" id="state" value="${user.state}">
<input type="hidden" id="code" value="${user.code}">
<input type="hidden" id="uid" value="${user.uid}">
<body class="main">
    <h1>编辑前台用户</h1> 
    <div class="edit"> 
        <div class="editleft"> 
            <span>用户名</span> 
            <input type="text" id="username" value="${user.username}"> 
        </div> 
        <div class="editright"> 
            <span>密码</span> 
            <input type="text" id="password" value="${user.password}"> 
        </div> 
        <div class="editleft"> 
            <span>姓名</span> 
            <input type="text" id="name" value="${user.name}"> 
        </div> 
        <div class="editright"> 
            <span>邮箱</span> 
            <input type="text" id="email" value="${user.email}"> 
        </div> 
        <div class="editleft"> 
            <span>电话号码</span> 
            <input type="text" id="phone" value="${user.phone}"> 
        </div> 
        <div class="editright"> 
            <span>地址</span> 
            <input type="text" id="addr" value="${user.addr}"> 
        </div> 

        <div id="error"></div> 
        <div class="buttons"> 
            <button id="ok">确定</button> <button onclick="history.back()">返回</button> 
        </div> 
    </div> 
</body> 
</html> 
 
