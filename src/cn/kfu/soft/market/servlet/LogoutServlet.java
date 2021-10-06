package cn.kfu.soft.market.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.kfu.soft.market.entity.UserBean;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取Session对象
		HttpSession session = req.getSession();
		//销毁Session
		session.invalidate();
		//flag标识
		String flag = req.getParameter("flag");
		if (flag == null || flag.trim().isEmpty()) {
			//重定向到主页
			resp.sendRedirect(req.getContextPath() + "/index.jsp");
		}
	}	
}
