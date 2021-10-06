package cn.kfu.soft.market.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import cn.kfu.soft.market.entity.OrderBean;
import cn.kfu.soft.market.entity.OrderItem;
import cn.kfu.soft.market.entity.ProductBean;
import cn.kfu.soft.market.entity.UserBean;
import cn.kfu.soft.market.service.OrderService;
import cn.kfu.soft.market.util.IdUtils;


public class CreateOrderServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.�õ���ǰ�û�
		HttpSession session = request.getSession();
		UserBean user = (UserBean) session.getAttribute("user");
		// 2.�ӹ��ﳵ�л�ȡ��Ʒ��Ϣ
		Map<ProductBean, Integer> cart = (Map<ProductBean, Integer>)session.getAttribute("cart");
		// 3.�����ݷ�װ������������
		OrderBean order = new OrderBean();
		try {
			BeanUtils.populate(order, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		order.setId(IdUtils.getUUID());// ��װ����id
		order.setUser(user);// ��װ�û���Ϣ������.
		for (ProductBean p : cart.keySet()) {
			OrderItem item = new OrderItem();
			item.setOrder(order);
			item.setBuynum(cart.get(p));
			item.setP(p);
			order.getOrderItems().add(item);
		}
		System.out.println(order);
		// 4.����service����Ӷ�������.
		OrderService service = new OrderService();
		service.addOrder(order);
//		request.getRequestDispatcher("/client/orderlist.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/client/orderSuccess.jsp");
	}

}

