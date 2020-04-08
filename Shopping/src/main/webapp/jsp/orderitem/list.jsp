<%-- 
  Created by IntelliJ IDEA. 
  2019/04/14 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <script type="text/javascript"> 
        $(function () { 
            $("#addBtn").click(function () { 
                location.href="${path}/jsp/orderitem/add.jsp";
             })
            $(".update").click(function () { 
                var itemid = $(this).attr("name");
                location.href="${path}/orderitem/load.action?itemid="+itemid;
             })
            $(".delete").click(function () { 
                var itemid = $(this).attr("name");
                location.href="${path}/orderitem/delete.action?itemid="+itemid;
             })
            $("#search").click(function () { 
                var count = $("#count").val();
                location.href = "${path}/orderitem/search.action?count="+count;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            ：<input type="text" id="count" value="${searchObject.count}"> 
        </span> 
        <span> 
            <button id="search">查询</button> 
        </span> 
        <span> 
            <button id="addBtn">增加</button> 
        </span> 
    </div> 
    <table> 
        <thead> 
            <td>序号</td> 
            <td></td> 
            <td></td> 
            <td></td> 
            <td></td> 
            <td>编辑</td> 
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="orderitem" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td> 
                <td>${orderitem.count}</td> 
                <td>${orderitem.subtotal}</td> 
                <td>${orderitem.pid}</td> 
                <td>${orderitem.oid}</td> 
                <td><img src="${path}/images/edit.gif" class="update" name="${orderitem.itemid}"></td> 
                <td><img src="${path}/images/del.gif" class="delete" name="${orderitem.itemid}"></td> 
            </tr> 
        </c:forEach> 
    </table> 
</body> 
</html> 
