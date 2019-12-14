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
	<div id="wrapper">
		<div id="header">
			<h2>Update Student</h2>
		</div>
	</div>

	<div id="container">

		<div id="content">
			<form action="StudentControllerServlet" method="get">
				<input type="hidden" name="command" value="UPDATE" />
				<input type="hidden" name="id" value="${student.id}" />
				
				<table>
					<tbody>
						<tr>
							<td><label>First Name:</label></td>
							<td><input type="text" name="firstname" value="${student.firstname}"></td>
						</tr>

						<tr>
							<td><label>Last Name:</label></td>
							<td><input type="text" name="lastname" value="${student.lastname}"></td>
						</tr>

						<tr>
							<td><label>Email:</label></td>
							<td><input type="text" name="email" value="${student.email}"></td>
						</tr>

						<tr>
							<td></td>
							<td><input type="submit" value="Update" class="save"></td>
						</tr>

					</tbody>
				</table>

			</form>

			<div style="clear: both;"></div>
			<p>

				<a href="StudentControllerServlet">Back</a>
			</p>
		</div>

	</div>
	</div>

</body>
</html>