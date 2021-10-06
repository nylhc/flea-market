<%@page import="cn.kfu.soft.market.entity.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
//退出确认框
function confirm_logout() {   
    var msg = "您确定要退出登录吗？";   
    if (confirm(msg)==true){   
    return true;   
    }else{   
    return false;   
    }   
} 
</script>
<div class="header_con">
    <div class="header">
        <div class="welcome fl" style="color:red">欢迎来到开封大学二手购物平台</div>
        <div class="fr">
            <div class="login_btn fl">
                <a href="${pageContext.request.contextPath }/index.jsp">
                   	 欢迎您：<em style="color:red"> ${user.username}</em>
                </a>
                <span>|</span>
                <a href="${pageContext.request.contextPath}/client/cart.jsp">我的购物车</a>
                <span>|</span>
                <!-- <a href="${pageContext.request.contextPath}/myAccount">请您登陆</a>-->
                 <% 
				UserBean users = (UserBean) request.getSession().getAttribute("user");
				if(null == users){
				%>
				 <a href="${pageContext.request.contextPath}/myAccount">请您登陆</a>						
				<%
				}else{
				%>
				 <a href="${pageContext.request.contextPath}/findOrderByUser">我的订单</a>
				<% 	
				}
				%>	
                <span></span>
                <% 
				UserBean user = (UserBean) request.getSession().getAttribute("user");
				if(null == user){
				%>
				| <a href="${pageContext.request.contextPath }/client/register.jsp"> 新用户注册 </a>						
				<%
				}else{
				%>
				| <a href="${pageContext.request.contextPath}/logout" onclick="javascript:return confirm_logout()">用户退出</a>
				<% 	
				}
				%>		
            </div>
            <div class="login_btn fl">
	            <span>|</span>
	            <a href="http://www.kfu.edu.cn/" style="color:red" target="_blank">
	               	开大官网
	            </a>
       		</div>
       	</div>
    </div>
</div>