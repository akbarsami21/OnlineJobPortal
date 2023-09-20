package com.ojp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ojp.dao.AdminDao;
import com.ojp.db.ConnectionProvider;
import com.ojp.entites.Admin;

@WebServlet("/adminSignup")
public class AdminRegServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("admin_name");
		String gender = req.getParameter("gender");
		String address = req.getParameter("admin_address");
		String email = req.getParameter("admin_email");
		String dob = req.getParameter("admin_dob");
		String password = req.getParameter("admin_password");
		String pic = req.getParameter("admin_pic");
		String adminId=req.getParameter("admin_id");

		AdminDao dao = new AdminDao(ConnectionProvider.getConnection());//connection with database
		Admin u = new Admin(name, gender, address, email, dob, password, pic,adminId);

		HttpSession session = req.getSession();
		
		boolean f = dao.addAdmin(u);// addAdmin method
		
		
		if (f) {
			session.setAttribute("SuccMsg", "Registration SuccessFully");
			resp.sendRedirect("adminSignup.jsp");
		} else {
			session.setAttribute("SuccMsg", "Something Went Wrong on Server!");
			resp.sendRedirect("adminSignup.jsp");
		}

	}

}
