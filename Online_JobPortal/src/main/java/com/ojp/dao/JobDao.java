package com.ojp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ojp.entites.Job;

public class JobDao {
	private Connection con;

	public JobDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addJob(Job j) {
		boolean f = false;
		try {
			String query = "insert into jobs (tittle,description,category,status,location) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, j.getTittle());
			pstmt.setString(2, j.getDescription());
			pstmt.setString(3, j.getCategory());
			pstmt.setString(4, j.getStatus());
			pstmt.setString(5, j.getLocation());

			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Job> getAllJobs() {
		List<Job> list = new ArrayList<Job>();
		Job j = null;

		try {
			String query = "select * from jobs order by id desc";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				j = new Job();
				j.setId(set.getInt(1));
				j.setTittle(set.getString(2));
				j.setDescription(set.getString(3));
				j.setCategory(set.getString(4));
				j.setStatus(set.getString(5));
				j.setLocation(set.getString(6));
				j.setPdate(set.getTimestamp(7) + "");
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Job getJobById(int id) {

		Job j = null;

		try {
			String query = "select * from jobs where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				j = new Job();
				j.setId(set.getInt(1));
				j.setTittle(set.getString(2));
				j.setDescription(set.getString(3));
				j.setCategory(set.getString(4));
				j.setStatus(set.getString(5));
				j.setLocation(set.getString(6));
				j.setPdate(set.getTimestamp(7) + "");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return j;
	}

	public boolean updateJob(Job j) {
		boolean f = false;
		try {
			String query = "update jobs set tittle=?,description=?,category=?,status=?,location=? where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, j.getTittle());
			pstmt.setString(2, j.getDescription());
			pstmt.setString(3, j.getCategory());
			pstmt.setString(4, j.getStatus());
			pstmt.setString(5, j.getLocation());
			pstmt.setInt(6, j.getId());

			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteJobs(int id) {
		boolean f = false;
		try {
			String query = "delete from jobs where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, id);
			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Job> getAllJobsForUser() {
		List<Job> list = new ArrayList<Job>();
		Job j = null;

		try {
			String query = "select * from jobs where status=? order by id desc";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, "Active");
			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				j = new Job();
				j.setId(set.getInt(1));
				j.setTittle(set.getString(2));
				j.setDescription(set.getString(3));
				j.setCategory(set.getString(4));
				j.setStatus(set.getString(5));
				j.setLocation(set.getString(6));
				j.setPdate(set.getTimestamp(7) + "");
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Job> getJobsORLocationAndCate(String category, String location) {
		List<Job> list = new ArrayList<Job>();
		Job j = null;
		try {
			String query = "select * from jobs where (category=? or location=?) and status=? order by id desc";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, category);
			pstmt.setString(2, location);
			pstmt.setString(3, "Active");
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				j = new Job();
				j.setId(set.getInt(1));
				j.setTittle(set.getString(2));
				j.setDescription(set.getString(3));
				j.setCategory(set.getString(4));
				j.setStatus(set.getString(5));
				j.setLocation(set.getString(6));
				j.setPdate(set.getString(7));
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Job> getJobsAndLocationAndCate(String category, String location) {
		List<Job> list = new ArrayList<Job>();
		Job j = null;
		try {
			String query = "select * from jobs where status =? and category=? and location=? order by id desc";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, "Active");
			pstmt.setString(2, category);
			pstmt.setString(3, location);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				j = new Job();
				j.setId(set.getInt(1));
				j.setTittle(set.getString(2));
				j.setDescription(set.getString(3));
				j.setCategory(set.getString(4));
				j.setStatus(set.getString(5));
				j.setLocation(set.getString(6));
				j.setPdate(set.getString(7));
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
