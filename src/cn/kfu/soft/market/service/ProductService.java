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
	
	// ��ҳ����
	public PageBean findProductByPage(int currentPage, int currentCount,String category) {
		PageBean bean = new PageBean();
		// ��װÿҳ��ʾ��������
		bean.setCurrentCount(currentCount);
		// ��װ��ǰҳ��
		bean.setCurrentPage(currentPage);
		// ��װ��ǰ�������
		bean.setCategory(category);
		try {
			// ��ȡ������
			int totalCount = dao.findAllCount(category);
			bean.setTotalCount(totalCount);
			// ��ȡ��ҳ��
			int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
			bean.setTotalPage(totalPage);
			// ��ȡ��ǰҳ����
			List<ProductBean> ps = dao.findByPage(currentPage, currentCount,category);
			bean.setPs(ps);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	// ����id������Ʒ
	public ProductBean findProductById(String id) throws FindProductByIdException {
		try {
			return dao.findProductById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FindProductByIdException("����ID������Ʒʧ��");
		}
	}
	
	// ��������ѯ
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

	//ǰ̨�����������������Ʒ����ģ����ѯ��Ӧ����Ʒ
	public PageBean findProductByName(int currentPage, int currentCount,String searchfield) {
		PageBean bean = new PageBean();
		// ��װÿҳ��ʾ��������
		bean.setCurrentCount(currentCount);
		// ��װ��ǰҳ��
		bean.setCurrentPage(currentPage);
		// ��װģ����ѯ����Ʒ��
		bean.setSearchfield(searchfield);
		try {
			// ��ȡ������
			int totalCount = dao.findProductByNameAllCount(searchfield);
			bean.setTotalCount(totalCount);
			// ��ȡ��ҳ��
			int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
			bean.setTotalPage(totalPage);
			//������������Ʒ
			List<ProductBean> ps = dao.findProductByName(currentPage,currentCount,searchfield);
			bean.setPs(ps);
			return bean;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("ǰ̨�����������Ʒ����ѯ��Ʒʧ�ܣ�");
		}
	}
	
	// ����������Ʒ��Ϣ
	public List<ProductBean> listAll() throws ListProductException {
		try {
			return dao.listAll();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ListProductException("��ѯ��Ʒʧ��");
		}
	}
	
	// �޸���Ʒ��Ϣ
	public void editProduct(ProductBean p) {
		try {
			dao.editProduct(p);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// �����Ʒ
	public void addProduct(ProductBean p) throws AddProductException {
		try {
			dao.addProduct(p);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AddProductException("�����Ʒʧ��");
		}
	}
	
	//��̨ϵͳ������idɾ����Ʒ��Ϣ
	public void deleteProduct(String id) {
		try {
			dao.deleteProduct(id);
		} catch (SQLException e) {
			throw new RuntimeException("��̨ϵͳ����idɾ����Ʒ��Ϣʧ�ܣ�");
		}
	}
	
}

