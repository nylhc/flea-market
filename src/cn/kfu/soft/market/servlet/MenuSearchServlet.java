package cn.kfu.soft.market.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.kfu.soft.market.bean.PageBean;
import cn.kfu.soft.market.service.ProductService;

public class MenuSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 1.���嵱ǰҳ�룬Ĭ��Ϊ1
		int currentPage = 1;
		String _currentPage = req.getParameter("currentPage");
		if (_currentPage != null) {
			currentPage = Integer.parseInt(_currentPage);
		}
		// 2.����ÿҳ��ʾ����,Ĭ��Ϊ4
		int currentCount = 4;	
		
		//��ȡǰ̨ҳ�������������ֵ
		//String textfield = java.net.URLEncoder.encode("������Ʒ", "utf-8");
		String searchfield = req.getParameter("textfield");
		//String str = new String(searchfield.getBytes("ISO-8859-1"),"UTF-8");
		//�����������û������ֵ��������ݵ�ΪĬ��ֵ����ʱĬ�ϲ�ѯȫ����ƷĿ¼
		if("������Ʒ".equals(searchfield)){
			req.getRequestDispatcher("/showProductByPage").forward(req, resp);
			return;
		}
		//����service��ķ�����ͨ������ģ����ѯ��������Ӧ����Ʒ
		ProductService service = new ProductService();
		PageBean bean = service.findProductByName(currentPage,currentCount,searchfield);
		// �����ݴ洢��request��Χ����ת��product_search_list.jspҳ��չʾ
		req.setAttribute("bean", bean);
		req.getRequestDispatcher("/client/productsearch.jsp").forward(req, resp);
	}
}