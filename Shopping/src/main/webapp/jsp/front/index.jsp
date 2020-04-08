<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/10 0010
  Time: 15:42
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
    <title>唯品会</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/frontindex.css">
    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/lunbo.js"></script>
    <script type="text/javascript">
        //查询商品信息
        var productInfo = function (pid) {
            $(location).attr("href","<%=path%>/product/ProductInfo.action?pid="+pid);
        }
    </script>
</head>
<body onload="aa()">

    <!-- 轮播图 -->
    <div class="section_centre">
        <div class="lunbo">
            <img src="<%=path%>/images/front/lunbo1.jpg" id="img">
            <div class="lunbo_div1">
                时尚风暴 唯爱表达
            </div>
            <div class="lunbo_div1">
                七夕情缘季
            </div>
            <div class="lunbo_div1">
                约惠七夕 2件7折
            </div>
            <div class="lunbo_div1">
                开学狂欢季
            </div>
        </div>
    </div>

    <div class="product">
        <!-- 热门商品 -->
        <div class="desc">——  热门商品 ——</div>

        <div class="images">
            <c:forEach var="product" items="${hotProductList}" varStatus="status">
                <c:if test="${status.count<=5}">
                        <img src="<%=path%>/images/upload/${product.image}" onclick="productInfo(${product.pid})">
                </c:if>
            </c:forEach>
        </div>
        <div class="images">
            <c:forEach var="product" items="${hotProductList}" varStatus="status">
                <c:if test="${status.count>5}">
                    <img src="<%=path%>/images/upload/${product.image}" onclick="productInfo(${product.pid})">
                </c:if>
            </c:forEach>
        </div>

        <!-- 最新商品 -->
        <div class="desc">—— 最新商品 ——</div>
        <div class="images">
            <c:forEach var="product" items="${newProductList}" varStatus="status">
                <c:if test="${status.count<=5}">
                    <img src="<%=path%>/images/upload/${product.image}" onclick="productInfo(${product.pid})">
                </c:if>
            </c:forEach>
        </div>
        <div class="images">
            <c:forEach var="product" items="${newProductList}" varStatus="status">
                <c:if test="${status.count>5}">
                    <img src="<%=path%>/images/upload/${product.image}" onclick="productInfo(${product.pid})">
                </c:if>
            </c:forEach>
        </div>
    </div>
</body>
</html>
