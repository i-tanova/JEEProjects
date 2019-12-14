<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student tracker app</title>
<link type="text/css" rel="stylesheet" href="css/style.css"></link>
</head>
<body>

	<input type="button" value="Add student"
		onclick="window.location.href='add-student.jsp'; return false;"
		class="add-student-button">
	</input>

	<div id="wrapper">
		<div id="header">
			<h2>Students List</h2>
		</div>
	</div>

	<div id="container">

		<div id="content">
			<table>
				<tr>
					<th>First name</th>
					<th>Last name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

				<c:forEach var="temp" items="${STUDENTS}">
					<!-- This creates url for links  -->
					<c:url var="updateLink" value="StudentControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="id" value="${temp.id}" />
					</c:url>
					
					<c:url var="deleteLink" value="StudentControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="id" value="${temp.id}" />
					</c:url>
					<tr>
						<td>${temp.firstname}</td>
						<td>${temp.lastname}</td>
						<td>${temp.email}</td>
						<td><a href="${updateLink}">Update</a> 
						| 
						<a onclick="if(!(confirm('Are you shure?'))) return false" href="${deleteLink}">Delete</a></td>
					</tr>
				</c:forEach>


			</table>

		</div>
	</div>

</body>
</html>