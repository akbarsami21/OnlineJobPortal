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

@WebServlet("/changePass")
public class UserPassChangServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String newpass = req.getParameter("password");
			

			UserDao dao = new UserDao(ConnectionProvider.getConnection()); //connection with database
			User u = new User();
			u.setId(id);
			u.setPassword(newpass);
			

			boolean f = dao.updateUserPass(u); //updateUserPass method
			
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Password Changed SuccessFully");
				resp.sendRedirect("userChngPass.jsp");
			} else {
				session.setAttribute("succMsg", "Something Went Wrong On Server");
				resp.sendRedirect("userChngPass.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
