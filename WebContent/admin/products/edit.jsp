<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/admin/css/Style.css" type="text/css" rel="stylesheet">
	<script language="javascript" src="${pageContext.request.contextPath}/admin/js/check.js"></script>
	<script type="text/javascript">
		//设置类别的默认值
		function setProductCategory(t) {
			var category = document.getElementById("category");
	
			var ops = category.options;
			for ( var i = 0; i < ops.length; i++) {
	
				if (ops[i].value == t) {
					ops[i].selected = true;
					return;
				}
			}
	
		};
		function openWindow(sHref,strWidth,strHeight) {
			  var strLeft=(screen.availWidth-strWidth)/2;
			  var strTop=(screen.availHeight-strHeight)/2;
			  var strRef="";
			  strRef=strRef+"width="+strWidth+"px,height="+strHeight+"px,";
			  strRef=strRef+"left="+strLeft+"px,top="+strTop+"px,";
			  strRef=strRef+"resizable=yes,scrollbars=yes,status=yes,toolbar=no,systemmenu=no,location=no,borderSize=thin";//channelmode,fullscreen
			  var openerobj= window.open(sHref,'newwin',strRef,false);
			  openerobj.focus();
			}
	</script>
</HEAD>
<body onload="setProductCategory('${p.category}')">
	<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/editProduct" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${p.id}" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#ffffff" colSpan="4" height="26">
					<strong style="color:#ff3e3e">编辑商品</strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#ffffff" class="ta_01">商品名称：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="name" class="bg" value="${p.name }" />
				</td>
				<td align="center" bgColor="#ffffff" class="ta_01">商品价格：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="price" class="bg" value="${p.price }" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#ffffff" class="ta_01">商品数量：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="pnum" class="bg" value="${p.pnum}" />
				</td>
				<td align="center" bgColor="#ffffff" class="ta_01">商品类别：</td>
				<td class="ta_01" bgColor="#ffffff">
					<select name="category" id="category">
						<option value="">--选择商品类别--</option>
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
				<td class="ta_01" bgColor="#ffffff" colSpan="3">
				<input type="file" name="upload" size="30" value="" /></td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#ffffff">商品描述：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
					<textarea name="description" cols="30" rows="3" style="WIDTH: 96%">${p.description}</textarea>
				</TD>
			</TR>
			<TR>
				<td align="center" colSpan="4" class="sep1">
					<img src="${pageContext.request.contextPath}/admin/images/editb.gif">
				</td>
			</TR>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#ffffff" colSpan="4">
					<input type="submit" class="button_ok" value="确定"> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" class="button_cancel" /> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"> </span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>