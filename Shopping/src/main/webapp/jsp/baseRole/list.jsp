<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/25 0025
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp"%>
<html>
<head>
    <title>Title</title>

    <script>
        $(function () {
            $("#addBtn").click(function () {
                location.href="${path}/jsp/baseUser/add.jsp";
            })
            $(".update").click(function () {
                var userId = $(this).attr("name");
                location.href="${path}/baseUser/load.action?userId="+userId;
            })
            $(".delete").click(function () {
                var userId = $(this).attr("name");
                location.href="${path}/baseUser/delete.action?userId="+userId;
            })
            $("#search").click(function () {
                var cname = $("#cname").val();
                var sex = $("#sex").val();
                location.href = "${path}/baseUser/list.action?cname="+cname+"&sex="+sex;
            })
            $(".distribute").click(function () {
                var rid = $(this).attr("name");
                <%--location.href="${path}/baseRole/distributeLoad.action?rid="+rid;--%>
                window.parent.open("${path}/baseRole/distributeLoad.action?rid="+rid, '修改密码', 'height=600, width=1200, top=200, left=300');

            })

        })
    </script>
</head>
<body class="main">
    <div class="search">
        <span>
           角色：<input type="text" id="cname" value="${searchObject.cname}">
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
            <td>角色</td>
            <td>修改</td>
            <td>删除</td>
            <td>授权</td>
        </thead>
        <c:forEach items="${list}" var="baseRole" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${baseRole.rname}</td>
                <td><img src="${path}/images/edit.gif" class="update" name="${baseRole.rid}"></td>
                <td><img src="${path}/images/del.gif" class="delete" name="${baseRole.rid}"></td>
                <td><img src="${path}/images/distribute.gif" class="distribute" name="${baseRole.rid}"></td>
            </tr>
        </c:forEach>
    </table>


</body>
</html>
