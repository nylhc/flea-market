package cn.kfu.soft.market.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.kfu.soft.market.dao.UserDao;
import cn.kfu.soft.market.entity.UserBean;
import cn.kfu.soft.market.service.UserService;
import sun.util.logging.resources.logging_zh_CN;


public class LoginServlet extends HttpServlet {
	private static final long seriaVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1.获取登录页面输入的用户名与密码
		resp.setContentType("text/html;charset=utf-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		if (username==null || username.equals("")) {
			req.setAttribute("loginmess", "用户名不能为空!");
			req.getRequestDispatcher("/client/login.jsp").forward(req, resp);
			return;
		}
		
		if (password==null || password.equals("")) {
			req.setAttribute("loginmess", "密码不能为空!");
			req.getRequestDispatcher("/client/login.jsp").forward(req, resp);
			return;
		} 
	
		// 2.调用service完成登录操作。
		UserService service = new UserService();
		try {
			UserBean user = service.login(username, password);
			
			// 3.登录成功，将用户存储到session中
			req.getSession().setAttribute("user", user);
			// 获取用户的角色
			String role = user.getRole();
			// 如果是超级用户，就进入后台管理系统；否则进入我的账户页面
			if ("admin".equals(role)) {
				resp.sendRedirect(req.getContextPath() + "/admin/home.jsp");
				return;
			} else {
				resp.sendRedirect(req.getContextPath() + "/client/myAccount.jsp");
				return;
			}
		} catch (LoginException e) {
			// 如果出现问题，将错误信息存储到request范围，并跳转回登录页面显示错误信息
			e.printStackTrace();
			req.setAttribute("loginmess", e.getMessage());
			req.getRequestDispatcher("/client/login.jsp").forward(req, resp);
			return;
		}
	}
}
