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
                location.href="${path}/jsp/categorysecond/add.jsp";
             })
            $(".update").click(function () { 
                var csid = $(this).attr("name");
                location.href="${path}/categorysecond/load.action?csid="+csid;
             })
            $(".delete").click(function () { 
                var csid = $(this).attr("name");
                location.href="${path}/categorysecond/delete.action?csid="+csid;
             })
            $("#search").click(function () { 
                var csname = $("#csname").val();
                location.href = "${path}/categorysecond/search.action?csname="+csname;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            二级分类名称：<input type="text" id="csname" value="${searchObject.csname}"> 
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
            <td>二级分类名称</td> 
            <td>一级分类名称</td>
            <td>编辑</td> 
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="categorysecond" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td> 
                <td>${categorysecond.csname}</td> 
                <td>${categorysecond.category.cname}</td>
                <td><img src="${path}/images/edit.gif" class="update" name="${categorysecond.csid}"></td> 
                <td><img src="${path}/images/del.gif" class="delete" name="${categorysecond.csid}"></td> 
            </tr> 
        </c:forEach> 
    </table> 
</body> 
</html> 
