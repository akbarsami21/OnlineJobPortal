package com.ojp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ojp.dao.NotesDao;
import com.ojp.db.ConnectionProvider;



@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uid = Integer.parseInt(req.getParameter("uid"));
		String tittle = req.getParameter("tittle");
		String content = req.getParameter("content");

		NotesDao pd = new NotesDao(ConnectionProvider.getConnection()); //connection with database
		
		boolean f = pd.AddNotes(tittle, content, uid);   // addNotes method
		
		if (f) {
			System.out.println("Data inserted");
			resp.sendRedirect("viewNotes.jsp");
		} else {
			resp.sendRedirect("addNotes.jsp");
			System.out.println("data not inserted");
		}
	}

}
