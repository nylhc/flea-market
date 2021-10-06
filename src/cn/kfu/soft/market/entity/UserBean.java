package cn.kfu.soft.market.entity;

import java.io.Serializable;
import java.util.Date;

public class UserBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	private String username;
	private String password;
	private String gender;
	private String email;
	private String telephone;
	private String role;
	private Date registerTime;
		
	public UserBean() {
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	
	public String toString() {
		return "User [id="+id+",username="+username+",password="+password+",gender="+gender+",email="+email+","
				+ ",telephone="+telephone+",role="+role+"]";
	}
}
