<%-- 
  Created by IntelliJ IDEA. 
  2019/04/11 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <title>Title</title>
</head> 
<script>
    $(function () {
        $.post("${path}/category/ajaxList.action ",function (data) {
            var $cid = $("#cid");
            $(data).each(function () {
                var $option = $("<option value='"+this.cid+"'>"+this.cname+"</option>");
                $option.appendTo($cid);
                console.log(data);
            })
            $("#cid").val("${categorysecond.cid}");
        },"json")
        
    })
</script>

<body class="main"> 
<form action="${path}/categorysecond/update.action"> 
    <h1>修改二级分类名称</h1>
    <input type="hidden" name="csid" value="${categorysecond.csid}"> 
    <div class="update"> 
        <div class="left"> 
            <span>二级分类名称</span> 
            <input type="text" name="csname" value="${categorysecond.csname}"> 
        </div> 
        <div class="right"> 
            <span>一级分类名称</span>
            <select name="cid" id="cid"></select>
            <%--<input type="text" name="cid" value="${categorysecond.cid}"> --%>
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
 
