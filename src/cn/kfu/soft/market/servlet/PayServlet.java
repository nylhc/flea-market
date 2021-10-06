package cn.kfu.soft.market.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * ���ģ��֧����
 */
public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.��Ҫ�ύ�����ݵõ�
		// ��� ֧�������������
		String orderid = request.getParameter("orderid");
		String money = request.getParameter("money");
		// ����
		String bank = request.getParameter("yh");		
		request.setAttribute("bank", bank);
		request.setAttribute("orderid", orderid);	
		request.setAttribute("money", money);
		request.getRequestDispatcher("/client/confirm.jsp").forward(request, response);
	}
}