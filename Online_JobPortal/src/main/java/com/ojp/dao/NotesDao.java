package com.ojp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.ojp.entites.Notes;


public class NotesDao {
	private Connection con;

	public NotesDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean AddNotes(String tittle, String content, int uid) {
		boolean f = false;
		try {
			String query = "insert into notes(tittle,content,uid) values(?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, tittle);
			pstmt.setString(2, content);
			pstmt.setInt(3, uid);

			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<Notes> getData(int id) {
		List<Notes> list = new ArrayList<Notes>();
		Notes po = null;
		try {
			String query = "select * from notes where uid=? order by id DESC";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				po = new Notes();
				po.setId(set.getInt(1));
				po.setTittle(set.getString(2));
				po.setContent(set.getString(3));
				po.setPdate(set.getTimestamp(4));
				list.add(po);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Notes getDataById(int noteId) {
		Notes p = null;
		try {
			String query = "select * from notes where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, noteId);

			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				p = new Notes();
				p.setId(set.getInt(1));
				p.setTittle(set.getString(2));
				p.setContent(set.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}

	public boolean postUpdate(int noteid, String tittle, String content) {
		boolean f = false;

		try {
			String query = "update notes set tittle=?, content=? where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, tittle);
			pstmt.setString(2, content);
			pstmt.setInt(3, noteid);
			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteNotesById(int noteid) {
		boolean f = false;
		try {
			String query = "delete from notes where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, noteid);
			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
