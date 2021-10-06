package cn.kfu.soft.market.service;

import java.sql.SQLException;
import java.util.List;

import cn.kfu.soft.market.bean.PageBean;
import cn.kfu.soft.market.dao.ProductDao;
import cn.kfu.soft.market.entity.ProductBean;
import cn.kfu.soft.market.exception.AddProductException;
import cn.kfu.soft.market.exception.FindProductByIdException;
import cn.kfu.soft.market.exception.ListProductException;

public class ProductService {
	private ProductDao dao = new ProductDao();
	
	// 分页操作
	public PageBean findProductByPage(int currentPage, int currentCount,String category) {
		PageBean bean = new PageBean();
		// 封装每页显示数据条数
		bean.setCurrentCount(currentCount);
		// 封装当前页码
		bean.setCurrentPage(currentPage);
		// 封装当前查找类别
		bean.setCategory(category);
		try {
			// 获取总条数
			int totalCount = dao.findAllCount(category);
			bean.setTotalCount(totalCount);
			// 获取总页数
			int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
			bean.setTotalPage(totalPage);
			// 获取当前页数据
			List<ProductBean> ps = dao.findByPage(currentPage, currentCount,category);
			bean.setPs(ps);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	// 根据id查找商品
	public ProductBean findProductById(String id) throws FindProductByIdException {
		try {
			return dao.findProductById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FindProductByIdException("根据ID查找商品失败");
		}
	}
	
	// 多条件查询
	public List<ProductBean> findProductByCondition(String id, String name,
			String category, String minprice, String maxprice) {
		List<ProductBean> ps = null;
		try {
			ps = dao.findProductByCondition(id, name, category, minprice,maxprice);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}

	//前台，用于搜索框根据商品名来模糊查询相应的商品
	public PageBean findProductByName(int currentPage, int currentCount,String searchfield) {
		PageBean bean = new PageBean();
		// 封装每页显示数据条数
		bean.setCurrentCount(currentCount);
		// 封装当前页码
		bean.setCurrentPage(currentPage);
		// 封装模糊查询的商品名
		bean.setSearchfield(searchfield);
		try {
			// 获取总条数
			int totalCount = dao.findProductByNameAllCount(searchfield);
			bean.setTotalCount(totalCount);
			// 获取总页数
			int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
			bean.setTotalPage(totalPage);
			//满足条件的商品
			List<ProductBean> ps = dao.findProductByName(currentPage,currentCount,searchfield);
			bean.setPs(ps);
			return bean;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("前台搜索框根据商品名查询商品失败！");
		}
	}
	
	// 查找所有商品信息
	public List<ProductBean> listAll() throws ListProductException {
		try {
			return dao.listAll();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ListProductException("查询商品失败");
		}
	}
	
	// 修改商品信息
	public void editProduct(ProductBean p) {
		try {
			dao.editProduct(p);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 添加商品
	public void addProduct(ProductBean p) throws AddProductException {
		try {
			dao.addProduct(p);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AddProductException("添加商品失败");
		}
	}
	
	//后台系统，根据id删除商品信息
	public void deleteProduct(String id) {
		try {
			dao.deleteProduct(id);
		} catch (SQLException e) {
			throw new RuntimeException("后台系统根据id删除商品信息失败！");
		}
	}
	
}

