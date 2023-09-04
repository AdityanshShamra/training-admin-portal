<%@page import="java.util.Base64"%>
<%@page import="training.demo.entities.Trainer"%>
<%@page import="training.demo.entities.Training"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trainer dashborad</title>
<style>
        /* Add your CSS styles here */
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
	width: 300px;
}
 
table, p {
	margin: auto;
	font-size: 20px;
}
 
caption {
	margin-bottom: 20px;
	text-decoration: underline;
	color: black;
}
 
th, td {
	padding: 5px;
}
 
a {
	text-decoration: none;
	width: 200px;
	
	color: black;
	padding: 5px;
	border-radius: 5px;
	margin-left: 10px;
}
.center {
  margin-left: auto;
  margin-right: auto;
}	
	
	
</style>
</head>
<body>

    <header>
        <h1>Training Admin Portal</h1>
    </header>
	 <nav>
    	<button><a href="<%= request.getContextPath() %>/openDashboard">Home Page</a></button>
    	<button><a href="<%= request.getContextPath() %>/courseForm">Course</a></button>
    	<button><a href="<%= request.getContextPath() %>/trainer">Trainer</a></button>
    	<button><a href="<%= request.getContextPath() %>/training">Training</a></button>
    </nav>
	<% 
		List<Trainer> listOfTrainer = (List)request.getAttribute("listOfTrainer");
	%>	
	<p></p>
	<table>
		<caption>Trainer List</caption>
		<tr>
			<th>S. No</th>
			<th>Trainer Name</th>
			<th>qualification</th>
			<th>Description</th>
			<th>year of expercience</th>
			
		</tr>
		
		<!-- Dynamic No of rows depending upon records in the database -->
		
		<% 
			int serialNo = 0;
			for(Trainer trainer : listOfTrainer) {
				
				
			%>
		<tr>
			<td><%=trainer.getTrainerId() %></td>
			<td><%=trainer.getTrainerName() %></td>
			<td><%=trainer.getQualification()%></td>
			<td><%=trainer.getTrainerDescription()%></td>
			<td><%=trainer.getYear_of_exp() %></td>	
		
			<td>
			<button><a href="<%=request.getContextPath() %>/updateTrainer/<%=trainer.getTrainerId() %>">UpdateTrainer</a></button>	
			</td>
			<td>
			<button onclick="confirmDelete('<%=request.getContextPath()%>/deletetrainer/<%=trainer.getTrainerId() %>')">DeleteTrainer</button>
			</td>
		
		</tr>
		
		
		<%} %>
		
</table>
<button>
		   <a href="<%=request.getContextPath()%>/openDashboardTrainer">Dashboard</a>
		</button>
	
	<p>
		<% 
			String message = (String)request.getAttribute("message"); 
			if(message!=null) {
				out.print(message);
			}
		%>
	
	</p>
</body>
<script>
    function confirmDelete(deleteUrl) {
        if (confirm("Are you sure you want to delete this trainer?")) {
            // If the user confirms, redirect to the delete URL
            window.location.href = deleteUrl;
        }
    }
</script>

</html>