<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey Result</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<img src="styles/murach.jpg" alt="Murach Logo" style="width:120px;height:auto;">

<h2 style="color:green;">Thanks for taking our survey!</h2>
<p>Here is the information that you entered:</p>

<table border="0" cellpadding="5">
    <tr><td><b>Email:</b></td><td>${user.email}</td></tr>
    <tr><td><b>First Name:</b></td><td>${user.firstName}</td></tr>
    <tr><td><b>Last Name:</b></td><td>${user.lastName}</td></tr>
    <tr><td><b>Date of Birth:</b></td><td>${user.dob}</td></tr>
    <tr><td><b>Heard From:</b></td><td>${user.heardFrom}</td></tr>
    <tr><td><b>Updates:</b></td><td>${user.wantsUpdates}</td></tr>
    <tr><td><b>Contact Via:</b></td><td>${user.contactVia}</td></tr>
</table>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
