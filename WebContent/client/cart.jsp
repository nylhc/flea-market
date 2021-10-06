<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="p" uri="http://kfu.soft.net"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/cart.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/slide.js"></script>
<script>
    //当商品数量发生变化时触发该方法
	function changeProductNum(count, totalCount, id) {
		count = parseInt(count);
		totalCount = parseInt(totalCount);
		//如果数量为0，判断是否要删除商品
		if (count == 0) {
			var flag = window.confirm("确认删除商品吗?");

			if (!flag) {
				count = 1;
			}
		}
		if (count > totalCount) {
			alert("已达到商品最大购买量");
			count = totalCount;
		}
		location.href = "${pageContext.request.contextPath}/changeCart?id="
				+ id + "&count=" + count;
	}
	//删除购物车中的商品
	function cart_del() {   
	    var msg = "您确定要删除该商品吗？";   
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	}   
</script>
<title>购物车</title>
</head>
<body>

<jsp:include page="head.jsp" />
<jsp:include page="querymarket.jsp" />
<div class="box">
	<p:user/>
 	<h1>购物车</h1>
	<div style="text-align:right; margin:5px 10px 5px 0px">
		<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
	</div>
    <div class="table-wrapper">    
        <table class="fl-table">
            <thead>
            <tr>
                <th class="tdone" style="width: 316px">序号</th>
                <th class="tdtwo">商品名称</th>
                <th class="tdthree">数量</th>
                <th class="tdfour">单价</th>
                <th class="tdfive">小计</th>
                <th class="tdsix">操作</th>
            </tr>
            </thead>
            <tbody>      
            <!-- 循环输出商品信息 -->
			<c:set var="total" value="0" />
			<c:set var="categorycount" value="0" />
			<c:set var="count1" value="0" /> 
			<c:forEach items="${cart}" var="entry" varStatus="vs">
					<tr class="trclass">
		                <td class="tdone"style="width: 316px">${vs.count}</td>
		                <td class="tdtwo " id="name">${entry.key.name }</td>
		                <td class="tdthree">
		                    <span class="jiajie">
			                     <!-- 减少商品数量 -->
								<input type="button" value='-' style="width:20px" onclick="changeProductNum('${entry.value-1}','${entry.key.pnum}','${entry.key.id}')">
								 <!-- 商品数量显示 -->
								<input name="text" type="text" value="${entry.value}" style="width:40px;text-align:center" readonly="readonly" />
								<!-- 增加商品数量 -->
								<input type="button" value='+' style="width:20px" onclick="changeProductNum('${entry.value+1}','${entry.key.pnum}','${entry.key.id}')">
		                    </span>库存:${entry.key.pnum}
		                </td>
		                <td class="tdfour"><span class="unit">${entry.key.price }</span></td>
		                <td class="tdfive"><span class="subtal">${entry.key.price*entry.value}</span></td>
		                <td class="tdsix">
		                     <a href="${pageContext.request.contextPath}/changeCart?id=${entry.key.id}&count=0" onclick="javascript:return cart_del()">删&nbsp;除</a>
		                </td>
	            	</tr>
			<c:set value="${total+entry.key.price*entry.value}" var="total" />
			<c:set value="${categorycount+1}" var="categorycount" />
			<c:set value="${count1+entry.value }" var="count1" />
			</c:forEach>
            
            <tr class="tr3" style="color: #4e4e4e">
            	<td colspan="6" class="talast">商品类型<span style="color:#ff3e3e;font-size: 18px">${categorycount}</span>种，共<span style="color:#ff3e3e;font-size: 18px">${count1 }</span>件
                <p> 共计花费<span class="pricetal" style="color:#ff3e3e;font-size: 18px">${total}</span> 元</p>
            </tr>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/client/order.jsp">
       		<input type="submit" style="border: none; height:40px; width:100px; background-color:#ff3e3e; font-size:18px ;margin-top: 3%;font-family: 仿宋;color: whitesmoke" value="确定购买">
        </a>   
    </div>
</div>
<jsp:include page="foot.jsp" />
</body>
</html>