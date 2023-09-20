package com.ojp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ojp.entites.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(User u) {
		boolean f = true;
		try {
			String query = "insert into user(name,qualification,gender,address,email,dob,password,pic,role) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = this.conn.prepareStatement(query);
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getQualification());
			pstmt.setString(3, u.getGender());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getEmail());
			pstmt.setString(6, u.getDob());
			pstmt.setString(7, u.getPassword());
			pstmt.setString(8, u.getPic());
			pstmt.setString(9, "user");

			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User login(String email, String password) {
		User u = null;

		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement pstmt = this.conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				u = new User();
				u.setId(set.getInt(1));
				u.setName(set.getString(2));
				u.setQualification(set.getString(3));
				u.setGender(set.getString(4));
				u.setAddress(set.getString(5));
				u.setEmail(set.getString(6));
				u.setDob(set.getString(7));
				u.setPassword(set.getString(8));
				u.setPic(set.getString(9));
				u.setRole(set.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	public boolean updateUser(User u) {
		boolean f = false;
		try {
			String query = "update user set name=?, qualification=?, address=?, email=?, dob=? where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(query);
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getQualification());
			pstmt.setString(3, u.getAddress());
			pstmt.setString(4, u.getEmail());
			pstmt.setString(5, u.getDob());	
			pstmt.setInt(6, u.getId());
			int i=pstmt.executeUpdate();
			if(i==1) {
				f=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	
	public boolean updateUserPass(User u) {
		boolean f = false;
		try {
			String query = "update user set password=? where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(query);
			
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
