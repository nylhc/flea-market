package cn.kfu.soft.market.entity;

public class OrderItem {

	private OrderBean order;
	private ProductBean p;
	private int buynum;

	public OrderBean getOrder() {
		return order;
	}

	public void setOrder(OrderBean order) {
		this.order = order;
	}

	public ProductBean getP() {
		return p;
	}

	public void setP(ProductBean p) {
		this.p = p;
	}

	public int getBuynum() {
		return buynum;
	}

	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}

}

