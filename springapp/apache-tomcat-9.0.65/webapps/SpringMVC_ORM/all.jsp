<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Show contacts</h2>
	<table border="1">
		<t:forEach var="contact" items="${clist }">
			<tr>
				<td> ${contact.cid} </td>
				<td> ${contact.uid} </td>
				<td> ${contact.fnanme} </td>
				<td> ${contact.lname} </td>
				<td> ${contact.email} </td>
				<td> ${contact.contactno} </td>	
				<td> <a href="edit?cid=${contact.cid}"> EDIT </a></td>
				<td> <a href="delete?cid=${contact.cid}"> DELETE </a> </td>
			</tr>
		</t:forEach>
	</table>
	<br/>
	<a href="create"> Create new contact </a>
</body>
</html>