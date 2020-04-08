<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <link rel="stylesheet"  href="<%=path%>/css/zTreeStyle/zTreeStyle.css">
    <script type="text/javascript" src="<%=path%>/ztree/js/jquery-1.4.4.min.js"></script>
    <style type="text/css">
     .ztree * {font-size: 10pt;font-family:"Microsoft Yahei",Verdana,Simsun,"Segoe UI Web Light","Segoe UI Light","Segoe UI Web Regular","Segoe UI","Segoe UI Symbol","Helvetica Neue",Arial}
    .ztree li ul{ margin:0; padding:0}
    .ztree li {line-height:30px;}
    .ztree li a {width:200px;height:30px;padding-top: 0px;}
    .ztree li a:hover {text-decoration:none; background-color: #E7E7E7;}
    .ztree li a span.button.switch {visibility:hidden}
    .ztree.showIcon li a span.button.switch {visibility:visible}
    .ztree li a.curSelectedNode {background-color:#D4D4D4;border:0;height:30px;}
    .ztree li span {line-height:30px;}
    .ztree li span.button {margin-top: -7px;}
    .ztree li span.button.switch {width: 16px;height: 16px;}

    .ztree li a.level0 span {font-size: 150%;font-weight: bold;}
    .ztree li span.button {background-image:url("../../images/left_menuForOutLook.png"); *background-image:url("../../images/left_menuForOutLook.gif")}
    .ztree li span.button.switch.level0 {width: 20px; height:20px}
    .ztree li span.button.switch.level1 {width: 20px; height:20px}
    .ztree li span.button.noline_open {background-position: 0 0;}
    .ztree li span.button.noline_close {background-position: -18px 0;}
    .ztree li span.button.noline_open.level0 {background-position: 0 -18px;}
    .ztree li span.button.noline_close.level0 {background-position: -18px -18px;}
</style>
    <%--<script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>--%>
    <script type="text/javascript" src="<%=path%>/ztree/js/jquery.ztree.core.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/home.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/zTreeStyle/zTreeStyle.css">

    <script>
        var curMenu = null, zTree_Menu = null;
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    idKey : "fid",
                    pIdKey : "pid",
                    rootPId : 0
                }
            },
            key:{
                name: "name",
                 url:"url",
            }
        };
        //加载ztree
        function onloadZTree() {
            var ztreeNodes;
            var data={};
            var uid=$("#uid").val();
            data["uid"]=uid;
            $.ajax({
                async: true, //是否异步
                cache: false, //是否使用缓存
                data: data,
                type: 'post', //请求方式,post
                dataType: "json", //数据传输格式
                url: "<%=path%>/baseFunction/ajaxfunctionList.action", //请求链接
                error: function () {
                    alert('亲，网络有点不给力呀！');
                },
                success: function (data) {
                      // console.log(data);
                      //  ztreeNodes = eval("[" + data + "]"); //将string类型转换成json对象
                     ztreeNodes=data;
                    // console.log(ztreeNodes);
                    $.fn.zTree.init($("#treeDemo"), setting, ztreeNodes);
                    zTree_Menu = $.fn.zTree.getZTreeObj("treeDemo");
                }
            });
        }
        //初始化操作
        $(document).ready(function () {
            onloadZTree();
        });
    </script>

</head>
<body class="left">
<input type="hidden" id="uid" name="uid" value="${sessionUser.uid}">
<div>
    <ul id="treeDemo" class="ztree"></ul>
</div>
</body>
</html>
