<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login and Registration</title>
</head>
<body>
	<h1>Welcome!</h1>
	<h3>Join our growing community.</h3>
	<div class="container">
		<h1>Register</h1>
		<form:form action="/register" method="post" modelAttribute="newUser">
			<p>
				<form:label path="userName">User name:</form:label>
				<form:errors path="userName"/>
				<form:input path="userName"/>
			</p>
			<p>
				<form:label path="email">Email:</form:label>
				<form:errors path="email"/>
				<form:input path="email"/>
			</p>
			<p>
				<form:label path="password">Password:</form:label>
				<form:errors path="password"/>
				<form:input type="password" path="password"/>
			</p>
			<p>
				<form:label path="confirmedPassword">Confirm Password:</form:label>
				<form:errors path="confirmedPassword"/>
				<form:input type="password" path="confirmedPassword"/>
			</p>
			<button type=submit>Submit</button>
		</form:form>
		<h1>Login</h1>
		<form:form action="/login" method="post" modelAttribute="newLogin">
			<p>
				<form:label path="email">Email:</form:label>
				<form:errors path="email"/>
				<form:input path="email"/>
			</p>
			<p>
				<form:label path="password">Password:</form:label>
				<form:errors path="password"/>
				<form:input type="password" path="password"/>
			</p>
			<button type=submit>Submit</button>
		</form:form>
	</div>
</body>
</html>