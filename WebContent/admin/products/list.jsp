<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	    //添加商品
		function addProduct() {
			window.location.href = "${pageContext.request.contextPath}/admin/products/add.jsp";
		}
		//删除商品
		function p_del() {   
			var msg = "您确定要删除该商品吗？";   
			if (confirm(msg)==true){   
			return true;   
			}else{   
			return false;   
			}   
		}   
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
<body>
	<br />
	<form id="Form1" name="Form1"action="${pageContext.request.contextPath}/findProductByCondition" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#ffffff">
						<strong style="color:#ff3e3e">查 询 条 件</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#ffffff" class="ta_01">商品编号：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#ffffff" class="ta_01">类别：</td>
								<td class="ta_01" bgColor="#ffffff">
								<select name="category" id="category">
										<option value="" selected="selected">--选择商品类别--</option>
										<option value="自营">自营</option>
										<option value="图书">图书</option>
										<option value="生活用品">生活用品机</option>
										<option value="电子产品">电子产品</option>
										<option value="化妆品">化妆品</option>
										<option value="其他">其他</option>
								</select>
								</td>
							</tr>
							<tr>
								<td height="22" align="center" bgColor="#ffffff" class="ta_01">商品名称：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="name" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#ffffff" class="ta_01">价格区间(元)：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="minprice" size="10" value="" />
									- 
									<input type="text" name="maxprice" size="10" value="" />
								</td>
							</tr>
							<tr>
								<td width="100" height="22" align="center" bgColor="#ffffff" class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff">
									<font face="宋体" color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<br /><br />
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search" value="&#26597;&#35810;" class="button_view">
										&#26597;&#35810;
									</button> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" name="reset" value="&#37325;&#32622;" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#ffffff"><strong style="color:#ff3e3e">商 品 列 表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right" bgColor="#ffffff">
						<button type="button" id="add" name="add" value="&#28155;&#21152;" class="button_add" onclick="addProduct()">
							&#28155;&#21152;
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#ffffff">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #ffffff; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #ffffff">
								<td align="center" width="24%">商品ID</td>
								<td align="center" width="18%">商品名称</td>
								<td align="center" width="9%">商品价格</td>
								<td align="center" width="9%">商品数量</td>
								<td align="center" width="8%">商品类别</td>
								<td align="center" width="8%">编辑</td>
								<td align="center" width="8%">删除</td>
							</tr>
                            <!--  循环输出所有商品 -->
							<c:forEach items="${ps}" var="p">
								<tr onmouseover="this.style.backgroundColor = '#ff3e3e'"
									onmouseout="this.style.backgroundColor = '#ffffff';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="200">${p.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="18%">${p.name }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.price }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.pnum }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${p.category}</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
									    <a href="${pageContext.request.contextPath}/findProductById?id=${p.id}&type=admin">
											<img src="${pageContext.request.contextPath}/admin/images/edit.gif" border="0" style="CURSOR: hand"> 
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
										<a href="${pageContext.request.contextPath}/deleteProduct?id=${p.id}" onclick="javascript:return p_del()">
												<img src="${pageContext.request.contextPath}/admin/images/del.gif"
												width="16" height="16" border="0" style="CURSOR: hand">
										</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>