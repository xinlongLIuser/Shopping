<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/common.jsp"></jsp:include>
<jsp:include page="top.jsp"></jsp:include>

<html>
<head>
    <title>订单页面</title>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="productcategory">
    <c:forEach items="${categoryList}" var="categoryList">
        <div class="category" >
            <a href="${path}/product/productfindByCid.action?cid=${categoryList.cid}">${categoryList.cname}</a>
        </div>
    </c:forEach>
</div>

<div class="container cart">

    <div class="span24">

        <div class="step step1">
            <ul>
                <li class="current"></li>
                <li>生成订单成功</li>
                <li>订单号:${order.oid}</li>
            </ul>
        </div>

        <table>
            <tbody>
            <tr>
                <th>图片</th>
                <th>商品</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>
            <c:forEach items="${order.orderItems}" var="orderItem">
                <tr>
                    <td width="60">
                        <img src="${ pageContext.request.contextPath }/images/upload/${orderItem.product.image}"/>
                    </td>
                    <td>
                        <a target="_blank">${orderItem.product.pname}</a>
                    </td>
                    <td>
                            ${orderItem.product.shopprice}
                    </td>
                    <td class="quantity" width="60">
                            ${orderItem.count}
                    </td>
                    <td width="140">
                        <span class="subtotal">￥${orderItem.subtotal}</span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <dl id="giftItems" class="hidden" style="display: none;">
        </dl>
        <div class="total">
            <em id="promotion"></em>
            商品金额: <strong id="effectivePrice">￥${order.total}元</strong>
        </div>
        <form id="orderForm" action="${pageContext.request.contextPath }/orders/orderPayOrder.action" method="post">
            <input type="hidden" name="orderId" value="${order.oid }"/>
            <div class="span24">
                <p>
                    收货地址：<input name="orderAddr" type="text" value="${order.user.addr}" style="width:350px"/>
                    <br/>
                    收货人&nbsp;&nbsp;&nbsp;：<input name="name" type="text" value="${order.user.username}"
                                                 style="width:150px"/>
                    <br/>
                    联系方式：<input name="orderPhone" type="text" value="${order.user.phone}" style="width:150px"/>

                </p>
                <hr/>
                <p>
                    选择银行：<br/>
                    <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
                    <img src="${pageContext.request.contextPath}/images/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
                    <img src="${pageContext.request.contextPath}/images/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
                    <img src="${pageContext.request.contextPath}/images/bank_img/abc.bmp" align="middle"/>
                    <br/>
                    <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
                    <img src="${pageContext.request.contextPath}/images/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
                    <img src="${pageContext.request.contextPath}/images/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
                    <img src="${pageContext.request.contextPath}/images/bank_img/ccb.bmp" align="middle"/>
                    <br/>
                    <input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
                    <img src="${pageContext.request.contextPath}/images/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
                    <img src="${pageContext.request.contextPath}/images/bank_img/cmb.bmp" align="middle"/>
                </p>
                <hr/>
                <p style="text-align:right">
                    <a href="javascript:document.getElementById('orderForm').submit();">
                        <img src="${pageContext.request.contextPath}/images/front/finalbutton.gif" width="204"
                             height="51" border="0"/>
                    </a>
                </p>
            </div>
        </form>
    </div>
</div>
</body>
</html>