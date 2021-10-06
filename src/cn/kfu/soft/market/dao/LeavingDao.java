package cn.kfu.soft.market.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.kfu.soft.market.entity.LeavingBean;
import cn.kfu.soft.market.util.DataSourceUtils;

public class LeavingDao {
	// 查找所有评价
	public List<LeavingBean> listAll() throws SQLException {
		String sql = "select * from leaving";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanListHandler<LeavingBean>(LeavingBean.class));
	}
	
	// 添加评论
	public void addleaving(LeavingBean p) throws SQLException {

		String sql = "insert into leaving values(?,?,?,?)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		runner.update(sql, p.getId(), p.getContent(),p.getPl(),p.getUser());
	}
}
