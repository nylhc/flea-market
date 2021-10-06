package cn.kfu.soft.market.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.kfu.soft.market.entity.ProductBean;
import cn.kfu.soft.market.exception.FindProductByIdException;
import cn.kfu.soft.market.service.ProductService;


public class ProductFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// �õ���Ʒ��id
		String id = request.getParameter("id");
		// ��ȡtype����ֵ���˴���type����������ͨ�û��ͳ����û�
		String type = request.getParameter("type");		
		ProductService service = new ProductService();		
		try {
			// ����service�㷽����ͨ��id������Ʒ
			ProductBean p = service.findProductById(id);
			request.setAttribute("p", p);
			// ��ͨ�û�Ĭ�ϲ�����typeֵ������ת��info.jspҳ��
			if (type == null) {
				request.getRequestDispatcher("/client/info.jsp").forward(request,response);
				return;
			}						
			request.getRequestDispatcher("/admin/products/edit.jsp").forward(request, response);
			return;
		} catch (FindProductByIdException e) {
			e.printStackTrace();
		}
	}
}
