<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/12 0012
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="top.jsp"></jsp:include>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/frontindex.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/popup.css">
    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/popup.js"></script>
    <script type="text/javascript">
        var code;
        $(function () {
            //表单验证
            $("#username").blur(function () {
                var username = $("#username").val();
                $.ajax({
                    type: "post",
                    url: "<%=path%>/UserExists",
                    data: {username:username},
                    dataType: "text",
                    success: function(result){
                        // 用户不存在，可以注册
                        if(result=='Y'){
                            $("#usernameNotice").html("用户名已经被注册").css("color","red");
                        }
                    }
                });
                var regex = /^[a-zA-Z]\w{5,17}$/;
                if(!regex.test(username)){
                    $("#usernameNotice").html("以字母开头，长度6~18，只能包含字符、数字和下划线").css("color","red");
                }else{
                    $("#usernameNotice").html("");
                }
            })
            $("#password").blur(function () {
                var password = $("#password").val();
                var regex = /^[a-zA-Z]\w{5,17}$/;
                if(!regex.test(password)){
                    $("#passwordNotice").html("以字母开头，长度6~18，只能包含字符、数字和下划线").css("color","red");
                }else{
                    $("#passwordNotice").html("");
                }
            })
            $("#repeatPassword").blur(function () {
                var password = $("#password").val();
                var repeatPassword = $("#repeatPassword").val();
                if(password!=repeatPassword){
                    $("#repeatPasswordNotice").html("两次密码不一致").css("color","red");
                }else{
                    $("#repeatPasswordNotice").html("");
                }
            })
            $("#email").blur(function () {
                var email = $("#email").val();
                var regex = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                if(!regex.test(email)){
                    $("#emailNotice").html("邮箱格式不正确").css("color","red");
                }else{
                    $("#emailNotice").html("");
                }
            })
            $("#phone").blur(function () {
                var phone = $("#phone").val();
                var regex = /^1[3|4|5|8][0-9]\d{4,8}$/;
                if(!regex.test(phone)){
                    $("#phoneNotice").html("电话格式不正确").css("color","red");
                }else{
                    $("#phoneNotice").html("");
                }
            })


            $("#ok").click(function () {
                //如果有错误提示，不能注册
                $.each($(".notice"),function () {
                    if($(this).html()!=null && $(this).html()!=""){
                        return false;
                    }
                })
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
                if(!username || !password || !email || !phone || !addr){
                    alert("请将个人信息补充完整");
                    return false;
                }
                $.post("<%=path%>/UserInsert",data,function(data){
                    //跳转到列表
                    if(data=='Y'){
                        var popup = new Popup({
                            'type': 'submit',
                            'title': '请您确认',
                            'text': '请先激活邮箱，然后登录',
                            'submitCallBack': function(){
                                $(location).attr("href","<%=path%>/index.jsp");
                            }
                        })
                    }else{
                        $("#error").html("注册失败").css("color","red");
                    }
                })
            })
            //创建验证码
            createCode();
            $("#inputCode").blur(function () {
                checkCode();
            })
            $("#imgCode").click(function () {
                createCode();
            })

        })

        var createCode = function()  {
            code = "";
            var codeLength = 6; //验证码的长度
            var imgCode = $("#imgCode");
            var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
            for (var i = 0; i < codeLength; i++) {
                var charNum = Math.floor(Math.random() * 52);
                code += codeChars[charNum];
            }
            imgCode.html(code);
        }
        var  checkCode = function() {
            var inputCode = $("#inputCode").val();
            if (!inputCode) {
                $("#codeNotice").html("请输入验证码").css("color","red");
                createCode();
            } else if (inputCode.toUpperCase() != code.toUpperCase()) {
                $("#codeNotice").html("验证码输入有误").css("color","red");
                createCode();
            } else {
                $("#codeNotice").html("")
            }
        }
    </script>
</head>
<body>
    <!-- 注册 -->
    <div class="register">
        <div class="form">
            <div class="title">会员注册</div>
            <hr/>
            <div class="content">
                <span><label>*</label>用户名:</span>
                <input type="text" name="" id="username"><div class="notice" id="usernameNotice"></div>
            </div>
            <div class="content">
                <span><label>*</label>密码:</span>
                <input type="password" name="" id="password"><div class="notice" id="passwordNotice"></div>
            </div>
            <div class="content">
                <span><label>*</label>确认密码:</span>
                <input type="password" name="" id="repeatPassword"><div class="notice" id="repeatPasswordNotice"></div>
            </div>
            <div class="content">
                <span><label>*</label>E-mail:</span>
                <input type="text" name="" id="email"><div class="notice" id="emailNotice"></div>
            </div>
            <div class="content">
                <span>姓名:</span>
                <input type="text" name="" id="name">
            </div>
            <div class="content">
                <span>电话:</span>
                <input type="text" name="" id="phone"><div class="notice" id="phoneNotice"></div>
            </div>
            <div class="content">
                <span>地址:</span>
                <input type="text" name="" id="addr">
            </div>
            <div class="content">
                <span><label>*</label>验证码:</span>
                <input type="text" name="" style="width: 120px" id="inputCode"><span class="code" id="imgCode"></span>
                <div class="notice" id="codeNotice"></div>
            </div>
            <button id="ok">立即注册</button>
        </div>
    </div>

</body>
</html>
