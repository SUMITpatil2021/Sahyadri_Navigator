<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<f:form action="update" modelAttribute="cont">
	
	    Enter Cid:
		<f:input path="cid" disabled="true"/>
		<br/><br/>
		
		Enter Fname:
		<f:input path="fnanme"/>
		<br/><br/>
		
		Enter Lname:
		<f:input path="lname"/>
		<br/><br/>
		
		Enter uid:
		<f:input path="uid"/>
		<br/><br/>
		
		Enter password:
		<f:input path="password"/>
		<br/><br/>
		
		Enter email:
		<f:input path="email"/>
		<br/><br/>
		
		Enter contactno:
		<f:input path="contactno"/>
		<br/><br/>
		<input type="submit" value="Update" />
		
	</f:form>
</body>
</html>