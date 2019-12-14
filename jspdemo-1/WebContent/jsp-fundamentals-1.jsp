<%@page import="com.itan.jspdemo.JSPUtils"%>
<html>
<body>

<!--  CAll Simple Java code inside < % =  % > -->
<h3> Hello world of Java</h3>

Time on the server is <%= new java.util.Date() %>

<p>
Boolean expression <%= 8 < 7 %>
</p>

<p>
Math expression <%= 8*8 %>
</p>

<!-- Call more complicated Java in Scriplets < %  % > -->
<h3>Scriplets Expression</h3>

<p>

For loop <%
   for (int i=0; i< 4; i++){
	   out.println("<b>"+i+"</b>");
   }
%>
</p>

<!--  Declare Java method inside declaration expression < % !  % > -->
<h3>JSP Declaration Expression</h3>

<p>
<%! String returnUpperCase(String text){
	return text.toUpperCase();
}%>

My name is <%= returnUpperCase("Jhoe") %>
</p>

<h3>Call a class inside of package</h3>


<!--  CAll Java method declared from user inisde src/java packet -->
<!--  You need to write include < % @page import="package" % >  -->
<p>
My name is <%= JSPUtils.returnUpperCase("Jhoe") %>
</p>



<h3> Built-in objects</h3>

<!--  Request is build in project -->
<!--  More here https://www.tutorialspoint.com/jsp/jsp_implicit_objects.htm -->
<p>
 User header <%=request.getHeader("User-Agent") %>
 </br>
 
 User language <%=request.getLocale() %>
</p>

<!--  Include code from other jsp or html pages* -->
<h3> Include other files</h3>

<jsp:include page="my-header.html"></jsp:include>
<jsp:include page="my-footer.jsp"></jsp:include>


</body>
</html>