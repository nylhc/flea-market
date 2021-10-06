package cn.kfu.soft.market.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import cn.kfu.soft.market.entity.LeavingBean;
import cn.kfu.soft.market.entity.ProductBean;
import cn.kfu.soft.market.entity.UserBean;
import cn.kfu.soft.market.exception.AddProductException;
import cn.kfu.soft.market.exception.FindProductByIdException;
import cn.kfu.soft.market.service.LeavingService;
import cn.kfu.soft.market.service.ProductService;
import cn.kfu.soft.market.util.IdUtils;

public class LeavingServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// �õ���Ʒ��id
		String id = req.getParameter("id");
		String context = req.getParameter("context");
		// 1.�õ���ǰ�û�
		HttpSession session = req.getSession();
		UserBean user = (UserBean) session.getAttribute("user");
		ProductService ser = new ProductService();
		ProductBean p1 = (ProductBean) session.getAttribute("id");
		
		
		// ����javaBean,���ϴ����ݷ�װ.
		LeavingBean p = new LeavingBean();
		HashMap<String, String> map = new HashMap<String,String>();
		//��װ����id
		map.put("id", IdUtils.getUUID());
		p.setUser(user);
		p.setContent(context);
		p.setPl(p1);
		try {
			// �����ݷ�װ��javaBean��
			BeanUtils.populate(p, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		LeavingService service = new LeavingService();
		try {
			// ����service��������Ʒ����
			service.addleaving(p);
			resp.sendRedirect(req.getContextPath()
					+ "/client/buyleave.jsp");
			return;
		} catch (AddProductException e) {
			e.printStackTrace();
			resp.getWriter().write("����ʧ��");
			return;
		}
	}
	
}
