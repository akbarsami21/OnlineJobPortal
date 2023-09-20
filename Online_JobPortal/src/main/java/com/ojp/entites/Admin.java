package com.ojp.entites;

public class Admin {
	private int id;
	private String name;
	private String gender;
	private String Address;
	private String email;
	private String dob;
	private String password;
	private String pic;
	private String role;
	private String qualification;
	private String adminId;

	public Admin() {
		super();

	}

	public Admin(String name, String gender, String address, String email, String dob, String password, String pic,String adminId) {
		super();
		this.name = name;
		this.gender = gender;
		Address = address;
		this.email = email;
		this.dob = dob;
		this.password = password;
		this.pic = pic;
		this.adminId=adminId;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	
	

	

}
