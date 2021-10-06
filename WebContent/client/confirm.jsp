<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="http://kfu.soft.net"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
<title>确认支付</title>
</head>
<body>
	<p:user/>
	<!-- 确认支付form -->
	<form action="${pageContext.request.contextPath }/orderstate" method="post">
		<h3>订单号：${orderid},付款金额 ：${money}</h3>
			<input type="hidden" name="orderid" value="${orderid}"/> 
			<input type="submit" style="border: none; height:40px; width:100px; background-color:#ff3e3e; font-size:18px ;margin-top: 3%;font-family: 仿宋;color: whitesmoke" value="确定支付">
	</form>
</body>
</html>