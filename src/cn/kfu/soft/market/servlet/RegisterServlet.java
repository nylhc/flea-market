package cn.kfu.soft.market.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cn.kfu.soft.market.entity.UserBean;
import cn.kfu.soft.market.service.UserService;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String telephone = request.getParameter("telephone");
		String checkCode = request.getParameter("check_code");
		String savedCode = (String) request.getSession().getAttribute("check_code");
		PrintWriter pw = response.getWriter();
		
		UserBean user = new UserBean();
		user.setUsername(username);
		user.setPassword(password);
		user.setGender(gender);
		user.setEmail(email);
		user.setTelephone(telephone);
		
		UserService service = new UserService();
		
		if (checkCode==null || savedCode==null|| !checkCode.equals(savedCode)) {
			request.setAttribute("msg", "<font color='red'>验证码错误</font>");
			request.getRequestDispatcher("/client/register.jsp").forward(request, response);
			return;
		}
				

		try {
			if (service.userExist(user.getUsername())) {
				request.setAttribute("checkuser", "<font color='red'>用户名已存在！</font>");
				request.getRequestDispatcher("/client/register.jsp").forward(request, response);
				return;
			}
			
			service.register(user);
		} catch (Exception e) {
			e.printStackTrace();
			pw.write(e.getMessage());
			return;
		}
		// 注册成功，跳转到registersuccess.jsp
		response.sendRedirect(request.getContextPath() + "/client/registersuccess.jsp");
		return;
	}
}
