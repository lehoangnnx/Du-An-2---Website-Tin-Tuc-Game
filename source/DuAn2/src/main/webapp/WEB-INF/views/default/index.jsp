<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trang Home</title>
</head>
<body>
	<h1>Home</h1>
	<security:authorize access="hasRole('MEMBER')">
    This text is only visible to a user
    <br />
	</security:authorize>
	<security:authorize access="hasRole('ADMIN')">
    This text is only visible to an admin
    <br />
	</security:authorize>
	<security:authorize access="hasRole('ROLE_ADMIN')" >
	This text is only visible to an admin
	</security:authorize>
	<h2>Welcome ${pageContext.request.userPrincipal.name}</h2>
</body>
</html>