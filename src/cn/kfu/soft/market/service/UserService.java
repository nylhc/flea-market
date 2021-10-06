package cn.kfu.soft.market.service;

import java.sql.SQLException;

import javax.security.auth.login.LoginException;

import cn.kfu.soft.market.dao.UserDao;
import cn.kfu.soft.market.entity.UserBean;

public class UserService {
	private UserDao dao = new UserDao();
	
	// 登录操作
	public UserBean login(String username, String password) throws LoginException {
		try {
			//根据登录时表单输入的用户名和密码，查找用户
			UserBean user = dao.findUserByUsernameAndPassword(username, password);
			if (user != null) {
				return user;
			}
			throw new LoginException("用户名或密码错误");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new LoginException("登录失败");
		}
	}
	
	// 注册操作
	public void register(UserBean user) throws Exception {
		// 调用dao完成注册操作
		try {
			dao.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("注冊失败");
		}
	}
	
	//校验用户是否存在
	public boolean userExist(String username) throws Exception {
		try {
			 UserBean sqluser = dao.findUser(username);
			 return sqluser!=null;
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			throw new Exception("用户名已存在");
		}
	}
}
