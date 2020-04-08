<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/15 0015
  Time: 15:53
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
    <title>商品列表</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/frontindex.css">
    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".shopcartBtn").click(function () {
                var count = $("#count").val();
                var pid = "${product.pid}";
                $(location).attr("href","<%=path%>/ShopcartAdd.action?pid="+pid+"&count="+count);
            })
        })
    </script>
</head>
<body>
<input type="hidden" id="category" value="${category}">
<input type="hidden" id="categorysecond" value="${categorysecond}">
<!-- 左侧类别 -->
<div class="productcategory">
    <c:forEach items="${categoryList}" var="categoryList">
        <div class="category" >
            <a href="${path}/product/productfindByCid.action?cid=${categoryList.cid}">${categoryList.cname}</a>
        </div>
        <!-- 显示二级分类 -->
        <div>
            <c:forEach items="${categoryList.categorySecond}" var="categorySecond">
                <c:if test="${categorySecond.cid==categoryList.cid}">
                    <span><a href="${path}/product/productfindByCsid.action?csid=${categorySecond.csid}">${categorySecond.csname}</a></span>
                </c:if>
            </c:forEach>
        </div>
    </c:forEach>
</div>
<!--右侧商品详情 -->
<div class="productInfo">
    <div class="up">
        <div class="leftImage">
            <img src="<%=path%>/images/upload/${product.image}">
        </div>
        <div class="right">
            <div class="productName">${product.pname}</div>
            <div class="productID">编号：${product.pid}</div>
            <div class="productPrice">
                商城价:<span class="shopprice">￥：${product.shopprice}元</span>
                参考价:<span class="marketprice"><s>￥：${product.marketprice}元</s></span>
            </div>
            <div class="cuxiao">
                促销：<span>限时抢购</span>
            </div>
            <div class="buy">
                <div class="count">
                    购买数量:<input type="number" name="" id="count" value="1">件
                </div>
                <div class="shopcartAdd">
                    <button class="shopcartBtn">加入购物袋</button>
                </div>
            </div>
        </div>
    </div>
    <div class="productDesc">商品介绍</div>
    <div class="productDescInfo">${product.pdesc}</div>
    <div class="productImage">
        <img src="<%=path%>/images/upload/${product.image}">
    </div>
</div>

</body>
</html>
