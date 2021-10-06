<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>菜单</title>
	<style type="text/css">
		body {background-color: #ffffff;margin: 0px;text-align:left;}
		a:link,a:visited{text-decoration:none;}
		.left_list{font-size:14px; margin-top:10px; padding-right:12px; display:block; width:135px; height:30px; line-height:30px; border-bottom:1px dotted #ccc; color:#234a7b; text-align:center; font-family:"微软雅黑";}
		.left_list:hover{background:#ff3e3e; color:skyblue;}
	</style>
</head>
	<body>
		<table width="100" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td height="12"></td>
		  </tr>
		</table>
		<table width="100%" border="0">
			  <tr>
			  	<td><a href="${pageContext.request.contextPath}/listProduct" target="mainFrame" class="left_list">商品管理</a></td>
			  </tr>
			  <tr>
			  	<td><a href="${pageContext.request.contextPath}/findOrders" target="mainFrame" class="left_list">订单管理</a></td>
			  </tr>
		</table>
	</body>
</html>
