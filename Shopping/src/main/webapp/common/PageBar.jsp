<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
    var contextPath = "${path}";
</script>

<center>
<div class="page">
    共<span>[${page.totalPages}]</span>页&nbsp&nbsp&nbsp当前第<span>[${page.currentPage}]</span>页
    <a id="fy" href="${path}/${page.url}?pageNo=${1}">首页</a>
    <a id="sy" href="${path}/${page.url}?pageNo=${(page.currentPage>1)?(page.currentPage-1):1}">上一页</a>
    <c:forEach var="pageNo" begin="${page.startIndex}" end="${page.endIndex}">
        <a id="pc" href="${path}/${page.url}?pageNo=${pageNo}">${pageNo}</a>
    </c:forEach>
    <a id="xy" href="${path}/${page.url}?pageNo=${(page.currentPage<page.totalPages) ? (page.currentPage+1):page.currentPage}">下一页</a>
    <a id="y" href="${path}/${page.url}?pageNo=${page.totalPages}">末页</a>
</div>
</center>