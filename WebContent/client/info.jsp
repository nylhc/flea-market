<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>二手商城</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
	<style type="text/css">
		#divpagecontent {
			width: 900px;
			margin-top: 10px;
			MARGIN-RIGHT: auto;
			MARGIN-LEFT: auto;
		}
	</style>
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="querymarket.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
				    <div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/showProductByPage?category=${p.category}">&nbsp;${p.category}</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${p.name}
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%%" border="0" cellspacing="0">
									<tr>
										<td width="30%">
											<div class="divbookcover">
												<p>
													<img src="${pageContext.request.contextPath}${p.imgurl}" width="213" height="269" border="0" />
												</p>
											</div>
											<div style="text-align:center; margin-top:10px">
												<a href="${pageContext.request.contextPath}/addCart?id=${p.id}">
													<img src="${pageContext.request.contextPath }/client/images/buybutton.png" border="0" width="100" height="25" /> 
												</a>
												<a href="${pageContext.request.contextPath}/leave?id=${p.id}">
													<input type="submit" style="border: 0; height:25; width:100; background-color:#ffffff; font-size:18px ;font-family: 仿宋;color: #ff3e3e" value="查看评价">
												</a>
											</div>
										</td>
										<td style="padding:20px 5px 5px 5px">
											<font class="bookname">&nbsp;${p.name}</font>
											<hr />售价:<font color="#FF0000">￥${p.price}</font>
											<hr /> 类别:${p.category }
											<hr />库存:${p.pnum}<hr />
											<p>
												<b>内容简介：</b>
											</p> ${p.description}
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>