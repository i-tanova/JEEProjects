<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie home</title>
</head>

<body>
<%
Cookie[] cookies = request.getCookies();
String language = "Java";
 
if(cookies != null){
	for(Cookie cookie : cookies){
		if(cookie.getName().equals("language")){
		    language = cookie.getValue();
			break;
		}
	}
}
%>
Your language is <%=language%>

<a href="jsp-cookies-4.jsp">Personalize</a>

</body>
</html>