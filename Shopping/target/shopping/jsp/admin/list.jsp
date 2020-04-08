<%-- 
  Created by IntelliJ IDEA. 
  2018/08/09 
  To change this template use File | Settings | File Templates. 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/common/common.jsp" %>
<html>
<head>
    <link href="${path}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css" href="<%=path%>/css/home.css">--%>
    <script type="text/javascript" src="${path}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${path}/css/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".addBtn").click(function () {
                $(location).attr("href", "${path}/jsp/admin/add.jsp");
            })
            $(".update").click(function () {
                var userId = $(this).attr("name");
                location.href = "${path}/admin/load.action?uid=" + userId;
            })
            $(".delImg").click(function () {
                if (confirm("确定删除吗？")) {
                    $.post("${path}/admin/delete.action", {uid: this.id}, function (data) {
                        if (data == 'Y') {
                            $(location).attr("href", "${path}/admin/AdminuserList.action");
                        } else {
                            alert("删除失败");
                            return false;
                        }
                    })
                }
            })
            $(".distribute").click(function () {
                var uid = $(this).attr("name");
                <%--location.href="${path}/admin/distributeLoad.action?uid="+uid;--%>
                window.parent.open("${path}/admin/distributeLoad.action?uid=" + uid, '修改密码', 'height=600, width=1200, top=200, left=300');

            })
            $("#search").click(function () {
                var username = $("#username").val();
                console.log(username);
                location.href = "${path}/admin/search.action?username=" + username;
            })
        })
    </script>
</head>
<%--<input type="hidden" id="currentPage" value="${pageUtil.currentPage}"> --%>
<%--<input type="hidden" id="totalPage" value="${pageUtil.totalPage}"> --%>
<body class="main">
<h1>后台用户列表</h1>
<div class="search">
       <span>
            用户名：<input type="text" id="username" value="${searchObject.username}">
        </span>
    <span>
            <button id="search">查询</button>
        </span>
    <span>
            <button class="addBtn">增加</button>
        </span>
</div>
<center>
    <table border="1" cellspacing="0" cellpadding="0">
        <thead>
        <td>序号</td>
        <td>用户名</td>
        <td>密码</td>
        <td>性别</td>
        <td>科室</td>
        <td>编辑</td>
        <td>删除</td>
        <td>分配</td>
        </thead>
        <tbody>
        <c:forEach var="adminuser" items="${list}" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${adminuser.username}</td>
                <td>${adminuser.password}</td>
                <td>${adminuser.sex}</td>
                <td>${adminuser.basedept.deptName}</td>
                <td>
                    <img src="<%=path%>/images/edit.gif" class="update" name="${adminuser.uid}"></a>
                </td>
                <td>
                    <img src="<%=path%>/images/del.gif" id="${adminuser.uid}" class="delImg">
                </td>
                <td><img src="${path}/images/distribute.gif" class="distribute" name="${adminuser.uid}"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</center>
<hr style="height:1px;border:none;border-top:2px solid #ccc;"/>
<!-- 分页导航栏 -->
<!-- 分页信息 -->
<div class="row">
    <%--<!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->--%>
    <div class="col-md-3">
    </div>
    <!-- 分页条 -->
    <div class="page text-right" style="margin-top: 40px">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <%--<li><a href="${path}/admin/AdminuserList.action?pn=1">首页--%>
                </a>
                </li>
                <c:if test="${page.hasPreviousPage}">
                    <li>
                        <a href="${path}/admin/AdminuserList.action?pn=${page.pageNum-1}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach items="${page.navigatepageNums}" var="page_Num">
                    <c:if test="${page_Num == page.pageNum}">
                        <li class="active"><a href="#">${ page_Num}</a></li>
                    </c:if>
                    <c:if test="${page_Num != page.pageNum }">
                        <li><a href="${path}/admin/AdminuserList.action?pn=${ page_Num}">${ page_Num}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${page.hasNextPage}">
                    <li>
                        <a href="${path}/admin/AdminuserList.action?pn=${page.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>
</body>
</html> 
