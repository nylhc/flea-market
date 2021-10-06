<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/login.css" type="text/css" />
</head>
<body class="main">
	<div class="back">
		<div class="backstyle">
			<form action="${pageContext.request.contextPath}/servlet/LoginServlet" method="post" onsubmit="return checkForm()">
				<table width="800" height="600" border="0" align="center">
					<tr>
				    	<td>
				    		<table border="0" cellpadding="0" cellspacing="0" id="op">
					    			<tr>
			                        	<th width="800" height="80" colspan="3">
			                            	<img src="" />
			                        	</th>		    			
					    			</tr>
					    			<tr>
					    				<th width="800" height="138" colspan="3">
					    					<img  src="${pageContext.request.contextPath}/client/images/login3.jpg" />
					    				</th>
					    			</tr>
					    			<tr>
					    				<td width="165" height="187">
					    					<img  src="${pageContext.request.contextPath}/client/images/login5.jpg" />
					    				</td>
					    				<td>
					    					<div align="center"></div>
					    					<table width="481" height="187" border="0" cellpadding="0" cellspacing="0" class="fontstyle">
					    						<tr height="84">
					    							<td width="130" align="center">
					    								用户名：
					    							</td>
					    							<td width="180">
					    								<input type="text" name="username" tabindex="1"></input>
					    							</td>
					    							<th width="171" rowspan="3">
					    								<input type="image" onclick="return formcheck()" src="${pageContext.request.contextPath}/client/images/login.gif" tabindex="5" />
					    								<div style="color:red;align:center;">${loginmess} </div>
					    							</th>
					    						</tr>
					    						<tr height="43">
					    							<td width="130" align="center">
				                                    	密&nbsp;&nbsp;码：
				                                    </td>
				                                    <td width="180">
				                                    	<input type="password" name="password" tabindex="2"></input>
				                                    </td>
					    						</tr>
					    						<tr height="60">
					    							<td align="center">
					    								您还没有账号？
					    							</td>
					    							<td>
					    								<a href="${pageContext.request.contextPath }/client/register.jsp">去注册</a>
					    							</td>
					    						</tr>
					    					</table>
					    				</td>
					    				<td width="154" height="187">
											<img src="${pageContext.request.contextPath}/client/images/login6.jpg" />
										</td>
					    			</tr>
					    			<tr>
					    				<th width="800" height="106" colspan="3" align="right" background="${pageContext.request.contextPath }/client/images/login4.jpg">
					    					<marquee style="FILTER:blur(direction=135,strength=8)" behavior="alternate">
					    						<font size="+1" face="华文行体" color="#0e87d1"><i>欢迎进入开封大学二手交易平台</i></font>
					    					</marquee>
					    				</th>
					    			</tr>
					    			<tr>
										<th width="800" height="79" colspan="3">
											<img src="${pageContext.request.contextPath}/client/images/login2.jpg" />
										</th>
									</tr>
				    		</table>
				    	</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>