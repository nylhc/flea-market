package cn.kfu.soft.market.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.kfu.soft.market.entity.ProductBean;

public class CartChangeServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.�õ���Ʒid
		String id = request.getParameter("id");
		// 2.�õ�Ҫ�޸ĵ�����
		int count = Integer.parseInt(request.getParameter("count"));
		// 3.��session�л�ȡ���ﳵ.
		HttpSession session = request.getSession();
		Map<ProductBean, Integer> cart = (Map<ProductBean, Integer>) session.getAttribute("cart");
		ProductBean p = new ProductBean();
		p.setId(id);
		if (count != 0) {
			cart.put(p, count);
		} else {
			cart.remove(p);
		}
		response.sendRedirect(request.getContextPath() + "/client/cart.jsp");
		return;
	}
}

