<%@ page contentType="text/html;charset=UTF-8" %>
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

<!-- Hiển thị thông báo lỗi từ servlet -->
<%
String message = (String) request.getAttribute("message");
if (message != null) {
%>
<p style="color:red;"><%= message %></p>
<%
}
%>

<h3>Your information:</h3>
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
</body>
</html>
