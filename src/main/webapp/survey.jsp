<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey Result</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
<h2>Thanks for taking our survey!</h2>

<p>Here is the information that you entered:</p>
<table>
    <tr><td>Email:</td><td>${user.email}</td></tr>
    <tr><td>First Name:</td><td>${user.firstName}</td></tr>
    <tr><td>Last Name:</td><td>${user.lastName}</td></tr>
    <tr><td>Date of Birth:</td><td>${user.dob}</td></tr>
    <tr><td>Heard From:</td><td>${user.heardFrom}</td></tr>
    <tr><td>Updates:</td><td>
        <c:choose>
            <c:when test="${user.wantsUpdates == 'Yes'}">Yes</c:when>
            <c:otherwise>No</c:otherwise>
        </c:choose>
    </td></tr>
    <tr><td>Contact Via:</td><td>${user.contactVia}</td></tr>
</table>

<jsp:include page="/includes/footer.jsp"/>
</body>
</html>
