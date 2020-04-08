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
            width: 40%;
        }
        input[type='text'],input[type='datetime']{
            margin-top: 10px;
        }
    </style>
    <script>
        $(function () {
            $.get("${path}/baseFunction/moduleList.action",function (data) {
                var $pid = $("#pid");
                $(data).each(function () {
                    var $option = $("<option value='"+this.fid+"'>"+this.name+"</option>");
                    $option.appendTo($pid);
                })
            },"json")
            // $.fn.zTree.getZTreeObj("treeDemo");
        })
    </script>
</head>

<body class="main">
    <h1>添加功能</h1>
    <form action="${path}/baseFunction/insert.action">
        <div class="update">
            <div class="right">
                <span>功能名称</span>
                <input type="text" name="name">
            </div>
            <div class="right">
                <span>模块名称</span>
                <select name="pid" id="pid"></select>
            </div>
            <div class="right">
                <span>url</span>
                <input type="text" name="url">
            </div>
            <div class="right">
            </div>
            <div id="error"></div>
            <div class="buttons">
                <input type="submit" value="提交">
                <input type="button" onclick="history.back()" value="返回">
            </div>
        </div>
    </form>
</body>

</html>
