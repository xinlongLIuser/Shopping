<%--
  Created by IntelliJ IDEA.
  User: chlove
  Date: 2019-04-11
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp" %>
<html>
<script src="${path}/js/ajaxupload.js"></script>
<head>
    <title>Title</title>

    <%--<script src="${path}/js/jquery-3.3.1.min.js"></script>--%>

    <script>
        $(function () {
            // var image = "";
            $("#image").change(function () {
                var formData = new FormData($('#form')[0]);//获取表单中的文
                // console.log($('#image')[0].files[0]);
                $.ajax({
                    url: '${path}/upload/fileupload.action',
                    type: 'POST',
                    cache: false,
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        console.log(data);
                        $("#uploadButton").html("上传成功").attr("disabled", true);
                    },
                    error: function (data) {
                        console.log(data);
                        alert("操作失败");
                    }
                })
            })

        })
    </script>
</head>
<body>
<img width="100" height="100" id="ImgUrl"/>
<%--<form id="formTag" enctype="multipart/form-data">--%>
<%--<div class="uploadImgBtn" id="uploadImgBtn">--%>
<%--<input class="uploadImg" type="file" name="file" id="tpfile">--%>
<%--</div>--%>
<%--</form>--%>
<%--<form id="test">--%>
<%--选择文件:<input data-role="none" type="file" name="file" width="120px">--%>
<%--<button data-role="none" onclick="testUpload();">测试</button>--%>
<%--</form>--%>
<form id="form" method="post" enctype="multipart/form-data">

<input type="file" id="image" name="file" multiple="multiple">
<%--<input type="button" value="上传文件解析" id="upload"/><br/>--%>
</form>
</body>
</html>
