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
	 *  生成订单
	 * @param order
	 * @throws SQLException
	 */
	public void addProduct(OrderBean order) throws SQLException {
		// 1.生成Sql语句
		String sql = "insert into orders values(?,?,?,?,?,0,null,?)";
		// 2.生成执行sql语句的QueryRunner,不传递参数
		QueryRunner runner = new QueryRunner();
        // 3.执行update()方法插入数据
		runner.update(DataSourceUtils.getConnection(), sql, order.getId(),
				order.getMoney(), order.getReceiverAddress(), order
						.getReceiverName(), order.getReceiverPhone(), order
						.getUser().getId());
	}
	/**
	 * 查找用户所属订单
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
	 * 根据id查找订单信息
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
	 *  查找所有订单
	 * @return
	 * @throws SQLException
	 */
	public List<OrderBean> findAllOrder() throws SQLException {
		//1.创建sql
		String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id order by orders.user_id";
		//2.创建QueryRunner对象
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        //3.返回QueryRunner对象query()方法的查询结果
		return runner.query(sql, new ResultSetHandler<List<OrderBean>>() {			
			public List<OrderBean> handle(ResultSet rs) throws SQLException {
				//创建订单集合
				List<OrderBean> orders = new ArrayList<OrderBean>();
                //循环遍历订单和用户信息
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
	 *  根据订单号修改订单状态
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
	 *  多条件查询
	 * @param id
	 * @param receiverName
	 * @return
	 * @throws SQLException
	 */
	public List<OrderBean> findOrderByCondition(String id, String receiverName)
			throws SQLException {
		//1.创建集合对象
		List<Object> objs = new ArrayList<Object>();
		//2.定义查询sql
		String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id ";
		//3.根据参数拼接sql语句
		if (id != null && id.trim().length() > 0) {
			sql += " and orders.id=?";
			objs.add(id);
		}
		if (receiverName != null && receiverName.trim().length() > 0) {
			sql += " and receiverName=?";
			objs.add(receiverName);
		}
		sql += " order by orders.user_id";
		//4.创建QueryRunner对象
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		//5.返回QueryRunner对象query方法的执行结果
		return runner.query(sql, new ResultSetHandler<List<OrderBean>>() {
			public List<OrderBean> handle(ResultSet rs) throws SQLException {
				List<OrderBean> orders = new ArrayList<OrderBean>();
               //循环遍历出订单和用户信息
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
	 * 根据id删除订单
	 * @param id
	 * @throws SQLException
	 */
	public void delOrderById(String id) throws SQLException {
		String sql="delete from orders where id=?";		
		QueryRunner runner = new QueryRunner();		
		runner.update(DataSourceUtils.getConnection(),sql,id);		
	}
}

