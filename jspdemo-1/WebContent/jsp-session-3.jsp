<%@ page import="java.util.*" %>

<html>
<body>

<!-- Store list with to do items inside session object -->
<!--    IMPORTANT  -->
<!--    Session is different object for different browsers and users it is stored until browser is killed  -->
<!--  More her https://www.w3adda.com/jsp-tutorial/jsp-session  -->
Enter to do list:

<form action="jsp-session-3.jsp">
<input type="text" name="todoItem" />
<input type="submit" value="Add" />
</form>

<%
//Get current list from the session if available
 String todoItem = request.getParameter("todoItem");

if(todoItem != null && !todoItem.isEmpty()){

ArrayList<String> items = (ArrayList<String>)session.getAttribute("todoItem");

if(items == null){
	 items = new ArrayList<String>();
	 // Set list with todo items in the session
	 session.setAttribute("todoItem", items);
}

items.add(todoItem);
response.sendRedirect("jsp-session-3.jsp");

} 
%>
 

<br />
<h1>TODO list:</h1>

<ol>
<%
//Display list with to do items from session if avaialble
ArrayList<String> items = (ArrayList<String>)session.getAttribute("todoItem");
if(items != null){
	for(String item: items){
		out.print("<li>" + item + "</li>");
	}
}
%>
</ol>

</body>

</html>