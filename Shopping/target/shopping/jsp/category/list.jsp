<%-- 
  Created by IntelliJ IDEA. 
  2019/04/11 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <script type="text/javascript"> 
        $(function () { 
            $("#addBtn").click(function () { 
                location.href="${path}/jsp/category/add.jsp";
             })
            $(".update").click(function () { 
                var cid = $(this).attr("name");
                location.href="${path}/category/load.action?cid="+cid;
             })
            $(".delete").click(function () { 
                var cid = $(this).attr("name");
                location.href="${path}/category/delete.action?cid="+cid;
             })
            $("#search").click(function () { 
                var cname = $("#cname").val();
                location.href = "${path}/category/search.action?cname="+cname;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            一级分类名称：<input type="text" id="cname" value="${searchObject.cname}"> 
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
            <td>一级分类名称</td> 
            <td>编辑</td> 
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="category" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td> 
                <td>${category.cname}</td> 
                <td><img src="${path}/images/edit.gif" class="update" name="${category.cid}"></td> 
                <td><img src="${path}/images/del.gif" class="delete" name="${category.cid}"></td> 
            </tr> 
        </c:forEach> 
    </table> 
</body> 
</html> 
