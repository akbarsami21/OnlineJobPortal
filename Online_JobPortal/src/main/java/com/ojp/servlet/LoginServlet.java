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

@WebServlet("/LogIn")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String email = req.getParameter("email");
			String pass = req.getParameter("password");
			User u = new User();
			HttpSession session = req.getSession();
			    u.setRole("user");
				UserDao dao=new UserDao(ConnectionProvider.getConnection()); //connection with database
			    User user=dao.login(email, pass);  //login method
			    
			    if(user!=null) {
			    	session.setAttribute("userobj", user);
			    	resp.sendRedirect("userProfile.jsp");
			    }else {
			    	session.setAttribute("succMsg", "Invalid Email and PassWord");
			    	resp.sendRedirect("login.jsp");
			    }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
