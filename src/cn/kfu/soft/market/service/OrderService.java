package cn.kfu.soft.market.service;

import java.sql.SQLException;
import java.util.List;

import cn.kfu.soft.market.dao.OrderDao;
import cn.kfu.soft.market.dao.OrderItemDao;
import cn.kfu.soft.market.dao.ProductDao;
import cn.kfu.soft.market.entity.OrderBean;
import cn.kfu.soft.market.entity.OrderItem;
import cn.kfu.soft.market.entity.UserBean;
import cn.kfu.soft.market.util.DataSourceUtils;

public class OrderService {
		private OrderItemDao oidao = new OrderItemDao();
		private OrderDao odao = new OrderDao();
		private ProductDao pdao = new ProductDao();
		// 1.��Ӷ���
		public void addOrder(OrderBean order) {
			try {
				// 1.��������
				DataSourceUtils.startTransaction();
				// 2.��ɲ���
				// 2.1��orders�����������
				odao.addProduct(order);
				// 2.2��orderItem�����������
				oidao.addOrderItem(order);
				// 2.3�޸���Ʒ��������.
				pdao.changeProductNum(order);
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					DataSourceUtils.rollback(); // ����ع�
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			} finally {
				try {
					// �رգ��ͷ��Լ��ύ����
					DataSourceUtils.releaseAndCloseConnection();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		// �����û����Ҷ���
		public List<OrderBean> findOrderByUser(UserBean user) {
			List<OrderBean> orders = null;
			try {
				// ���ҳ�������Ϣ
				orders = odao.findOrderByUser(user);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return orders;
		}
		// ����id���Ҷ���
		public OrderBean findOrderById(String id) {
			OrderBean order = null;
			try {
				order = odao.findOrderById(id);
				List<OrderItem> items = oidao.findOrderItemByOrder(order);
				order.setOrderItems(items);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return order;
		}
		// �������ж���
		public List<OrderBean> findAllOrder() {
			List<OrderBean> orders = null;
			try {
				// ���ҳ�������Ϣ
				orders = odao.findAllOrder();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return orders;
		}
		// ֧���ɹ����޸Ķ���״̬
		public void updateState(String id) {
			try {
				odao.updateOrderState(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// ��������ѯ������Ϣ
		public List<OrderBean> findOrderByCondition(String id, String receiverName) {
			List<OrderBean> orders = null;
			try {
				orders = odao.findOrderByCondition(id, receiverName);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return orders;
		}
		//����idɾ������ ����Աɾ������
		public void delOrderById(String id) {			
			try {
				DataSourceUtils.startTransaction();//��������
				oidao.delOrderItems(id);
				odao.delOrderById(id);
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					DataSourceUtils.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}finally{
				try {
					DataSourceUtils.releaseAndCloseConnection();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}		
		}
		//��ͨ�û�ɾ������
		public void delOrderByIdWithClient(String id) {
			try {
				DataSourceUtils.startTransaction();//��������
				//�Ӷ������в�����Ʒ��������
				OrderBean order=new OrderBean();
				order.setId(id);
				List<OrderItem> items=oidao.findOrderItemByOrder(order);
				//�޸���Ʒ����			
				pdao.updateProductNum(items);						
				oidao.delOrderItems(id); //ɾ��������
				odao.delOrderById(id); //ɾ������
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					DataSourceUtils.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}finally{
				try {
					DataSourceUtils.releaseAndCloseConnection();
				} catch (SQLException e) {
					e.printStackTrace();
			}
		}
	}
}