<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>flea-market</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css">
	<style type="text/css">	
		
		.center {
			position: absolute;
			top:50%;
			left:50%;
			-webkit-transform:translate(-50%,-50%);
		}
		
		.footer {
			position: absolute;
			width:100%;
			height:100px;
			bottom:0px;
			left:0px;
		}
	</style>
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

<body>
	<jsp:include page="head.jsp" />
	<div>
		<td >
			<font style="font-weight:bold;font-size:18; color:#FF0000">注册成功! 欢迎加入开封大学二手购物平台!</font>
			<br />
			<a href="${pageContext.request.contextPath}/index.jsp">
				<span id="second" style="color:red;font-size:18">5</span>秒后自动为您跳转回首页(您可以点击直接跳转)
			</a>
		</td>
	</div>
	<div class="center">
		<a href="http://www.kfu.edu.cn/">
			<img src="${pageContext.request.contextPath}/client/images/login.jpg">
		</a><br />	
	</div>
	
	<div class="footer">
		<jsp:include page="foot.jsp"/>
	</div>
	
</body>
</html>
