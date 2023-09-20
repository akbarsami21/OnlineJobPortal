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

@WebServlet("/updateProfile")
public class UpdateUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String qualification = req.getParameter("qualification");
			String address = req.getParameter("address");
			String email = req.getParameter("email");
			String dob = req.getParameter("dob");
			

			UserDao dao = new UserDao(ConnectionProvider.getConnection()); //connection with database
			User u = new User();
			u.setId(id);
			u.setName(name);
			u.setQualification(qualification);
			u.setAddress(address);
			u.setEmail(email);
			u.setDob(dob);
			

			boolean f = dao.updateUser(u); //updateUser method
			
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Profile Update SuccessFully");
				resp.sendRedirect("userProfile.jsp");
			} else {
				session.setAttribute("succMsg", "Profile Update SuccessFully");
				resp.sendRedirect("userProfile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
