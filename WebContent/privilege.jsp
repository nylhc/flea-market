<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>开大二手商城</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
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

<body >
	<div style="position: center">
		<img src="${pageContext.request.contextPath}/client/images/error.png" width="500" height="350" />
	</div>
	<div style="padding-top:30px">
		<a href="${pageContext.request.contextPath}/index.jsp">
				<span id="second" style="color:red;font-size:18">5</span>秒后自动为您跳转回首页(您可以点击直接跳转)
		</a>
	</div>	
</body>
</html>
