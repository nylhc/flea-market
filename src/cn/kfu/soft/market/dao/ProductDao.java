package cn.kfu.soft.market.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.kfu.soft.market.entity.OrderBean;
import cn.kfu.soft.market.entity.OrderItem;
import cn.kfu.soft.market.entity.ProductBean;
import cn.kfu.soft.market.util.DataSourceUtils;

public class ProductDao {
		// 获取数据总条数
		public int findAllCount(String category) throws SQLException {
			String sql = "select count(*) from products";

			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

			if (!"全部商品".equals(category)) {
				sql += " where category=?";

				Long count = (Long) runner
						.query(sql, new ScalarHandler(), category);
				return count.intValue();
			} else {
				Long count = (Long) runner.query(sql, new ScalarHandler());

				return count.intValue();
			}
		}
	
		// 获取当前页数据
		public List<ProductBean> findByPage(int currentPage, int currentCount,
				String category) throws SQLException {
			// 要执行的sql语句
			String sql = null;
			// 参数
			Object[] obj = null;
			// 如果category不为null,代表是按分类查找
			if (!"全部商品".equals(category)) {
				sql = "select * from products  where category=? limit ?,?";
				obj = new Object[] { category, (currentPage - 1) * currentCount,
						currentCount, };
			} else {
				sql = "select * from products  limit ?,?";
				obj = new Object[] { (currentPage - 1) * currentCount,
						currentCount, };
			}
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			return runner.query(sql, new BeanListHandler<ProductBean>(ProductBean.class),
					obj);
		}
		
		// 根据id查找商品
		public ProductBean findProductById(String id) throws SQLException {
			String sql = "select * from products where id=?";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			return runner.query(sql, new BeanHandler<ProductBean>(ProductBean.class), id);
		}
		
		// 多条件查询
		public List<ProductBean> findProductByCondition(String id, String name,
				String category, String minprice, String maxprice)
				throws SQLException {
			List<Object> list = new ArrayList<Object>();
			String sql = "select * from products where 1=1 ";

			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

			if (id != null && id.trim().length() > 0) {
				sql += " and id=?";
				list.add(id);
			}

			if (name != null && name.trim().length() > 0) {
				sql += " and name=?";
				list.add(name);
			}
			if (category != null && category.trim().length() > 0) {
				sql += " and category=?";
				list.add(category);
			}
			if (minprice != null && maxprice != null
					&& minprice.trim().length() > 0 && maxprice.trim().length() > 0) {
				sql += " and price between ? and ?";
				list.add(minprice);
				list.add(maxprice);
			}

			Object[] params = list.toArray();

			return runner.query(sql, new BeanListHandler<ProductBean>(ProductBean.class),
					params);
		}
		
		//前台，用于搜索框根据商品名来模糊查询相应的商品
		public List<ProductBean> findProductByName(int currentPage, int currentCount,
				String searchfield) throws SQLException {
			//根据名字模糊查询商品
			String sql = "SELECT * FROM products WHERE name LIKE '%"+searchfield+"%' LIMIT ?,?";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
//			//用于分页查询的数据
			return runner.query(sql, 
					new BeanListHandler<ProductBean>(ProductBean.class),currentPage-1,currentCount);
		}

		//前台搜索框，根据商品名模糊查询出的商品总数量
		public int findProductByNameAllCount(String searchfield) throws SQLException {
			String sql = "SELECT COUNT(*) FROM products WHERE name LIKE '%"+searchfield+"%'";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			//查询出满足条件的总数量，为long类型
			Long count = (Long)runner.query(sql, new ScalarHandler());
			return count.intValue();
		}
		
		// 查找所有商品
		public List<ProductBean> listAll() throws SQLException {
			String sql = "select * from products";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			return runner.query(sql, new BeanListHandler<ProductBean>(ProductBean.class));
		}
		
		// 生成订单时，将商品数量减少
		public void changeProductNum(OrderBean order) throws SQLException {
			String sql = "update products set pnum=pnum-? where id=?";
			QueryRunner runner = new QueryRunner();
			List<OrderItem> items = order.getOrderItems();
			Object[][] params = new Object[items.size()][2];

			for (int i = 0; i < params.length; i++) {
				params[i][0] = items.get(i).getBuynum();
				params[i][1] = items.get(i).getP().getId();
			}

			runner.batch(DataSourceUtils.getConnection(), sql, params);
		}
		
		//删除订单时，修改商品数量
		public void updateProductNum(List<OrderItem> items) throws SQLException {
			
			String sql = "update products set pnum=pnum+? where id=?";
			QueryRunner runner = new QueryRunner();
			
			Object[][] params = new Object[items.size()][2];

			for (int i = 0; i < params.length; i++) {
				params[i][0] = items.get(i).getBuynum();
				params[i][1] = items.get(i).getP().getId();
			}

			runner.batch(DataSourceUtils.getConnection(), sql, params);
		}
		
		// 修改商品信息
		public void editProduct(ProductBean p) throws SQLException {
			//1.创建集合并将商品信息添加到集合中
			List<Object> obj = new ArrayList<Object>();
			obj.add(p.getName());
			obj.add(p.getPrice());
			obj.add(p.getCategory());
			obj.add(p.getPnum());
			obj.add(p.getDescription());
			//2.创建sql语句，并拼接sql
			String sql  = "update products " +
					      "set  name=?,price=?,category=?,pnum=?,description=? ";
			//判断是否有图片
			if (p.getImgurl() != null && p.getImgurl().trim().length() > 0) {
				sql += " ,imgurl=?";
				obj.add(p.getImgurl());
			}
			sql += " where id=?";
			obj.add(p.getId());		
			System.out.println(sql);		
			System.out.println(obj);
			//3.创建QueryRunner对象
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			//4.使用QueryRunner对象的update()方法更新数据
			runner.update(sql, obj.toArray());
		}
		
		// 添加商品
		public void addProduct(ProductBean p) throws SQLException {

			String sql = "insert into products values(?,?,?,?,?,?,?)";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			runner.update(sql, p.getId(), p.getName(), p.getPrice(),
					p.getCategory(), p.getPnum(), p.getImgurl(), p.getDescription());
		}
		
		//后台系统，根据id删除商品信息
		public void deleteProduct(String id) throws SQLException {
			String sql = "DELETE FROM products WHERE id = ?";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			runner.update(sql, id);
		}
}
