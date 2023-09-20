package com.ojp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ojp.dao.JobDao;
import com.ojp.db.ConnectionProvider;

@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			JobDao dao=new JobDao(ConnectionProvider.getConnection()); //connection with database
			
			boolean f=dao.deleteJobs(id); //deleteJobs method
			
			
			HttpSession session=req.getSession();		    
		    if(f){
		    	session.setAttribute("SuccMsg", "Job Delete SuccessFully!!");
		    	resp.sendRedirect("viewJob.jsp");
		    }else {
		    	session.setAttribute("SuccMsg", "Something Went Wrong On Server!");
		    	resp.sendRedirect("viewJob.jsp");
		    
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
