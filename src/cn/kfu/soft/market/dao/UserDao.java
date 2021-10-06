package cn.kfu.soft.market.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.kfu.soft.market.entity.UserBean;
import cn.kfu.soft.market.util.DataSourceUtils;


public class UserDao {	
	//根据用户名与密码查找用户
	public UserBean findUserByUsernameAndPassword(String username, String password) throws SQLException {
		String sql="select * from user where username=? and password=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<UserBean>(UserBean.class),username,password);
	}
	
	// 添加用户
	public void addUser(UserBean user) throws SQLException {
		String sql = "insert into user(username,password,gender,email,telephone) values(?,?,?,?,?)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		int row = runner.update(sql,new Object[] {user.getUsername(), user.getPassword(),
				user.getGender(), user.getEmail(), user.getTelephone()});
		if (row == 0) {
			throw new RuntimeException();
		}
	}
	
	//校验用户名是否存在
	public UserBean findUser(String username) throws SQLException{
		String sql="select * from user where username=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		UserBean user = (UserBean)runner.query(sql, new BeanHandler(UserBean.class),new Object[] {username});
		return user;
	}
}
