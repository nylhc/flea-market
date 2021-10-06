<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="http://kfu.soft.net"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>AddProduct</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css">
</head>
<body>
	<p:user/>
	<jsp:include page="head.jsp" />
	<jsp:include page="querymarket.jsp" />
<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/clientaddProduct" method="post"
		enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #ff3e3e" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#ffffff" colSpan="4"
					height="26"><strong><STRONG>添加商品</STRONG> </strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#ffffff" class="ta_01">商品名称：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" name="name" class="bg" /></td>
				<td align="center" bgColor="#ffffff" class="ta_01">商品价格：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="price" class="bg" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#ffffff" class="ta_01">商品数量：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="pnum" class="bg" />
				</td>
				<td align="center" bgColor="#ffffff" class="ta_01">商品类别：</td>
				<td class="ta_01" bgColor="#ffffff">
					<select name="category" id="category">
						<option value="" selected="selected">--选择商品类别--</option>
						<option value="自营">自营</option>
						<option value="图书">图书</option>
						<option value="生活用品">生活用品</option>
						<option value="电子产品">电子产品</option>
						<option value="化妆品">化妆品</option>
						<option value="其他">其他</option>
				</select>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#ffffff" class="ta_01">商品图片：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3">
				<input type="file" name="upload" size="30" value="" />
				</td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#ffffff">商品描述：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
					<textarea name="description" cols="30" rows="3" style="WIDTH: 96%"></textarea>
				</TD>
			</TR>
			<TR>
				<td align="center" colSpan="4" class="sep1"><img
					src="${pageContext.request.contextPath}/client/images/editb.gif">
				</td>
			</TR>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#ffffff" colSpan="4">
					<input type="submit" class="button_ok" value="确定">	
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" class="button_cancel">					
					<FONT face="宋体">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>
<!-- 1.商城底部 start -->
       <%@include file="foot.jsp"%>
<!-- 商城底部  end -->
</body>
</html>