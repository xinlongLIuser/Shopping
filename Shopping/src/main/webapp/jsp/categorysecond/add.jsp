<%-- 
  Created by IntelliJ IDEA. 
  2019/04/11 
  To change this template use File | Settings | File Templates. 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp" %>
<html>
<head>
    <title>Title</title>
    <script>
        $(function () {
            $.post("${path}/category/ajaxList.action", function (data) {
                var $cid = $("#cid");
                console.log(data);
                $(data).each(function () {
                    var $option = $("<option value='"+this.cid+"'>"+this.cname+"</option>");
                    $option.appendTo($cid);
                })
                <%--$("#cid").val("${categorysecond.cid}");--%>
            }, "json")
        })

    </script>
</head>

<body class="main">
<form action="${path}/categorysecond/insert.action">
    <h1>添加二级分类信息</h1>
    <div class="update">
        <div class="left">
            <span>二级分类名称</span>
            <input type="text" name="csname" value="">
        </div>
        <div class="right">
            <span>一级分类名称</span>
            <%--<input type="text" name="cid" value="">--%>
            <select name="cid" id="cid"></select>
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
 
