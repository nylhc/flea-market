<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://kfu.soft.net"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>订单列表</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/order.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/slide.js"></script>
<script type="text/javascript">
	//删除订单
	function o_del() {   
	    var msg = "您确定要删除该订单吗？";   
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	} 
</script>
</head>
<body>
<jsp:include page="head.jsp" />
<jsp:include page="querymarket.jsp" />
<div class="box">
	<p:user/>
    <h2>我的订单</h2>
    <div style="text-align:right; margin:5px 10px 5px 0px">
		<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
		订单查询
	</div>
    <div class="table-wrapper">
        <table class="fl-table">
            <tr>
                <td>订单号</td>
                <td>收件人</td>
                <td>购买时间</td>
                <td>状态</td>
                <td>操作</td>
            </tr>
           	<c:forEach items="${orders}" var="order">
				<tr>
					<td class="tableopentd02">${order.id}</td>
					<td class="tableopentd02">${order.receiverName }</td>
					<td class="tableopentd02">${order.ordertime}</td>
					<td class="tableopentd02">${order.paystate==0?"未支付":"已支付"}</td>
					<td class="tableopentd03">
						<a href="${pageContext.request.contextPath}/findOrderById?id=${order.id}">查看</a>&nbsp;&nbsp;
						<c:if test="${order.paystate==0 }">
							<a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}"  onclick="javascript:return o_del()">刪除</a>
						</c:if> 
						<c:if test="${order.paystate!=0 }">
							<a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}&type=client" onclick="javascript:return o_del()">刪除</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
        </table>
    </div>
</div>

<jsp:include page="foot.jsp" />
</body>
</html>