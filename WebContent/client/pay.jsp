<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="p" uri="http://kfu.soft.net"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>在线支付</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css">
<style type="text/css">
	.center {
		font-weight: 900;
		color:red;
		font-size:18 !important;
		text-align:center
		!important
	}
</style>
</head>
<body>
<div>
<!-- 1.商城顶部 start -->
       <%@include file="head.jsp"%>
<!-- 商城顶部  end -->
<!--2. 商城搜索  start -->
       <%@include file="querymarket.jsp" %>
<!-- 商城搜索  end -->
</div>
<div class="center">
	<p:user/>
	<form action="${pageContext.request.contextPath}/pay" method="post">
		订单号：<INPUT TYPE="text" NAME="orderid" value="${param.id}">
		支付金额：<INPUT TYPE="text" NAME="money" value="${param.money}" readonly="readonly">元
		<div>
			<input type="radio" name="pay" checked />
				<img style="width:250px;height:300px" src="${pageContext.request.contextPath }/client/images/alipay.jpg">
			<input type="radio" name="pay" />
				<img style="width:250px;height:300px" src="${pageContext.request.contextPath }/client/images/wxpay.jpg">
		</div>
		<div style="margin: 40px;">
			<input type="submit" style="border: none; height:40px; width:100px; background-color:#ff3e3e; font-size:18px ;margin-top: 3%;font-family: 仿宋;color: whitesmoke" value="支付">
		</div>
	</form>
</div>
<!-- 1.商城底部 start -->
       <%@include file="foot.jsp"%>
<!-- 商城底部  end -->
</body>
</html>
