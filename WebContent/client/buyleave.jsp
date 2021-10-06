<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="http://kfu.soft.net"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品评价</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css">
</head>
<body>
	<p:user/>
	<jsp:include page="head.jsp" />
	<jsp:include page="querymarket.jsp" />
<form action="${pageContext.request.contextPath}/leave?id=${p.id}" method="post">
		<table>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">商品评价：</td>
				<td class="ta_01" bgColor="#ffffff" colSpan="3">
					<textarea type="text"  id="context" name="context"   cols="30" rows="3" style="WIDTH: 96%"></textarea>
				</td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#ffffff" colSpan="4">
					<input type="submit" class="button_ok" value="评价">	
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" class="button_cancel">					
					<FONT face="宋体">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
</form>
<!-- 1.商城底部 start -->
       <%@include file="foot.jsp"%>
<!-- 商城底部  end -->
</body>
</html>