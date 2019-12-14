<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, com.tanovai.tagdemo.Student"%>
<!DOCTYPE html>
<html>
<head>
<%
	String[] cities = new String[] { "Sofia", "Plovdiv", "Burgas" };
	pageContext.setAttribute("citiesAttr", cities);

	List<Student> data = new ArrayList();
	data.add(new Student("Jhon", "Dow", false));
	data.add(new Student("Ivan", "Borisow", true));
	data.add(new Student("Jakob", "Irank", false));

	pageContext.setAttribute("students", data);
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--  Loops with core function forEach -->
	<c:forEach var="city" items="${citiesAttr}">
   ${city} <br />
	</c:forEach>


	<c:forEach var="student" items="${students}">
   ${student.firstName},
    ${student.lastName} 
    ${student.goldCustomer } <br />
	</c:forEach>

<!--  Create table from list -->

	<table border=1>
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Is Gold Customer</th>
			<th>Discount</th>
			<th>Discount 2</th>
		</tr>

		<c:forEach var="student" items="${students}">
			<tr>
				<td>${student.firstName}</td>
				<td>${student.lastName}</td>
				<td>${student.goldCustomer}</td>
				<td>
				
				<!--  Core function IF -->
				<c:if test="${student.goldCustomer}">
				  Special Discount
				</c:if>
				
				<c:if test="${not student.goldCustomer}">
				  NO
				</c:if>
				
				</td>
				
				<td>
				
				<!--  Core function choose -->
				<c:choose>
				<c:when test="${student.goldCustomer}">
				  Special Discount
				</c:when>
				
				<c:otherwise>
				  NO
				</c:otherwise>
				
				</c:choose>
				
				</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>