<%-- 
  Created by IntelliJ IDEA. 
  2019/04/11 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head>
    <link href="${path}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript"> 
        $(function () { 
            $("#addBtn").click(function () { 
                location.href="${path}/jsp/product/add.jsp";
             })
            $(".update").click(function () { 
                var pid = $(this).attr("name");
                location.href="${path}/product/load.action?pid="+pid;
             })
            $(".delete").click(function () { 
                var pid = $(this).attr("name");
                location.href="${path}/product/delete.action?pid="+pid;
             })
            $("#search").click(function () { 
                var pname = $("#pname").val();
                location.href = "${path}/product/search.action?pname="+pname;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            商品名称：<input type="text" id="pname" value="${searchObject.pname}"> 
        </span> 
        <span> 
            <button id="search">查询</button> 
        </span> 
        <span> 
            <button id="addBtn">增加</button> 
        </span> 
    </div> 
    <table> 
        <thead style="white-space: nowrap">
            <td>序号</td> 
            <td>商品名称</td> 
            <td>市场价格</td> 
            <td>商品价格</td> 
            <td>图片</td> 
            <td>商品说明</td> 
            <td>是否热卖</td> 
            <td>日期</td> 
            <td>二级分类名称</td>
            <td>编辑</td> 
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="product" varStatus="status"> 
            <tr> 
                <td width="40px">${status.index+1}</td>
                <td  width="200px;">${product.pname}</td>
                <td width="40px">${product.marketprice}</td>
                <td>${product.shopprice}</td> 
                <td><img src="<%=path%>/images/upload/${product.image}" width="80px"></td>
                <td>${product.pdesc}</td>
                <td>
                    <%--<c:if test="${product.ishot==0}" var="flag" scope="session">否</c:if>--%>
                    <%--<c:if test="${not flag}">是</c:if>--%>
                    <c:choose>
                        <c:when test="${product.ishot==0}">
                            否
                        </c:when>
                        <c:otherwise>是</c:otherwise>
                    </c:choose>
                </td>
                <td>${product.pdate}</td> 
                <td width="80px">${product.categorysecond.csname}</td>
                <%--<td>${product.marketPrice}</td> --%>
                <%--<td>${product.shopPrice}</td> --%>
                <%--<td>${product.isHot}</td> --%>
                <td><img src="${path}/images/edit.gif" class="update" name="${product.pid}"></td> 
                <td><img src="${path}/images/del.gif" class="delete" name="${product.pid}"></td> 
            </tr> 
        </c:forEach> 
    </table>

    <hr style="height:1px;border:none;border-top:2px solid #ccc;" />
    <!-- 分页导航栏 -->
    <!-- 分页信息 -->
    <div class="row">
        <!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->
        <div class="col-md-3">
        </div>
        <!-- 分页条 -->
        <div class="pagination">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <%--<li><a href="${path}/user/UserList.action?pn=1">首页</a></li>--%>
                    <c:if test="${page.hasPreviousPage }">
                        <li>
                            <a href="${path}/product/list.action?pn=1" aria-label="Previous">
                                <span aria-hidden="true">首页</span>
                            </a>
                        </li>
                        <li>
                            <a href="${path}/product/list.action?pn=${page.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${page.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == page.pageNum }">
                            <li class="active"><a href="#">${ page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != page.pageNum }">
                            <li><a href="${path}/product/list.action?pn=${ page_Num}">${ page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${page.hasNextPage }">
                        <li>
                            <a href="${path}/product/list.action?pn=${page.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li>
                        <li>
                            <a href="${path}/product/list.action?pn=${page.pages}" aria-label="Previous">
                                <span aria-hidden="true">尾页</span>
                            </a>
                        </li>
                        </li>

                    </c:if>
                    <li><a>  当前第${page.pageNum}页</a></li>
                    <li><a>共${page.total}条数据
                    <li><a>总共：${page.pages}页</a></li>
                    <%--<li><a href="${path}/user/UserList.action?pn=${page.pages}">末页</a></li>--%>
                </ul>
            </nav>
        </div>
    </div>
</body> 
</html> 
