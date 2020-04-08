<%--<%@ page isELIgnored="false" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%
    String path = request.getContextPath();
%>

<script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>
<%
    request.getRequestDispatcher("/index/IndexAction.action").forward(request,response);
%>

