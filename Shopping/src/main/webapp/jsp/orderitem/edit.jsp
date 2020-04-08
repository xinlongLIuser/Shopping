<%-- 
  Created by IntelliJ IDEA. 
  2019/04/14 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <title>Title</title>
</head> 

<body class="main"> 
<form action="${path}/orderitem/update.action"> 
    <h1>修改病人信息</h1> 
    <input type="hidden" name="itemid" value="${orderitem.itemid}"> 
    <div class="update"> 
        <div class="left"> 
            <span></span> 
            <input type="text" name="count" value="${orderitem.count}"> 
        </div> 
        <div class="right"> 
            <span></span> 
            <input type="text" name="subtotal" value="${orderitem.subtotal}"> 
        </div> 
        <div class="left"> 
            <span></span> 
            <input type="text" name="pid" value="${orderitem.pid}"> 
        </div> 
        <div class="right"> 
            <span></span> 
            <input type="text" name="oid" value="${orderitem.oid}"> 
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
 
