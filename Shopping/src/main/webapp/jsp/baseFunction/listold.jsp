<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/26
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp"%>
<html>
<head>
    <link href="${path}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <title>Title</title>
    <script>
        $(function () {
            $("#addBtn").click(function () {
                location.href = "${path}/jsp/baseFunction/add.jsp";
            })
            $(".edit").click(function () {
                var fid = $(this).attr("name");
                location.href = "${path}/baseFunction/load.action?fid="+fid;
            })
            $("#searchBtn").click(function () {
                var name = $("#name").val();
                console.log(name);
                location.href = "${path}/baseFunction/search.action?name="+name;
            })
            $(".del").click(function () {
                var fid = $(this).attr("name");
                location.href = "${path}/baseFunction/delete.action?fid="+fid;
            })
        })
    </script>
</head>
<body class="main">
    <div class="search">
        <span>功能名称 <input type="text" id="name" value="${searchObject.name}"></span>

        <span>
            <button id="searchBtn">查询</button>
        </span>
        <span>
            <button id="addBtn">增加</button>
        </span>
    </div>
    <table cellpadding="0" cellspacing="0" border="1">
        <thead>
            <td>序号</td>
            <td>功能名称</td>
            <td>模块名称</td>
            <td>url</td>
            <td>编辑</td>
            <td>删除</td>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="baseFunction" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${baseFunction.name}</td>
                    <td>${baseFunction.pid}</td>
                    <td>${baseFunction.url}</td>

                    <td><img src="${path}/images/edit.gif" alt="" class="edit" name="${baseFunction.fid}"></td>
                    <td><img src="${path}/images/del.gif" class="del" name="${baseFunction.fid}"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
