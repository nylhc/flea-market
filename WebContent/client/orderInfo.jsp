<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://kfu.soft.net"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
</head>
<body class="main">
	<p:user/>
	<jsp:include page="head.jsp" />
	<jsp:include page="querymarket.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath }/findOrderByUser">订单查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;订单详情
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<p>订单编号:${order.id}</p>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">序号</td>
													<td width="40%">商品名称</td>
													<td width="10%">价格</td>
													<td width="10%">数量</td>
													<td width="10%">小计</td>
												</tr>
											</table> 
											<c:forEach items="${order.orderItems}" var="item" varStatus="vs">
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td width="10%">${vs.count }</td>
														<td width="40%">${item.p.name}</td>
														<td width="10%">${item.p.price }</td>
														<td width="10%">${item.buynum }</td>
														<td width="10%">${item.buynum*item.p.price }</td>
													</tr>
												</table>
											</c:forEach>
											<table cellspacing="1" width="100%" >
												<tr>
													<td style="text-align:right; padding-right:40px;">
														<font style="color:#FF0000; font-size: 24px">合计：&nbsp;&nbsp;${order.money}</font>
													</td>
												</tr>
											</table>
											<p>
												收货地址：${order.receiverAddress }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												收货人：&nbsp;&nbsp;&nbsp;&nbsp;${order.receiverName }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												联系方式：${order.receiverPhone }&nbsp;&nbsp;&nbsp;&nbsp;
											</p>
											<hr>
											<c:if test="${order.paystate != 1 }">
											<p style="text-align:right">
												<a href="${pageContext.request.contextPath}/client/pay.jsp?id=${order.id}&money=${order.money}"> 
													<input type="submit" style="border: none; height:51px; width:204px; background-color:#ff3e3e; font-size:18px ;margin-top: 3%;font-family: 仿宋;color: whitesmoke" value="去支付">	
												</a>
											</p>
											</c:if>
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
