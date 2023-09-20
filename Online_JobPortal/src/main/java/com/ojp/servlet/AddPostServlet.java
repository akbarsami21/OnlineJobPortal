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

@WebServlet("/addJob")
public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String tittle=req.getParameter("tittle");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String description=req.getParameter("desc");
			
			Job j=new Job();
			j.setTittle(tittle);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(description);
			
			HttpSession session=req.getSession();
			JobDao dao=new JobDao(ConnectionProvider.getConnection()); //connection with database
			
		    boolean f=dao.addJob(j); // addJob method
		    
		    
		    if(f){
		    	session.setAttribute("SuccMsg", "Job Post SuccessFully!!");
		    	resp.sendRedirect("addJob.jsp");
		    }else {
		    	session.setAttribute("SuccMsg", "Something Went Wrong On Server!");
		    	resp.sendRedirect("addJob.jsp");
		    
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
