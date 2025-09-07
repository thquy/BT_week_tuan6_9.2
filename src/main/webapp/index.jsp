<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Catalog</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<h2>Available Products</h2>

<table border="1" cellpadding="6" cellspacing="0">
    <tr style="background:#f2f2f2;">
        <th>Code</th>
        <th>Description</th>
        <th>Price</th>
    </tr>
    <c:forEach var="p" items="${products}">
        <tr>
            <td><c:out value="${p.code}"/></td>
            <td><c:out value="${p.description}"/></td>
            <td><c:out value="${p.priceFormatted}"/></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
