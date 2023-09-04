<%@page import="java.util.Base64"%>
<%@page import="training.demo.entities.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Dashboard</title>

<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
        nav {
            background-color: #444;
            text-align: center;
        }
        nav a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
        }
        nav a:hover {
            background-color: #555;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	p {
		width: 500px;
	}
	
	table, p {
		margin: auto;
		font-size: 20px;
	}
	
	caption {
		margin-bottom:20px;
		text-decoration: underline;
		color: black;
	}
	
	th, td {
		padding:5px;
	}
	
	a {
		text-decoration: none;
		width: 200px;
		
		color: black;
		padding: 5px;
		border-radius: 5px;
		margin-left:10px;
	}
</style>
</head>
<body>
    <header>
        <h1>Trainer Admin Portal</h1>
    </header>
    <nav>
    	<button><a href="<%= request.getContextPath() %>/openDashboard">Home Page</a></button>
    	<button><a href="<%= request.getContextPath() %>/courseForm">Course</a></button>
    	<button><a href="<%= request.getContextPath() %>/trainer">Trainer</a></button>
    	<button><a href="<%= request.getContextPath() %>/training">Training</a></button>
    </nav>
	<% 
		List<Course> listOfCourse = (List)request.getAttribute("listOfCourse");
	%>
	<p></p>
	<table>
		<caption>Course List</caption>
		<tr>
			<th>S.No</th>
			<th>Course Name</th>
			<th>course Description</th>
			<th>Category</th>
			<th>Audience</th>
			<th>benefits</th>
			
		</tr>
		
		<!-- Dynamic No of rows depending upon records in the database -->
		
		<% 
			int serialNo = 0;
			for(Course course : listOfCourse) {
				
				
			%>
		<tr>
			<td><%= course.getCourseId() %></td>
			<td><%= course.getCourseName() %></td>
			<td><%= course.getDescription()%></td>
			<td><%= course.getCategory()%></td>
			<td><%= course.getIntendedAudience()%></td>
			<td><%= course.getBenefits()%></td>
			
			<td>
				<button><a href="<%= request.getContextPath() %>/showUpdateCourseFormPage/<%= course.getCourseId() %>">Update</a></button>
			</td>
			<td>
			<button onclick="confirmDelete('<%= request.getContextPath() %>/delete_course/<%= course.getCourseId() %>')">Delete</button>
			</td>
		
		</tr>
		<%} %>
		
		<tr>
		<td colspan = "8" style="padding:10px;text-align:center"><button><a href="<%= request.getContextPath() %>/showAddCourseFormPage">Add course</a></button></td>	
		</tr>

	</table>	
	<p>
	<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
			out.print(message);
		}
		%>
</body>

<script>
    function confirmDelete(deleteUrl) {
        if (confirm("Are you sure you want to delete this course?")) {
            // If the user confirms, redirect to the delete URL
            window.location.href = deleteUrl;
        }
    }
</script>

</html>