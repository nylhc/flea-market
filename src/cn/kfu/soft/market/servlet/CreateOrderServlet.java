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
		// 1.得到当前用户
		HttpSession session = request.getSession();
		UserBean user = (UserBean) session.getAttribute("user");
		// 2.从购物车中获取商品信息
		Map<ProductBean, Integer> cart = (Map<ProductBean, Integer>)session.getAttribute("cart");
		// 3.将数据封装到订单对象中
		OrderBean order = new OrderBean();
		try {
			BeanUtils.populate(order, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		order.setId(IdUtils.getUUID());// 封装订单id
		order.setUser(user);// 封装用户信息到订单.
		for (ProductBean p : cart.keySet()) {
			OrderItem item = new OrderItem();
			item.setOrder(order);
			item.setBuynum(cart.get(p));
			item.setP(p);
			order.getOrderItems().add(item);
		}
		System.out.println(order);
		// 4.调用service中添加订单操作.
		OrderService service = new OrderService();
		service.addOrder(order);
//		request.getRequestDispatcher("/client/orderlist.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/client/orderSuccess.jsp");
	}

}

