<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<th>First Name</th>
<th>Last Name</th>

<c:forEach var="student" items="${students}">
<tr>
<td>
  <c:out value = "${student.firstname}"></c:out>
  </td>
  <td>
   <c:out value = "${student.lastname}"></c:out>
   </td>
</tr>
</c:forEach>

</table>
</body>
</html>