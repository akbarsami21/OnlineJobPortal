package com.ojp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ojp.dao.NotesDao;
import com.ojp.db.*;

@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			Integer noteid = Integer.parseInt(req.getParameter("noteid"));
			String tittle = req.getParameter("tittle");
			String content = req.getParameter("content");

			NotesDao dao = new NotesDao(ConnectionProvider.getConnection()); //connection with database
			boolean f = dao.postUpdate(noteid, tittle, content); //postUpdate method
			
			if (f) {
				System.out.println("data updated successfully!!");
				HttpSession session = req.getSession();
				session.setAttribute("update-msg", "Notes Update Successfully.");
				resp.sendRedirect("viewNotes.jsp");
			} else {
				System.out.println("data not updated!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
