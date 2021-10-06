<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>商城列表</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
</head>

<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="querymarket.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;全部商品&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;商品列表
					</div>
					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>商品目录</h1>
								<hr color="red" />
								<h1>全部商品</h1>&nbsp;&nbsp;&nbsp;&nbsp;共${bean.totalCount}种商品
							

								<table cellspacing="0" class="booklist">
									<tr>
										<c:forEach items="${bean.ps}" var="p" varStatus="vs">
											<td>
												<div class="divbookpic">
													<p>
														<a href="${pageContext.request.contextPath}/findProductById?id=${p.id}"><img
															src="${pageContext.request.contextPath}${p.imgurl}"
															width="132" height="145" border="0" /> </a>
													</p>
												</div>
												<div class="divlisttitle">
													<a href="${pageContext.request.contextPath}/findProductById?id=${p.id}">商品: ${p.name}<br />售价:￥${p.price} </a>
												</div>
											</td>
										</c:forEach>
									</tr>
								</table>
								
								<div class="pagination">
									<ul>
										<c:if test="${bean.currentPage!=1}">
											<li class="disablepage_p">
												<a href="${pageContext.request.contextPath}/MenuSearchServlet?currentPage=${bean.currentPage-1}&textfield=${bean.searchfield}">上一页</a>
											</li>
										</c:if>
										
										
										<c:forEach begin="1" end="${bean.totalPage}" var="pageNum">
											<c:if test="${pageNum!=bean.currentPage}">
												<li><a href="${pageContext.request.contextPath}/MenuSearchServlet?currentPage=${bean.currentPage+1}&textfield=${bean.searchfield}">下一页</a>
												</li>
											</c:if>
										</c:forEach>

										
									</ul>
								</div>
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
