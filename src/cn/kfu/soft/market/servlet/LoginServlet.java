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
		// 1.��ȡ��¼ҳ��������û���������
		resp.setContentType("text/html;charset=utf-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		if (username==null || username.equals("")) {
			req.setAttribute("loginmess", "�û�������Ϊ��!");
			req.getRequestDispatcher("/client/login.jsp").forward(req, resp);
			return;
		}
		
		if (password==null || password.equals("")) {
			req.setAttribute("loginmess", "���벻��Ϊ��!");
			req.getRequestDispatcher("/client/login.jsp").forward(req, resp);
			return;
		} 
	
		// 2.����service��ɵ�¼������
		UserService service = new UserService();
		try {
			UserBean user = service.login(username, password);
			
			// 3.��¼�ɹ������û��洢��session��
			req.getSession().setAttribute("user", user);
			// ��ȡ�û��Ľ�ɫ
			String role = user.getRole();
			// ����ǳ����û����ͽ����̨����ϵͳ����������ҵ��˻�ҳ��
			if ("admin".equals(role)) {
				resp.sendRedirect(req.getContextPath() + "/admin/home.jsp");
				return;
			} else {
				resp.sendRedirect(req.getContextPath() + "/client/myAccount.jsp");
				return;
			}
		} catch (LoginException e) {
			// ����������⣬��������Ϣ�洢��request��Χ������ת�ص�¼ҳ����ʾ������Ϣ
			e.printStackTrace();
			req.setAttribute("loginmess", e.getMessage());
			req.getRequestDispatcher("/client/login.jsp").forward(req, resp);
			return;
		}
	}
}
