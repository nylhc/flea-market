<%@page import="cn.kfu.soft.market.entity.UserBean"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="cn.kfu.soft.market.entity.UserBean"%>
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form name="Form1" method="post" id="Form1">
	<table width="100%" border="0" height="88" background="${pageContext.request.contextPath}/admin/images/back1.jpg">
		<tr>
			<td width="65%" height="84" align="center" valign="top" >
				<br />
				<% 
				UserBean users = (UserBean) request.getSession().getAttribute("user");%>
				<span class="size:48;" style="color: red">${users.username}登录成功！</span>
			</td>
		</tr>
		<tr><td height=2></td></tr>	
	</table>
	</form>
</body>
</html>