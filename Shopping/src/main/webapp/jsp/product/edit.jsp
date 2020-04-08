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
<form action="${path}/product/update.action"> 
    <h1>修改病人信息</h1> 
    <input type="hidden" name="pid" value="${product.pid}"> 
    <div class="update"> 
        <div class="left"> 
            <span>商品名称</span> 
            <input type="text" name="pname" value="${product.pname}"> 
        </div> 
        <div class="right"> 
            <span>市场价格</span> 
            <input type="text" name="marketprice" value="${product.marketprice}"> 
        </div> 
        <div class="left"> 
            <span>商品价格</span> 
            <input type="text" name="shopprice" value="${product.shopprice}"> 
        </div> 
        <div class="right"> 
            <span>图片</span> 
            <input type="text" name="image" value="${product.image}"> 
        </div> 
        <div class="left"> 
            <span>商品说明</span> 
            <input type="text" name="pdesc" value="${product.pdesc}"> 
        </div> 
        <div class="right"> 
            <span>是否热卖</span> 
            <input type="text" name="ishot" value="${product.ishot}"> 
        </div> 
        <div class="left"> 
            <span>日期</span> 
            <input type="date" name="pdate" value="${product.pdate}"> 
        </div> 
        <div class="right"> 
            <span>二级分类名称</span> 
            <input type="text" name="csid" value="${product.csid}"> 
        </div> 
        <div class="left"> 
            <span></span> 
            <input type="text" name="marketPrice" value="${product.marketPrice}"> 
        </div> 
        <div class="right"> 
            <span></span> 
            <input type="text" name="shopPrice" value="${product.shopPrice}"> 
        </div> 
        <div class="left"> 
            <span></span> 
            <input type="text" name="isHot" value="${product.isHot}"> 
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
 
