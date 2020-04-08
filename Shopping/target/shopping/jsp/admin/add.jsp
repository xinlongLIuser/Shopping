<%-- 
  Created by IntelliJ IDEA. 
  2018/08/09 
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
                var sex=$("#sex").find("option:selected") .val();
                data["sex"]=sex;
                var deptid=$("#deptid").find("option:selected") .val();
                data["deptid"]=deptid;
                console.log(data);
                $.post("<%=path%>/admin/Insert.action",data,function(data){
                    //跳转到列表 
                    if(data=='Y'){ 
                        $(location).attr("href","<%=path%>/admin/AdminuserList.action");
                    }else{ 
                        $("#error").html("添加失败").css("color","red"); 
                    } 
                }) 
            })

            $.post("${path}/baseDept/ajaxList.action",function (data) {
                var $deptid = $("#deptid");
                $(data).each(function () {
                    var $option = $("<option value='"+this.deptId+"'>"+this.deptName+"</option>");
                    $option.appendTo($deptid);
                })
                $("#deptid").val("${deptName.deptId}");
            },"json")

        })
    </script> 
</head> 

<body class="main"> 
    <h1>添加后台用户</h1> 
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
            <span>性别</span>
            <select id="sex" name="sex">
                <option value="1">男</option>
                <option value="2">女</option>
                <option value="3">未知</option>

            </select>
        </div>
        <div class="right">
            <span>部门</span>
            <select name="deptid" id="deptid"></select>
        </div>
        <div id="error"></div> 
        <div class="buttons"> 
            <button id="ok">确定</button> <button onclick="history.back()">返回</button> 
        </div> 
    </div> 
</body> 
</html> 
 
