package cn.kfu.soft.market.util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import cn.kfu.soft.market.entity.UserBean;

public class Privilege extends SimpleTagSupport {
	@Override
	public void doTag() throws JspException, IOException {
		PageContext context = (PageContext) this.getJspContext();
		HttpServletRequest request = (HttpServletRequest) context.getRequest();
		HttpServletResponse response = (HttpServletResponse) context.getResponse();
		
		UserBean user = (UserBean) context.getSession().getAttribute("user");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/client/privilege.jsp");
		}
	}
}

