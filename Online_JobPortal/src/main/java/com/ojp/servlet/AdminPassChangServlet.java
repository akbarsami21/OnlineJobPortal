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


@WebServlet("/adminChangePass")
public class AdminPassChangServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String newpass = req.getParameter("password");
			

			AdminDao dao = new AdminDao(ConnectionProvider.getConnection()); //connection with database
			Admin u = new Admin();
			u.setId(id);
			u.setPassword(newpass);
			

			boolean f = dao.updateAdminPass(u); //updateAdminPass method
			
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Password Changed SuccessFully");
				resp.sendRedirect("adminChngPass.jsp");
			} else {
				session.setAttribute("succMsg", "Something Went Wrong On Server");
				resp.sendRedirect("adminChngPass.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
