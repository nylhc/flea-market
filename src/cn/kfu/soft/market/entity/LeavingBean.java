package cn.kfu.soft.market.entity;

public class LeavingBean {
	private String id;
	private String content;
	private ProductBean pl;
	private UserBean user;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public ProductBean getPl() {
		return pl;
	}
	public void setPl(ProductBean pl) {
		this.pl = pl;
	}
	public UserBean getUser() {
		return user;
	}
	public void setUser(UserBean user) {
		this.user = user;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "LeavingBean [id=" + id + ", content="+ content +",pl ="+ pl +",user="+user+"]";
	}		
}
