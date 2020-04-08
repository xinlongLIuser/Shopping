<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="top.jsp"></jsp:include>
<%
String path=request.getContextPath();

%>
<html>
<head>
    <title>我的订单页面</title>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container cart">

    <div class="span24">

        <div class="step step1">
            <ul>

                <li class="current"></li>
                <li>订单列表</li>
            </ul>
        </div>
        <table>
            <tbody>
            <c:forEach items="${orderList}" var="orderList">
                <tr>
                    <th colspan="5">
                        订单号:${orderList.oid}
                        金额:<font color="red">${orderList.total } </font>
                        状态 :<c:if test="${orderList.state==1}">
                        <a href="${ pageContext.request.contextPath }/findByOid?oid=${orderList.oid}"><font color="red">付款</font></a>
                    </c:if>
                        <c:if test="${orderList.state==2}">
                            已付款
                        </c:if>
                        <c:if test="${orderList.state==3}">
                            <a href=""><font color="red">确认收货</font></a>
                        </c:if>
                        <c:if test="${orderList.state==4}">
                            订单完成
                        </c:if>
                    </th>
                </tr>

                <tr align="center">
                    <td>图片</td>
                    <td>商品</td>
                    <td>价格</td>
                    <td>数量</td>
                    <td>小计</td>
                </tr>
                <tr>
                    <td width="60">
                        <img src="${pageContext.request.contextPath}/images/upload/${orderList.product.image}"/>
                    </td>
                    <td>
                        <a target="_blank"> ${orderList.product.pname}</a>
                    </td>
                    <td>
                            ${orderList.product.shopprice}
                    </td>
                    <td>${orderList.orderitem.count}</td>
                    <td>
                        <span class="subtotal">￥${orderList.orderitem.subtotal}</span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>