package cn.kfu.soft.market.service;

import java.sql.SQLException;

import javax.security.auth.login.LoginException;

import cn.kfu.soft.market.dao.UserDao;
import cn.kfu.soft.market.entity.UserBean;

public class UserService {
	private UserDao dao = new UserDao();
	
	// ��¼����
	public UserBean login(String username, String password) throws LoginException {
		try {
			//���ݵ�¼ʱ��������û��������룬�����û�
			UserBean user = dao.findUserByUsernameAndPassword(username, password);
			if (user != null) {
				return user;
			}
			throw new LoginException("�û������������");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new LoginException("��¼ʧ��");
		}
	}
	
	// ע�����
	public void register(UserBean user) throws Exception {
		// ����dao���ע�����
		try {
			dao.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ע��ʧ��");
		}
	}
	
	//У���û��Ƿ����
	public boolean userExist(String username) throws Exception {
		try {
			 UserBean sqluser = dao.findUser(username);
			 return sqluser!=null;
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			throw new Exception("�û����Ѵ���");
		}
	}
}
