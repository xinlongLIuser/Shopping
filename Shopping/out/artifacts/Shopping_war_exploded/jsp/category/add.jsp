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

<body class="main"> 
<form action="${path}/category/insert.action"> 
    <h1>添加一级分类信息</h1>
    <div class="update"> 
        <div class="left"> 
            <span>一级分类名称</span> 
            <input type="text" name="cname" value=""> 
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
 
