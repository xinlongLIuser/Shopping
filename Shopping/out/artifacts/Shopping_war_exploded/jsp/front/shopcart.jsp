<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/12 0012
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="top.jsp"></jsp:include>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/frontindex.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/popup.css">
    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //计算总金额
             var sum = 0;
            $("tbody tr").each(function () {
                var xiaoji = $(this).find("td").eq(4).find("span").html();
                var numsum=parseFloat(xiaoji);
                   sum += numsum;
            })
            $(".totalprice").html("￥"+sum);

        })
    </script>
</head>
<body>
<input type="hidden" id="category" value="${category}">
<input type="hidden" id="categorysecond" value="${categorysecond}">

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
<!-- 购物车 -->
<div class="shopcart">
    <div class="title">购物车信息</div>
    <c:if test="${sessionScope.cartList.cartItems.size()==0}">
        <div class="step step1">
            <a href="${ pageContext.request.contextPath}/index/IndexAction.action"><h2>您还没有购物!请先去购物!</h2></a>
        </div>
    </c:if>
    <c:if test="${sessionScope.cartList.cartItems.size()>0}">
            <table cellpadding="0" cellspacing="0" style="width: 888px">
                <thead>
                <tr>
                    <td>图片</td>
                    <td>商品名称</td>
                    <td>价格</td>
                    <td>数量</td>
                    <td>小计</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.cartList.cartItems}" var="cartItems">
                    <tr>
                        <td width="60">
                            <img src="${path}/images/upload/${cartItems.product.image}"/>
                        </td>
                        <td>
                            <a target="_blank">${cartItems.product.pname}</a>
                        </td>
                        <td>
                            ￥${cartItems.product.shopprice}
                        </td>
                        <td class="quantity" width="60">
                                ${cartItems.count}
                        </td>
                        <td width="140">
                            ￥<span class="subtotal">${cartItems.subtotal}</span>
                        </td>
                        <td>
                            <a href="${path}/removeCart.action?pid=${cartItems.product.pid}" class="delete">删除</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>
            <div class="totalinfo" style="width: 888px;">
                商品总金额：<span class="totalprice"></span>
            </div>
            <div class="buttons" style="width: 888px">
                <a href="<%=path%>/clearCart.action">清空购物车</a>
                <%--<button id="ok">提交订单</button>--%>
                <a href="${path}/orders/saveOrder.action" class="sumbit">加入购物车</a>
            </div>
    </c:if>

</div>

</body>
</html>
