<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>Welcome, <c:out value="${user.userName}"/>!</h1>
	<p>This is your dashboard. Nothing to see yet!</p>
	<a href="http://localhost:8080/logout">Logout</a>
</body>
</html>