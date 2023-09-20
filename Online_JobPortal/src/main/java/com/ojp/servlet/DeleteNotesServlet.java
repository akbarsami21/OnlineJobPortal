package com.ojp.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ojp.dao.NotesDao;
import com.ojp.db.ConnectionProvider;

@WebServlet("/DeleteNotesServlet")
public class DeleteNotesServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	Integer noteid=Integer.parseInt(req.getParameter("note_id"));
	
	NotesDao dao=new NotesDao(ConnectionProvider.getConnection()); //connection with database
	
	boolean f=dao.deleteNotesById(noteid); //deleteNotesById method
	
	HttpSession session=null;
	if(f) {
		session=req.getSession();
		session.setAttribute("update-msg", "Notes Delete Successfully!!");
	    resp.sendRedirect("viewNotes.jsp");
	}else {
		session=req.getSession();
		session.setAttribute("wrong-msg", "Something Went Wrong on server!!");
	    resp.sendRedirect("viewNotes.jsp");
	}
	}

}
