package com.ojp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ojp.dao.UserDao;
import com.ojp.db.ConnectionProvider;
import com.ojp.entites.User;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("user_name");
		String qualification=req.getParameter("user_qua");
		String gender=req.getParameter("gender");
		String address=req.getParameter("user_address");
		String email=req.getParameter("user_email");
		String dob=req.getParameter("user_dob");
		String password=req.getParameter("user_password");
		String pic=req.getParameter("user_pic");
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection()); //connection with database
		User u=new User(name,qualification,gender,address,email,dob,password,pic);
		HttpSession session=req.getSession();
		
		boolean f=dao.addUser(u);// addUser method
		
		if(f) {
			session.setAttribute("SuccMsg", "Registration SuccessFully");
		    resp.sendRedirect("signup.jsp");
		}else {
			session.setAttribute("SuccMsg", "Something Went Wrong on Server!");
		    resp.sendRedirect("signup.jsp");
		}
		
		
	}
   
}
