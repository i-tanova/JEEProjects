<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Confirmation Title</title>
</head>
<body>

The student is confirmed.

<!--  Read parameter from request -->
First Name: <%= request.getParameter("firstName") %>

<br />
<!--  This is the same as above, just another way to take it -->
Last Name: ${param.lastName}
<br />

Country: ${param.country}

<br />

Language: ${param.language}

<br />

Other languages:
<br />
<ul>
<!--  Get post parameters from multiple choice -->
<%
  String[] languages = request.getParameterValues("languageOther");
if (languages != null) {
  for(String language: languages){
	  out.print("<li>" + language + "</li>");
  }
}
 %>

</ul>

</body>
</html>