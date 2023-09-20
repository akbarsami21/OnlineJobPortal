<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.ojp.db.*" %>
<%@ page import="com.ojp.dao.*" %>
<%@ page import="com.ojp.entites.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User: View Job</title>
    <%@ include file="AllComponent/allCss.jsp" %>   <!--add CSS file -->
    <link rel="icon" href="pics/logo.png" type="image/x-icon">
</head>
<body style="background-color: #f0f1f2;">
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <%@ include file="AllComponent/navbar.jsp" %><br>   <!--add navbar -->

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center text-primary">All Jobs</h2>
                <%
                String loc = request.getParameter("loc");
                String cat = request.getParameter("cat");

                JobDao dao = new JobDao(ConnectionProvider.getConnection());
                List<Job> list = null;

                if ("lo".equals(loc) || "ca".equals(cat)) {
                    list = dao.getJobsORLocationAndCate(cat, loc); // method
                } else {
                    list = dao.getJobsAndLocationAndCate(cat, loc);  // method
                }

                if (list.isEmpty()) {
                %>
                <h4 class="text-center text-danger">Job Not Available</h4>
                <%
                } else {
                    for (Job j : list) {
                %>
                <div class="card mt-2">
                    <div class="card-body">
                        <div class="text-center text-primary">
                            <i class="far fa-clipboard fa-3x"></i>
                        </div><br>
                        <h3><%= j.getTittle() %></h3>
                        <%
                        String description = j.getDescription();
                        if (description.length() > 0 && description.length() < 120) {
                        %>
                        <p><%= description %></p>
                        <%
                        } else {
                        %>
                        <p><%= description.substring(0, Math.min(description.length(), 250)) %>...</p>
                        <%
                        }
                        %>
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm"
                                    value="Location: <%= j.getLocation() %>" readonly>
                            </div>
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm"
                                    value="Category: <%= j.getCategory() %>" readonly>
                            </div>
                        </div>
                        <h6>
                            Publish Date: <%= j.getPdate().toString() %></h6>
                        <div class="text-center">
                            <a href="one_view.jsp?id=<%= j.getId() %>"
                                class="btn btn-sm bg-success text-white">View More</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                }
                %>
            </div>
        </div>
    </div>
</body>
</html>
