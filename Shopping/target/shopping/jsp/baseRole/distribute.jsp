<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/29 0029
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>下拉框</title>
    <style type="text/css">
        body {
            background-color: #FFFFE0;
        }

        select {
            width: 300px;
            height: 450px;
            padding: 10px;
            font-size: 14px;
            background-color: #bfbc7f;
            color: black;
        }

        select option {
            height: 30px;
            line-height: 30px;
            vertical-align: middle;
            padding-left: 10px;
            padding-top: 10px;
        }

        .title {
            display: inline-block;
            width: 45%;
            font-size: 30px;
            text-align: center;
            padding: 20px 0px;
        }

        #left {
            margin-left: 100px;
        }

        #right {
            margin-left: 20px;
        }

        .buttons {
            display: inline-block;
            height: 450px;
            width: 260px;
            vertical-align: top;
            text-align: center;
        }

        .buttons button {
            text-align: center;
            width: 160px;
            height: 40px;
            border-radius: 5px;
            margin-top: 50px;
            background-color: #ec7e9b;
            color: #ecc75c;
            border: 0px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $(function () {

                $(".buttons button:eq(0)").click(function () {
                    var selected = $("#left option:selected");
                    selected.remove();
                    var rightselected = $("#right");
                    selected.appendTo(rightselected);
                })
                $(".buttons button:eq(1)").click(function () {
                    var selected = $("#left option");
                    selected.remove();
                    var rightselected = $("#right");
                    selected.appendTo(rightselected);
                })

                $(".buttons button:eq(2)").click(function () {
                    var selected = $("#right option:selected");
                    selected.remove();
                    var leftselected = $("#left");
                    selected.appendTo(leftselected);
                })
                $(".buttons button:eq(3)").click(function () {
                    var selected = $("#right option");
                    selected.remove();
                    var leftselected = $("#left");
                    selected.appendTo(leftselected);
                })
                $(".buttons button:eq(4)").click(function () {
                    var url = "${path}/baseRole/distributeUpdate.action?rid=${rid}";
                    $("#right option").each(function () {
                        url += "&fid=" + $(this).val();
                    })
                    location.href = url;
                    window.close();
                })
            })

        })

    </script>
</head>
<body>

<div>
    <span class="title">未拥有功能</span>
    <span class="title">已拥有功能</span>
</div>
<select multiple="multiple" id="left">
    <c:forEach items="${leftList}" var="baseFunction">
        <c:if test="${baseFunction.pid==baseFunction.fid}" var="leftList">
            <style color="red"></style>

        </c:if>
        <c:choose>
            <c:when test="${baseFunction.url==null}">
                <option value="${baseFunction.fid}" style="color: red">${baseFunction.name}</option>
            </c:when>

            <c:otherwise>
                <option value="${baseFunction.fid}">${baseFunction.name}</option>
            </c:otherwise>
        </c:choose>


    </c:forEach>
</select>
<div class="buttons">
    <button>></button>
    <button>>></button>
    <button><</button>
    <button><<</button>
    <button>提交</button>
</div>
<select multiple="multiple" id="right">
    <c:forEach items="${rightList}" var="baseFunction">
        <option value="${baseFunction.fid}">${baseFunction.name}</option>
    </c:forEach>
</select>

</body>
</html>
