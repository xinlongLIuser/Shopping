<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'moduleManage.jsp' starting page</title>

	  <link rel="stylesheet" href="<%=basePath%>/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ztree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ztree/js/jquery.ztree.excheck.js"></script>
	
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		
		$(function() {
			var setting = {
					check: {
						enable: true,
						chkStyle: "checkbox",
						chkboxType: { "Y": "ps", "N": "ps" }
					},
					data: {
						simpleData: {
                            idKey : "fid",
                            pIdKey : "pid",
                            rootPId : 0,
							enable: true
						}
					}
				};
			
			$.ajax({
				url: "baseFunction/ajaxList.action",
				dataType: "json",
				success : function(data) {
					$.fn.zTree.init($("#treeDemo"), setting, data).expandAll(true);
				}
			});
			
		});
		function submitForm() {
			var ids = '';
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			for (var i = 0; i < nodes.length; i++) {
				if(ids == '') {
					ids += nodes[i].fid;
				} else {
					ids += ","+nodes[i].fid;
				}
			}
			console.log(treeObj);
			
		if ($("input[name=rid]:checked").val()==undefined) {
			alert("请选择一个角色！");
			return;
		}
		
		if (ids=='') {
			alert("请选择模块！");
			return;
		}
			$("#rid").val($("input[name=rid]:checked").val());
			var fid=$("#fid").val(ids);
			console.log(fid);
			$("#addForm").submit();
		}
		
		function showBack() {
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			for (var i=0; i<nodes.length; i++) {
				var node = nodes[i];
				node.checked = false;
				treeObj.updateNode(node);
			}
			var rid = $("input[name=rid]:checked").val();
			$.ajax({
				data:{rid:rid},
				url: "baseRoleFunction/ajaxGetModuleIdsByRoleId.action",
				dataType: "json",
				success: function(data) {
					// console.log(data);
					for(var i=0; i<data.length; i++) {
						var fid = data[i];
						var node = treeObj.getNodeByParam("fid",fid,null);
						node.checked = true;
						treeObj.updateNode(node);
					}
				}
			});
		}
		
	</script>
  </head>
  
      <div class="container">
				<div class="row">
				 	  <div class="col-md-4">
					  		<div class="page-header">
					  			 <h3>系统角色</h3>
					  		</div>
					  		<div class="table-responsive">
					  			<table class="table table-bordered table-striped">
					  				<thead>
					  					<tr>
									 		<td>#</td>
									 		<td>职务</td>
								 		</tr>
					  				</thead>
								 	<tbody>
								 		<c:forEach items="${roleList}" var="role">
									 		<tr>
										 		<td><input type="radio" name="rid" value="${role.rid}" onclick="showBack()"></td>
										 		<td>${role.rname}</td>
										 	</tr>
								 		</c:forEach>
								 	</tbody>
								</table>
					  		</div>
					  </div>
					  <div class="col-md-8">
						  <div class="page-header">
						  		<h3>当前菜单目录</h3>
						  </div>
					  	  <ul id="treeDemo" class="ztree"></ul>
					  </div>
				</div>
				<div class="row">
					<div class="form-group">
						    <div class="col-sm-offset-4 col-sm-10">
						      <button type="button" onclick="submitForm()" class="btn btn-default">保存</button>
						    </div>
				   </div>
				</div>
				<form id="addForm" action="baseRole/addRoleModuleRelation.action" role="form" method="post">
					<input type="hidden" id="rid" name="rid">
					<input type="hidden" id="fid" name="fid">
				</form>
	 </div>
</html>
