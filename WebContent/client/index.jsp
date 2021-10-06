<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开大二手商城</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/images/bitbug_favicon.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/index.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/slide.js"></script>
</head>
<body>
<div  style="top: 0;position: fixed;width:100%; background-color: #ffffff;z-index: 2">
<!-- 1.商城顶部 start -->
       <%@include file="head.jsp"%>
<!-- 商城顶部  end -->
<!--2. 商城搜索  start -->
       <%@include file="querymarket.jsp" %>
<!-- 商城搜索  end -->

</div>
<div style="margin-top: 150px">
<!-- 3.商城公告 start -->
	   <%@include file="notic.jsp" %>
<!-- 3.商城公告 end -->
<form>
	<div class="navbar_con">
	    <div class="navbar">
	        <h1 class="fl">热销商品</h1>
	        <ul class="navlist fl">
	            <li><a href="${pageContext.request.contextPath}/showProductByPage">全部商品</a>&nbsp;&nbsp;&nbsp;|</li>
	            <li>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/client/addProduct.jsp">上传商品</a>&nbsp;&nbsp;&nbsp;|</li>
	        </ul>
	    </div>
	</div>
	 <div class="center_con clearfix">
		    <ul class="subnav fl">
		        <li><a href="#model01" class="fruit">图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;书</a></li>
		        <li><a href="#model02" class="seafood">生活用品</a></li>
		        <li><a href="#model03" class="meet">电子产品</a></li>
		        <li><a href="#model04" class="egg">自&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;营</a></li>
		    </ul>
		    <div class="slide fl" >
		        <ul class="slide_pics">
		            <li><a href="${pageContext.request.contextPath}/findProductById?id=1">
		            		<img src="${pageContext.request.contextPath}/client/images/1.jpg" alt="幻灯片">
		            	</a>
		            </li>
		            <li><a href="${pageContext.request.contextPath}/showProductByPage?category=化妆品">
			           		<img src="${pageContext.request.contextPath}/client/images/2.jpg" alt="幻灯片">
			           	</a>
		            </li>
		            <li><a href="${pageContext.request.contextPath}/client/addProduct.jsp">
		            		<img src="${pageContext.request.contextPath}/client/images/3.jpg" alt="幻灯片">
		            	</a>
		            </li>
		            <li><a href="${pageContext.request.contextPath}/showProductByPage?category=自营">
		           			<img src="${pageContext.request.contextPath}/client/images/4.jpg" alt="幻灯片">
		           		</a>
		            </li>
		        </ul>
		        <div class="prev"></div>
		        <div class="next"></div>
		        <ul class="points"></ul>
		    </div>
		    <div class="adv fl">
		        <a href="#"><img src="${pageContext.request.contextPath}/client/images/adv1.jpg"></a>
		        <a href="#"><img src="${pageContext.request.contextPath}/client/images/adv2.jpg"></a>
		    </div>
	  </div> 
	  
	  <div class="list_model">
	  		<div class="list_title clearfix">
	            <h3 class="fl" id="model04">自营</h3>
	            <div class="subtitle fl">
	                <span>|</span>
	                <a href="${pageContext.request.contextPath}/showProductByPage?category=自营">全部</a>
	            </div>
   			 </div>
   			 <div class="goods_con clearfix">
			        <div class="goods_banner fl">
				        <a href="${pageContext.request.contextPath}/showProductByPage?category=自营">
				        	<img src="${pageContext.request.contextPath}/client/images/zy.jpg">
				        </a>
			        </div>
					 <ul class="goods_list fl">
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=1"><img src="${pageContext.request.contextPath}/img/zy/wanou.jpg"></a>
			                <br/><h4 >玩偶</h4>
			            </li>
			           	<li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=14"><img src="${pageContext.request.contextPath}/img/zy/14.jpg"></a>
			                <br/><h4 >笔记本</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=16"><img src="${pageContext.request.contextPath}/img/zy/16.jpg"></a>
			                <br/><h4 >晨光笔芯(一盒20支)</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=17"><img src="${pageContext.request.contextPath}/img/zy/17.jpg"></a>
			                <br/><h4 >床头置物架</h4>
			            </li>
			        </ul>
			  </div>
	  </div>
	  
	  <div class="list_model">
			    <div class="list_title clearfix">
			        <h3 class="fl" >化妆品</h3>
			        <div class="subtitle fl">
			            <span>|</span>
			            <a href="${pageContext.request.contextPath}/showProductByPage?category=化妆品">全部</a>
			        </div>
			    </div>
		    	<div class="goods_con clearfix">
			        <div class="goods_banner fl">
				        <a href="${pageContext.request.contextPath}/showProductByPage?category=化妆品">
				        	<img src="${pageContext.request.contextPath }/client/images/hzp.jpg">
				        </a>
			        </div>
			        <ul class="goods_list fl">
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=18"><img src="${pageContext.request.contextPath}/img/h/18.jpg"></a>
			                <br/><h4 >水乳洁面护肤套装</h4>
			            </li>
			           	<li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=19"><img src="${pageContext.request.contextPath}/img/h/19.jpg"></a>
			                <br/><h4 >口红</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=20"><img src="${pageContext.request.contextPath}/img/h/20.jpg"></a>
			                <br/><h4 >欧莱雅面膜</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=21"><img src="${pageContext.request.contextPath}/img/h/21.jpg"></a>
			                <br/><h4 >16色眼影盘</h4>
			            </li>
			        </ul>
			    </div>
		</div>
	  
	  <div class="list_model">
			    <div class="list_title clearfix">
			        <h3 class="fl" id="model02">生活用品</h3>
			        <div class="subtitle fl">
			            <span>|</span>
			            <a href="#">风扇</a>
			            <a href="#">书柜</a>
			            <a href="${pageContext.request.contextPath}/showProductByPage?category=生活用品">全部</a>
			        </div>
			    </div>
			    <div class="goods_con clearfix">
			        <div class="goods_banner fl">
				        <a href="${pageContext.request.contextPath}/showProductByPage?category=生活用品">
				        	<img src="${pageContext.request.contextPath}/client/images/shyp.jpg">
				        </a>
			        </div>
			        <ul class="goods_list fl">
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=7"><img src="${pageContext.request.contextPath}/img/shenghuo/taideng.jpg"></a>
			                <br/><h4 >台灯</h4>
			            </li>
			           	<li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=11"><img src="${pageContext.request.contextPath}/img/shenghuo/11.jpg"></a>
			                <br/><h4 >风扇</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=13"><img src="${pageContext.request.contextPath}/img/shenghuo/13.jpg"></a>
			                <br/><h4 >日用品套装</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=15"><img src="${pageContext.request.contextPath}/img/shenghuo/15.jpg"></a>
			                <br/><h4 >书桌</h4>
			            </li>
			        </ul>
			    </div>
		</div>
		
		<div class="list_model">
		        <div class="list_title clearfix">
		            <h3 class="fl" id="model01">图书</h3>
		            <div class="subtitle fl">
		                <span>|</span>
		                <a href="#">专业课书籍</a>
		                <a href="#">课外书籍</a>
		                <a href="${pageContext.request.contextPath}/showProductByPage?category=图书">全部</a>
		            </div>
		   		 </div>	
		        <div class="goods_con clearfix">
		            <div class="goods_banner fl">
			            <a href="${pageContext.request.contextPath}/showProductByPage?category=图书">
			            	<img src="${pageContext.request.contextPath}/client/images/tushu.jpg">
			            </a>
		            </div>
		            <ul class="goods_list fl">
		                <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=3"><img src="${pageContext.request.contextPath}/img/book/javaweb.png"></a>
			                <br/><h4 >JavaWeb</h4>
			            </li>
			           	<li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=4"><img src="${pageContext.request.contextPath}/img/book/python.jpg"></a>
			                <br/><h4 >Python</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=6"><img src="${pageContext.request.contextPath}/img/book/mysql.jpg"></a>
			                <br/><h4 >Mysql</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=5"><img src="${pageContext.request.contextPath}/img/book/c++.jpg"></a>
			                <br/><h4 >C++</h4>
			            </li>
		            </ul>
		        </div>
		</div>
		
		<div class="list_model">
			    <div class="list_title clearfix">
			        <h3 class="fl" id="model03">电子产品</h3>
			        <div class="subtitle fl">
			            <span>|</span>
			            <a href="">耳机</a>
			            <a href="">键盘</a>
			            <a href="">手机</a>
			            <a href="${pageContext.request.contextPath}/showProductByPage?category=电子产品">全部</a>
			        </div>
			    </div>
		    	<div class="goods_con clearfix">
			        <div class="goods_banner fl">
				        <a href="${pageContext.request.contextPath}/showProductByPage?category=电子产品">
				       		<img src="${pageContext.request.contextPath }/client/images/dzcp.jpg">
				        </a>
			        </div>
			        <ul class="goods_list fl">
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=8"><img src="${pageContext.request.contextPath}/img/dianzi/erji.jpg"></a>
			                <br/><h4 >耳机</h4>
			            </li>
			           	<li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=9"><img src="${pageContext.request.contextPath}/img/dianzi/jianpan9.png"></a>
			                <br/><h4 >键盘</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=10"><img src="${pageContext.request.contextPath}/img/dianzi/shubiao10.jpg"></a>
			                <br/><h4 >鼠标</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=12"><img src="${pageContext.request.contextPath}/img/dianzi/12.jpg"></a>
			                <br/><h4 >充电宝</h4>
			            </li>
			        </ul>
			    </div>
		</div>
		
		<div class="list_model">
			    <div class="list_title clearfix">
			        <h3 class="fl" >其他</h3>
			        <div class="subtitle fl">
			            <span>|</span>
			            <a href="${pageContext.request.contextPath}/showProductByPage?category=其他">全部</a>
			        </div>
			    </div>
		    	<div class="goods_con clearfix">
			        <div class="goods_banner fl">
				        <a href="${pageContext.request.contextPath}/showProductByPage?category=其他">
				        	<img src="${pageContext.request.contextPath }/client/images/other.jpg">
				        </a>
			        </div>
			        <ul class="goods_list fl">
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=22"><img src="${pageContext.request.contextPath}/img/other/22.jpg"></a>
			                <br/><h4 >车模（法拉利）</h4>
			            </li>
			           	<li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=23"><img src="${pageContext.request.contextPath}/img/other/23.jpg"></a>
			                <br/><h4 >车模（兰博基尼）</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=10"><img src="${pageContext.request.contextPath}/img/dianzi/shubiao10.jpg"></a>
			                <br/><h4 >鼠标</h4>
			            </li>
			            <li >
			                <a href="${pageContext.request.contextPath }/findProductById?id=12"><img src="${pageContext.request.contextPath}/img/dianzi/12.jpg"></a>
			                <br/><h4 >充电宝</h4>
			            </li>
			        </ul>
			    </div>
		</div>
</form>
</div>
<!-- 4.商城底部 start -->
       <%@include file="foot.jsp"%>
<!-- 4.商城底部  end -->
</body>
</html>