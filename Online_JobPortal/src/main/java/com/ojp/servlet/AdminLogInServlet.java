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

@WebServlet("/AdminLogIn")
public class AdminLogInServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
            String adminId=req.getParameter("adminid");
			String email = req.getParameter("adminemail");
			String pass = req.getParameter("adminpassword");
			Admin u = new Admin();
			HttpSession session = req.getSession();
			u.setRole("admin");
			AdminDao dao = new AdminDao(ConnectionProvider.getConnection());  //connection with database
			
			
			Admin user = dao.login(adminId,email, pass); //login method
			
			
			if (user != null) {
				session.setAttribute("userobj", user);
				resp.sendRedirect("admin.jsp");
			} else {
				session.setAttribute("succMsg", "Invalid Email and PassWord");
				resp.sendRedirect("adminLogin.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
