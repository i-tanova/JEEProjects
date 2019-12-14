<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good job</title>
</head>
<%
// Set Cookies
 String language = request.getParameter("language");
if(language != null){
	Cookie cookie = new Cookie("language", language);
	cookie.setMaxAge(60*60);
	response.addCookie(cookie);
}
%>
<body>
 We've set your language to ${param.language}!
 <a href="jsp-cookie-home-4.jsp">Return to home page</a>
</body>
</html>