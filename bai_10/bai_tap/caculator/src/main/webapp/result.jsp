<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 13-Apr-22
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Kq </h1>
<c:if test="${message eq null}">
    <h2>${first} ${operator} ${second} = ${kq}</h2>
</c:if>

<c:if test="${not empty message }">
    <h2>${message}</h2>
</c:if>
</body>
</html>
