package cn.kfu.soft.market.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import cn.kfu.soft.market.entity.OrderBean;
import cn.kfu.soft.market.entity.UserBean;
import cn.kfu.soft.market.util.DataSourceUtils;


public class OrderDao {
	/**
	 *  ���ɶ���
	 * @param order
	 * @throws SQLException
	 */
	public void addProduct(OrderBean order) throws SQLException {
		// 1.����Sql���
		String sql = "insert into orders values(?,?,?,?,?,0,null,?)";
		// 2.����ִ��sql����QueryRunner,�����ݲ���
		QueryRunner runner = new QueryRunner();
        // 3.ִ��update()������������
		runner.update(DataSourceUtils.getConnection(), sql, order.getId(),
				order.getMoney(), order.getReceiverAddress(), order
						.getReceiverName(), order.getReceiverPhone(), order
						.getUser().getId());
	}
	/**
	 * �����û���������
	 */
	public List<OrderBean> findOrderByUser(final UserBean user) throws SQLException {
		String sql = "select * from orders where user_id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new ResultSetHandler<List<OrderBean>>() {
			public List<OrderBean> handle(ResultSet rs) throws SQLException {
				List<OrderBean> orders = new ArrayList<OrderBean>();
				while (rs.next()) {
					OrderBean order = new OrderBean();
					order.setId(rs.getString("id"));
					order.setMoney(rs.getDouble("money"));
					order.setOrdertime(rs.getDate("ordertime"));
					order.setPaystate(rs.getInt("paystate"));
					order.setReceiverAddress(rs.getString("receiverAddress"));
					order.setReceiverName(rs.getString("receiverName"));
					order.setReceiverPhone(rs.getString("receiverPhone"));
					order.setUser(user);
					orders.add(order);
				}
				return orders;
			}
		}, user.getId());
	}
	/**
	 * ����id���Ҷ�����Ϣ
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public OrderBean findOrderById(String id) throws SQLException {
		String sql = "select * from orders,user where orders.user_id=user.id and orders.id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new ResultSetHandler<OrderBean>() {
			public OrderBean handle(ResultSet rs) throws SQLException {
				OrderBean order = new OrderBean();
				while (rs.next()) {
					order.setId(rs.getString("orders.id"));
					order.setMoney(rs.getDouble("orders.money"));
					order.setOrdertime(rs.getDate("orders.ordertime"));
					order.setPaystate(rs.getInt("orders.paystate"));
					order.setReceiverAddress(rs.getString("orders.receiverAddress"));
					order.setReceiverName(rs.getString("orders.receiverName"));
					order.setReceiverPhone(rs.getString("orders.receiverPhone"));

					UserBean user = new UserBean();
					user.setId(rs.getInt("user.id"));
					user.setEmail(rs.getString("user.email"));
					user.setGender(rs.getString("user.gender"));
					user.setPassword(rs.getString("user.password"));
					user.setRegisterTime(rs.getDate("user.registtime"));
					user.setRole(rs.getString("user.role"));
					user.setTelephone(rs.getString("user.telephone"));
					user.setUsername(rs.getString("user.username"));
					order.setUser(user);
				}
				return order;
			}
		}, id);
	}
	/**
	 *  �������ж���
	 * @return
	 * @throws SQLException
	 */
	public List<OrderBean> findAllOrder() throws SQLException {
		//1.����sql
		String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id order by orders.user_id";
		//2.����QueryRunner����
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        //3.����QueryRunner����query()�����Ĳ�ѯ���
		return runner.query(sql, new ResultSetHandler<List<OrderBean>>() {			
			public List<OrderBean> handle(ResultSet rs) throws SQLException {
				//������������
				List<OrderBean> orders = new ArrayList<OrderBean>();
                //ѭ�������������û���Ϣ
				while (rs.next()) {
					OrderBean order = new OrderBean();
					order.setId(rs.getString("orders.id"));
					order.setMoney(rs.getDouble("orders.money"));
					order.setOrdertime(rs.getDate("orders.ordertime"));
					order.setPaystate(rs.getInt("orders.paystate"));
					order.setReceiverAddress(rs.getString("orders.receiverAddress"));
					order.setReceiverName(rs.getString("orders.receiverName"));
					order.setReceiverPhone(rs.getString("orders.receiverPhone"));
					orders.add(order);

					UserBean user = new UserBean();
					user.setId(rs.getInt("user.id"));
					user.setEmail(rs.getString("user.email"));
					user.setGender(rs.getString("user.gender"));
					user.setPassword(rs.getString("user.password"));
					user.setRegisterTime(rs.getDate("user.registtime"));
					user.setRole(rs.getString("user.role"));
					user.setTelephone(rs.getString("user.telephone"));
					user.setUsername(rs.getString("user.username"));
					order.setUser(user);
				}
				return orders;
			}
		});
	}
	/**
	 *  ���ݶ������޸Ķ���״̬
	 * @param id
	 * @throws SQLException
	 */
	public void updateOrderState(String id) throws SQLException {
		String sql = "update orders set paystate=1 where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		runner.update(sql, id);
		System.out.println(runner.update(sql, id));
	}
	/**
	 *  ��������ѯ
	 * @param id
	 * @param receiverName
	 * @return
	 * @throws SQLException
	 */
	public List<OrderBean> findOrderByCondition(String id, String receiverName)
			throws SQLException {
		//1.�������϶���
		List<Object> objs = new ArrayList<Object>();
		//2.�����ѯsql
		String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id ";
		//3.���ݲ���ƴ��sql���
		if (id != null && id.trim().length() > 0) {
			sql += " and orders.id=?";
			objs.add(id);
		}
		if (receiverName != null && receiverName.trim().length() > 0) {
			sql += " and receiverName=?";
			objs.add(receiverName);
		}
		sql += " order by orders.user_id";
		//4.����QueryRunner����
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		//5.����QueryRunner����query������ִ�н��
		return runner.query(sql, new ResultSetHandler<List<OrderBean>>() {
			public List<OrderBean> handle(ResultSet rs) throws SQLException {
				List<OrderBean> orders = new ArrayList<OrderBean>();
               //ѭ���������������û���Ϣ
				while (rs.next()) {
					OrderBean order = new OrderBean();
					order.setId(rs.getString("orders.id"));
					order.setMoney(rs.getDouble("orders.money"));
					order.setOrdertime(rs.getDate("orders.ordertime"));
					order.setPaystate(rs.getInt("orders.paystate"));
					order.setReceiverAddress(rs
							.getString("orders.receiverAddress"));
					order.setReceiverName(rs.getString("orders.receiverName"));
					order.setReceiverPhone(rs.getString("orders.receiverPhone"));
					orders.add(order);
					UserBean user = new UserBean();
					user.setId(rs.getInt("user.id"));
					user.setEmail(rs.getString("user.email"));
					user.setGender(rs.getString("user.gender"));
					user.setPassword(rs.getString("user.password"));
					user.setRegisterTime(rs.getDate("user.registtime"));
					user.setRole(rs.getString("user.role"));
					user.setTelephone(rs.getString("user.telephone"));
					user.setUsername(rs.getString("user.username"));
					order.setUser(user);

				}

				return orders;
			}
		}, objs.toArray());
	}
	/**
	 * ����idɾ������
	 * @param id
	 * @throws SQLException
	 */
	public void delOrderById(String id) throws SQLException {
		String sql="delete from orders where id=?";		
		QueryRunner runner = new QueryRunner();		
		runner.update(DataSourceUtils.getConnection(),sql,id);		
	}
}

