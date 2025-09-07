<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="murach.business.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thanks</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<%
    // Lưu cookie firstName
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

<h2>Thanks for joining our email list</h2>

<p>Email: <c:out value="${requestScope.user.email}"/></p>
<p>First Name: <c:out value="${requestScope.user.firstName}"/></p>
<p>Last Name: <c:out value="${requestScope.user.lastName}"/></p>

<hr>
<p>Current Date:
    <fmt:formatDate value="${requestScope.currentDate}" pattern="yyyy-MM-dd HH:mm"/>
</p>
<p>Customer Service Email: <c:out value="${initParam.custServEmail}"/></p>

<h3>First two users in session:</h3>
<c:forEach var="u" items="${sessionScope.users}" begin="0" end="1">
    <p><c:out value="${u.firstName}"/> <c:out value="${u.lastName}"/> (<c:out value="${u.email}"/>)</p>
</c:forEach>

<form action="emailList" method="post">
    <input type="hidden" name="action" value="join">
    <input type="submit" value="Return">
</form>

<jsp:include page="includes/footer.jsp"/>
</body>
</html>
