<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
/**
 * my_click和my_blur均是用于前台页面搜索框的函数
 */
//鼠标点击搜索框时执行
function my_click(obj, myid){
	//点击时，如果取得的值和搜索框默认value值相同，则将搜索框清空
	if (document.getElementById(myid).value == document.getElementById(myid).defaultValue){
	  document.getElementById(myid).value = '';
	  obj.style.color='#000';
	}
}
//鼠标不聚焦在搜索框时执行
function my_blur(obj, myid){
	//鼠标失焦时，如果搜索框没有输入值，则用搜索框的默认value值填充
	if (document.getElementById(myid).value == ''){
	 document.getElementById(myid).value = document.getElementById(myid).defaultValue;
	 obj.style.color='#999';
 }
}

/**
 * 点击搜索按钮执行的函数
 */
function search(){
	document.getElementById("searchform").submit();
}
</script>

<div class="search_bar clearfix">
	<div>
    	<a href="${pageContext.request.contextPath }/index.jsp" class="logo fl">
    		<img src="${pageContext.request.contextPath }/client/images/logo.jpg">
    	</a>
    </div>
    <div class="search_con fl">
        <form action="${pageContext.request.contextPath }/MenuSearchServlet" id="searchform">
            <input type="text" class="input_text fl" name="textfield" id="textfield" value="搜索商品" placeholder="搜索商品" 
            onmouseover="this.focus();"
            onclick="my_click(this,'textfield');"
            onBlur="my_blur(this,'textfield');"/>
            <input type="submit" class="input_btn fr" name="" value="搜索" onclick="search()">
        </form>
    </div>
</div>
