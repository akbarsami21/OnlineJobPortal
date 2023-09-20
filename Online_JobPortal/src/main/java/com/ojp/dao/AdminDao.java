package com.ojp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.ojp.entites.Admin;



public class AdminDao {
	private Connection con;

	public AdminDao(Connection con) {
		super();
		this.con = con;
	}
    
	public boolean addAdmin(Admin u) {
		boolean f = true;
		try {
			String query = "insert into admin(name,gender,address,email,dob,password,pic,role,adminid) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, u.getName());			
			pstmt.setString(2, u.getGender());
			pstmt.setString(3, u.getAddress());
			pstmt.setString(4, u.getEmail());
			pstmt.setString(5, u.getDob());
			pstmt.setString(6, u.getPassword());
			pstmt.setString(7, u.getPic());
			pstmt.setString(8, "admin");
			pstmt.setString(9, u.getAdminId());
			
			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public Admin login(String adminId,String email, String password) {
		Admin u = null;

		try {
			String query = "select * from admin where adminid=? and email=? and password=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, adminId);
			pstmt.setString(2, email);
			pstmt.setString(3, password);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				u = new Admin();
				u.setId(set.getInt(1));
				u.setName(set.getString(2));				
				u.setGender(set.getString(3));
				u.setAddress(set.getString(4));
				u.setEmail(set.getString(5));
				u.setDob(set.getString(6));
				u.setPassword(set.getString(7));
				u.setPic(set.getString(8));
				u.setRole(set.getString(9));
				u.setAdminId(set.getString(11));
			     
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}
	
	public boolean updateAdminPass(Admin u) {
		boolean f = false;
		try {
			String query = "update admin set password=? where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			pstmt.setString(1, u.getPassword());
			pstmt.setInt(2, u.getId());
			int i=pstmt.executeUpdate();
			if(i==1) {
				f=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
