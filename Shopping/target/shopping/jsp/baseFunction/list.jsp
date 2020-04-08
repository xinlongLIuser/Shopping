<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'moduleManage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath%>/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ztree/js/jquery.ztree.core.js"></script>
	
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		
		$(function() {
			var setting = {
					data: {
						simpleData: {
                            idKey : "fid",
                            pIdKey : "pid",
                            rootPId : 0,
							enable: true

						},
						key: {
							url: "xxxooo"
						}
					},
					callback: {
						onClick: onClick
					}
				};
			$.ajax({
				url: " baseFunction/ajaxList.action",
				dataType: "json",
				success : function(data) {
					$.fn.zTree.init($("#treeDemo"), setting, data);
				}
			});
			$("#updateForm").hide();
			$("#addForm").hide();
		});
		
		function onClick(event, treeId, treeNode, clickFlag) {
			 $("#pid").val(treeNode.fid);
			$("#crruntPId").val(treeNode.name);
			$("#mName").text(treeNode.name);
			$("#addForm").hide();
			$("#updateForm").hide();
		}
		
		function update() {
			var fid = $("#pid").val();
			console.log(fid);
			$.ajax({
				data: {"fid":fid},
				url: "baseFunction/ajaxload.action",
				dataType: "json",
				success : function(data) {
					$("#addForm").hide();
					$("#updateForm").show();
					$("#updateForm input[name='name']").val(data.name);
					$("#updateForm input[name='fid']").val(data.fid);
					$("#updateForm input[name='url']").val(data.url);
					$("#updateForm input[name='pid']").val(data.pid);
					$("#updateForm input[name='isParent'][value='"+data.isParent+"']").attr("checked",true);
				}
			});
		}
		function addChild() {
			$("#addForm").show();
			$("#updateForm").hide();
		}
		
		function del() {
			var fid = $("#pid").val();
			console.log(fid);
			if(window.confirm("确定删除该菜单")){
				window.location.href= "baseFunction/delete.action?fid="+fid;
			}
		}


		
	</script>
  </head>
  
      <div class="container">
		<div class="row">
			  <div class="col-md-4">
				  <div class="page-header">
				  		<h3>当前菜单目录</h3>
				  </div>
			  	  <ul id="treeDemo" class="ztree"></ul>
			  </div>
			  <div class="col-md-8">
			  		<div class="page-header">
			  			 	<div class="row">
			  			 		<div class="col-md-6">
			  			 			<h3>当前节点:<span id="mName"></span></h3>
			  			 		</div>
			  			 		<div class="col-md-6" style="margin-top: 15px;">
			  			 			<button type="button" onclick="update()" class="btn btn-default">修改</button>
			  			 			<button type="button" onclick="del()" class="btn btn-default">删除</button>
			  			 			<button type="button" onclick="addChild()" class="btn btn-default">添加子模块</button>
			  			 		</div>
			  			 	</div>
			  		</div>
			  		<!-- 添加子模块form -->
			  		<form id="addForm" class="form-horizontal" action="baseFunction/insert.action" role="form" method="post">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">当前菜单:</label>
						    <div class="col-sm-6">
						       <input type="text" class="form-control" id="crruntPId" placeholder="选择一个节点" readonly>
						       <input type="hidden"  name="pid" id="pid"><!-- 父节点ID -->
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">菜单名称:</label>
						    <div class="col-sm-6">
						      <input type="text" class="form-control" name="name" placeholder="子菜单名称" required>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">URL:</label>
						    <div class="col-sm-6">
						      <input type="text" class="form-control" name="url" placeholder="子菜单url">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-default">保存</button>
						    </div>
						  </div>
						  
					</form>
					<!-- 修改form -->
					<form id="updateForm" class="form-horizontal" action="baseFunction/update.action" role="form" method="post">
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">菜单名称:</label>
						    <div class="col-sm-6">
						      <input type="text" class="form-control" name="name" placeholder="菜单名称" required>
						      <input type="hidden" name="fid">
						      <input type="hidden" name="pid">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">URL:</label>
						    <div class="col-sm-6">
						      <input type="text" class="form-control" name="url" placeholder="菜单url">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-default">修改</button>
						    </div>
						  </div>
					</form>
			  </div>
		</div>
	 </div>
</html>
