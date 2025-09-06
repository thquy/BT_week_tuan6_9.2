<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thanks</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<h2>Thanks for joining our email list</h2>

<p>Email: ${requestScope.user.email}</p>
<p>First Name: ${requestScope.user.firstName}</p>
<p>Last Name: ${requestScope.user.lastName}</p>

<hr>
<p>Current Date: <fmt:formatDate value="${requestScope.currentDate}" pattern="yyyy-MM-dd HH:mm"/></p>
<p>Customer Service Email: ${initParam.custServEmail}</p>

<h3>First two users in session:</h3>
<c:forEach var="u" items="${sessionScope.users}" begin="0" end="1">
    <p>${u.firstName} ${u.lastName} (${u.email})</p>
</c:forEach>

<form action="emailList" method="post">
    <input type="hidden" name="action" value="join">
    <input type="submit" value="Return">
</form>

<jsp:include page="includes/footer.jsp"/>
</body>
</html>
