package com.ojp.entites;

import java.util.Date;

public class Notes {
	private int id;
	private String tittle;
	private String content;
	private Date pdate;
	private User user;

	public Notes(int id, String tittle, String content, Date pdate, User user) {
		super();
		this.id = id;
		this.tittle = tittle;
		this.content = content;
		this.pdate = pdate;
		this.user = user;
	}

	public Notes() {
		super();

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTittle() {
		return tittle;
	}

	public void setTittle(String tittle) {
		this.tittle = tittle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
