<%-- 
  Created by IntelliJ IDEA. 
  2019/04/14 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%--<%@include file="/common/common.jsp"%> --%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    request.setAttribute("path",path);
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${path}/css/home.css">
    <link rel="stylesheet" href="${path}/css/themes/blue/style.css" type="text/css"/>
    <!-- 弹出层插件 -->
    <link href="${path}/css/popup_layer.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${path}/js/popup_layer.js"></script>
    <script type="text/javascript"> 
        $(function () { 
            $("#addBtn").click(function () {
                location.href="${path}/jsp/orders/add.jsp";
             })
            $(".update").click(function () {
                var oid = $(this).attr("name");
                location.href="${path}/orders/load.action?oid="+oid;
             })
            $(".delete").click(function () {
                var oid = $(this).attr("name");
                location.href="${path}/orders/delete.action?oid="+oid;
             })
            $("#search").click(function () {
                var total = $("#total").val();
                location.href = "${path}/orders/search.action?total="+total;
             })

            <c:forEach var="order" items="${list}">
            //弹出层插件调用
            new PopupLayer({
                trigger:".clickedElement${order.oid}",
                popupBlk:"#showDiv${order.oid}",
                closeBtn:"#closeBtn${order.oid}",
                useOverlay: true,
                offsets: { x: 30, y: 4},

            });
            </c:forEach>
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            ：<input type="text" id="total" value="${searchObject.total}"> 
        </span> 
        <span> 
            <button id="search">查询</button> 
        </span> 
        <span> 
            <button id="addBtn">增加</button> 
        </span> 
    </div>
    <form id="Form1" name="Form1" method="post">
    <table> 
        <thead> 
            <td>序号</td> 
            <td>订单金额</td>
            <td>订单时间</td>
            <td>订单状态</td>
            <td>收货人</td>
            <td>收货人电话</td>
            <td>收货人地址</td>
            <td>编辑</td> 
            <td>删除</td>
           <td>订单详情</td>
        </thead> 
        <c:forEach items="${list}" var="orders" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td> 
                <td>${orders.total}</td> 
                <td>${orders.ordertime}</td> 
                <td>${orders.state eq 1 ?"已结清":"未付款"}</td>
                <td>${orders.name}</td> 
                <td>${orders.phone}</td> 
                <td>${orders.addr}</td>
                <td><img src="${path}/images/edit.gif" class="update" name="${orders.oid}"></td> 
                <td><img src="${path}/images/del.gif" class="delete" name="${orders.oid}"></td>
                <td><input type="button" value="订单详情" class="clickedElement${orders.oid}" /></td>
            </tr> 
        </c:forEach> 
    </table>
    </form>

    <!-- 弹出层 HaoHao added -->
    <c:forEach var="orders" items="${list}">

    <div id="showDiv${orders.oid}" class="blk" style="display:none;left: -800px; float: left">
        <div class="main">
            <h2>订单编号：<span id="shodDivOid" style="font-size: 13px;color: #999">${orders.oid }</span></h2>
            <a href="javascript:void(0);" id="closeBtn${orders.oid }" class="closeBtn">关闭</a>

            <div style="padding:20px;">
                <table id="showDivTab" style="width:100%">
                    <tr id='showTableTitle'>
                        <th width='20%'>图片</th>
                        <th width='25%'>商品</th>
                        <th width='20%'>价格</th>
                        <th width='15%'>数量</th>
                        <th width='20%'>小计</th>
                    </tr>
                    <c:forEach var="orderItem" items="${orders.orderItems}" >
                        <tr style='text-align: center;'>
                            <td>
                                <img src="<%=path%>/images/upload/${product.image}" width='70' height='60'>
                            </td>
                            <td><a target='_blank'>${orderItem.product.pname}</a></td>
                            <td>${orderItem.product.shopprice}</td>
                            <td>${orderItem.count}</td>
                            <td><span class='subtotal'>￥${orderItem.subtotal}</span></td>
                        </tr>
                    </c:forEach>


                </table>
            </div>
        </div>

    </div>
    <div align="center">
        </c:forEach>
</body> 
</html>