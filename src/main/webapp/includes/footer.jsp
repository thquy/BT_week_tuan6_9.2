<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<hr>
<p style="font-size: small; color: gray;">
    &copy; <fmt:formatDate value="${requestScope.currentDate}" pattern="yyyy"/> Murach Books. All rights reserved.
</p>
