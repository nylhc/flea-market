<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="http://kfu.soft.net"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>成功</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/main.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
		var interval;
		window.onload = function() {
			interval = window.setInterval("changeSecond()", 1000);
		};
		function changeSecond() {
			var second = document.getElementById("second");
			var svalue = second.innerHTML;
			svalue = svalue - 1;
			if (svalue == 0) {
				window.clearInterval(interval);
				// 下列两行代码用于获取项目名，例如：bookstore
				var pathName = window.location.pathname.substring(1);   
				var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
				// 拼接访问路径名，例如：http://localhost:8080/bookstore/index.jsp
				location.href = window.location.protocol + '//' + window.location.host + '/'+ webName + '/index.jsp'; 
				return;
			}
			second.innerHTML = svalue;
		}
</script>
</head>
<body class="main">
	<p:user/>
	<jsp:include page="head.jsp" />
	<jsp:include page="querymarket.jsp" />
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center">
				    <table width="60%" border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98">
								<img src="${pageContext.request.contextPath}/client/images/ordersuccess.webp" width="128" height="128" />
							</td>
							<td style="padding-top:30px">
								<font style="font-weight:bold; color:#FF0000">亲，订单生成成功，请到我的订单中支付！</font><br /> <br />
								<a href="${pageContext.request.contextPath }/index.jsp">
									<span id="second" style="color: red;font-size: 18px">5</span>秒后自动为您转跳回首页</a>
							</td>
						</tr>
					</table>
				  <h1>&nbsp;</h1>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>