<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<img src="styles/murach.jpg" alt="Murach Logo" style="width:120px;height:auto;">

<h2>Survey</h2>
<p>If you have a moment, we'd appreciate it if you would fill out this survey.</p>

<c:if test="${not empty message}">
    <p style="color:red;">${message}</p>
</c:if>

<form action="emailList" method="post">
    <input type="hidden" name="action" value="add">

    <label>First Name:</label>
    <input type="text" name="firstName"><br>

    <label>Last Name:</label>
    <input type="text" name="lastName"><br>

    <label>Email:</label>
    <input type="text" name="email"><br>

    <label>Date of Birth:</label>
    <input type="date" name="dob"><br><br>

    <h3>How did you hear about us?</h3>
    <input type="radio" name="hear" value="search" checked> Search engine
    <input type="radio" name="hear" value="word"> Word of mouth
    <input type="radio" name="hear" value="social"> Social Media
    <input type="radio" name="hear" value="other"> Other
    <br><br>

    <h3>Would you like to receive announcements about new CDs and special offers?</h3>
    <input type="checkbox" name="offers" value="yes"> YES, I'd like that.<br>
    <input type="checkbox" name="emailOffers" value="yes"> YES, please send me email announcements.<br><br>

    <label>Please contact me by:</label>
    <select name="contact">
        <option>Email or postal mail</option>
        <option>Email only</option>
        <option>Postal mail only</option>
    </select>
    <br><br>

    <input type="submit" value="Submit" id="submit">
</form>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
