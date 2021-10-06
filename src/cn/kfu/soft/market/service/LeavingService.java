package cn.kfu.soft.market.service;

import java.sql.SQLException;
import java.util.List;

import cn.kfu.soft.market.dao.LeavingDao;
import cn.kfu.soft.market.entity.LeavingBean;
import cn.kfu.soft.market.exception.AddProductException;
import cn.kfu.soft.market.exception.ListProductException;

public class LeavingService {
	private LeavingDao dao = new LeavingDao();
	
	// 查找所有评价
	public List<LeavingBean> listAll() throws ListProductException {
		try {
			return dao.listAll();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ListProductException("查询评论失败");
		}
	}
	
	// 评价
	public void addleaving(LeavingBean p) throws AddProductException {
		try {
			dao.addleaving(p);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AddProductException("评论失败");
		}
	}
}
