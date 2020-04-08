<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/15 0015
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


        })
        //查询商品信息
        var productInfo = function (pid) {
            $(location).attr("href", "<%=path%>/product/ProductInfo.action?pid=" + pid);
        }
    </script>
</head>
<body>
<%--<input type="text" id="category1" value="${category}">--%>
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
<div class="productlist">
    <div class="products">
        <c:forEach var="product" items="${productList}" varStatus="status">
            <c:if test="${status.count<=5}">
                <div class="product" onclick="productInfo(${product.pid})">
                    <img src="<%=path%>/images/upload/${product.image}">
                    <div class="productName">${product.pname}</div>
                    <div class="productPrice">商城价：￥${product.shopprice}</div>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <div class="products">
        <c:forEach var="product" items="${productList}" varStatus="status">
            <c:if test="${status.count>5}">
                <div class="product" onclick="productInfo(${product.pid})">
                    <img src="<%=path%>/images/upload/${product.image}">
                    <div class="productName">${product.pname}</div>
                    <div class="productPrice">商城价：￥${product.shopprice}</div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>


</body>
</html>
