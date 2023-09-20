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
import com.ojp.entites.Job;

@WebServlet("/updateJob")
public class UpdateJobServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String tittle=req.getParameter("tittle");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String description=req.getParameter("desc");
			
			Job j=new Job();
			j.setId(id);
			j.setTittle(tittle);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(description);
			
			
			HttpSession session=req.getSession();
			JobDao dao=new JobDao(ConnectionProvider.getConnection()); //connection with database
		   
			boolean f=dao.updateJob(j); //updateJob method
		    
		    if(f){
		    	session.setAttribute("SuccMsg", "Job Update SuccessFully!!");
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
