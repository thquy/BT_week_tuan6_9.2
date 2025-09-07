<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="murach.business.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey Result</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<img src="styles/murach.jpg" alt="Murach Logo" style="width:120px;height:auto;">

<%
    // Mở rộng 9-1: lưu cookie firstName để index.jsp có thể chào user
    Object userObj = request.getAttribute("user");
    if (userObj instanceof User) {
        User u = (User) userObj;
        if (u.getFirstName() != null && !u.getFirstName().isEmpty()) {
            javax.servlet.http.Cookie c =
                    new javax.servlet.http.Cookie("firstName", u.getFirstName());
            c.setMaxAge(60 * 60 * 24 * 30); // 30 ngày
            response.addCookie(c);
        }
    }
%>

<h2 style="color:green;">Thanks for taking our survey!</h2>
<p>Here is the information that you entered:</p>

<table border="0" cellpadding="5">
    <tr><td><b>Email:</b></td><td><c:out value="${user.email}"/></td></tr>
    <tr><td><b>First Name:</b></td><td><c:out value="${user.firstName}"/></td></tr>
    <tr><td><b>Last Name:</b></td><td><c:out value="${user.lastName}"/></td></tr>
    <tr><td><b>Date of Birth:</b></td><td><c:out value="${user.dob}"/></td></tr>
    <tr><td><b>Heard From:</b></td><td><c:out value="${user.heardFrom}"/></td></tr>
    <tr><td><b>Updates:</b></td><td><c:out value="${user.wantsUpdates}"/></td></tr>
    <tr><td><b>Contact Via:</b></td><td><c:out value="${user.contactVia}"/></td></tr>
</table>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
