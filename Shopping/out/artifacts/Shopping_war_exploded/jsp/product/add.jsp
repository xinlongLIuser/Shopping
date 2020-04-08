<%-- 
  Created by IntelliJ IDEA. 
  2019/04/11 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%>
<html> 
<head>
    <%--<script src="${path}/js/jquery-3.3.1.min.js"></script>--%>
    <title>Title</title>
    <script>
        $(function () {
            var image = "";
            $("#image").change(function () {
                var formData = new FormData($('#form')[0]);//获取表单中的文件
                // formData.append()
                // var formData = new FormData();
                // formData.append('file', $('#image')[0].files[0]);
                console.log(formData);
                 image =$("#image")[0].files[0].name;
                $.ajax({
                    url: '${path}/upload/fileupload.action',
                    type: 'POST',
                    cache: false,
                    data: formData,
                    processData: false, //aja不使用序列化，如果是true时，不会序列化data数据，而是直接使用data
                    contentType: false //不设置内容格式
                }).done(function(res) {//成功的方法
                    $("#uploadButton").html("上传成功").attr("disabled",true);
                }).fail(function(res) {
                    alert("上传失败");
                });
            })

            $("#ok").click(function () {
                var data = {};
                var pname = $("#pname").val();
                data["pname"] = pname;
                var marketprice = $("#marketprice").val();
                data["marketprice"] = marketprice;
                var shopprice = $("#shopprice").val();
                data["shopprice"] = shopprice;
                data["image"] = image;
                var pdesc = $("#pdesc").val();
                data["pdesc"] = pdesc;
                var ishot = $("#ishot").val();
                data["ishot"] = ishot;
                var csid = $("#csid").val();
                data["csid"] = csid;
                $.post("${path}/product/insert.action",data,function(data){
                    //跳转到列表
                    if(data=='Y'){
                        $(location).attr("href","<%=path%>/product/list.action");
                    }else{
                        $("#error").html("添加失败").css("color","red");
                    }
                })
            })
            //下拉列表
            $.post("<%=path%>/categorysecond/ajaxList.action",function(result){
                //字符串转json
                var data = JSON.parse(result);
                var option = '<option value="">请选择</option>';
                $.each(data,function(key,value){
                    option+='<option value='+key+'>'+value.csname+'</option>'
                })
                $("#csid").html(option);
            })
        })
    </script>
</head> 

<body class="main">
    <h1>添加商品信息</h1>
    <div class="update"> 
        <div class="left"> 
            <span>商品名称</span> 
            <input type="text" name="pname" id="pname" value="">
        </div> 
        <div class="right"> 
            <span>市场价格</span> 
            <input type="text" name="marketprice" id="marketprice"  value="">
        </div> 
        <div class="left"> 
            <span>商品价格</span> 
            <input type="text" name="shopprice"  id="shopprice" value="2222">
        </div> 
        <div class="right">
            <form id="form" method="post" enctype="multipart/form-data">
                <span>图片</span>
                <input type="file" id="image" name="file" multiple="multiple">
            </form>
        </div> 
        <div class="left"> 
            <span>商品说明</span>
            <textarea rows="8" style="width: 200px" id="pdesc">

            </textarea>
        </div> 
        <div class="right"> 
            <span>是否热卖</span>
            <select id="ishot">
                <option></option>
                <option value="1">是</option>
                <option value="0">否</option>
            </select>
        </div> 
        <div class="left"> 
            <span>日期</span> 
            <input type="date" name="pdate" id="pdate" value="">
        </div> 
        <div class="right"> 
            <span>二级分类名称</span> 
            <%--<input type="text" name="csid" value="">--%>
            <select id="csid">
            </select>
        </div>
        <div class="right">
        </div> 
        <div id="error"></div> 
        <div class="buttons"> 
            <input type="submit"id="ok" value="提交">
            <input type="button" onclick="history.back()" value="返回"> 
        </div> 
    </div>
</body> 
</html> 
 
