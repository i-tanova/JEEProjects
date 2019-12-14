<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Function tags</title>
</head>
<body>

<!-- String length function  -->
<c:set var="data" value="DataStr" />
Length of ${data} is ${fn:length(data)}

<!-- String toUpperCase function  -->
<br/><br/>

Uppercase is ${fn:toUpperCase(data)}

<!-- Start with function  -->
<br/><br/>

Starts with Data? ${fn:startsWith(data, "Data")}


<!-- Split function  -->

<br/><br/>

<c:set var="arrayStr" value="value1, value2, value3" />
<c:set var="array" value="${fn:split(arrayStr,',')}" />

<c:forEach var="arrayItem" items="${array}" >
${arrayItem}
<br/><br/>
</c:forEach>

<!-- Join array function  -->
<br/><br/>

<c:set var="joinedArray" value="${fn:join(array, '*')}"/>
${joinedArray}

</body>
</html>